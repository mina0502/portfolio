'''
```
                (ex29.py)
    

    구현 기능

 - 사용자 등록기능

 - 로그인 / 로그아웃

 - 글 등록

 - follow / unfollow

 - 글목록(사용자, 공용)


 [기술요소]

 - DB(Sqlite) 이용

 - gravatar 이용

 - Password 해싱

 - Jinja2 템플릿 엔진
 
```
'''

import os
import sqlite3
from contextlib import closing
from hashlib import md5 #hash md5 ==> gravatar img
import time
from datetime import datetime
from werkzeug.security import generate_password_hash,check_password_hash #hash method
from flask import Flask,request,session,url_for,render_template,redirect,g,flash,abort
from bs4 import BeautifulSoup
import urllib.request as req


DATABASE= 'project.db'
PER_PAGE= 10
SECRET_KEY='development key'

app= Flask(__name__)
app.config.from_object(__name__)

def connect_db():
    return sqlite3.connect(app.config['DATABASE'])

def query_db(query,args=(),one=False):
    cur = g.db.execute(query,args)
    rv = [dict((cur.description[idx][0],value) for idx,value in enumerate(row))for row in cur.fetchall()]
    return (rv[0] if rv else None)if one else rv

def init_db():
    with closing(connect_db()) as db:
        with app.open_resource('scheme.sql',mode='r')as f:
            db.cursor().executescript(f.read())
        db.commit()
        
def get_user_id(username):
    sql='SELECT user_id FROM user WHERE username = ?'
    rv= g.db.execute(sql,[username]).fetchone()
    return rv[0] if rv else None

def get_user_email(email):
    sql='SELECT email FROM user WHERE email=?'
    rv=g.db.execute(sql,[email]).fetchone()
    return rv[0] if rv else None


def format_datetime(timestamp):
    return datetime.utcfromtimestamp(timestamp).strftime('%Y-%m-%d %H:%M')

#gravatar.com 에서 제공하는 이미지 서비스를 받기위한 함수
def gravatar_url(email,size=80):
    return 'http://www.gravatar.com/avatar/%s?d=identicon&s=%d' % \
           (md5(email.strip().lower().encode('utf-8')).hexdigest(),size)

@app.before_request
def before_request():
    g.db=connect_db()
    g.user = None
    if 'user_id' in session:
        g.user = query_db('select * from user where user_id =?',[session['user_id']],one=True)

@app.teardown_request
def teardown_request(exception):
    if hasattr(g,'db'):
        g.db.close()
        
@app.route('/public')
def public_list():
    sql = '''SELECT message.*,user.* FROM message,user WHERE message.author_id=user.user_id
        order by message.pub_date desc limit ?'''
    messages= query_db(sql,[PER_PAGE])
    return render_template('my_list.html',messages=messages)

@app.route('/')
def my_list():
    error=None
    if not g.user:
        return redirect(url_for('public_list'))
    sql='''SELECT message.*,user.* FROM message,user WHERE message.author_id= user.user_id
        and (user.user_id=? or user.user_id in(SELECT whom_id FROM follower WHERE who_id=?))
        order by message.pub_date desc limit ? '''
    messages= query_db(sql,[session['user_id'],session['user_id'],PER_PAGE])
    
    return render_template('my_list.html',messages=messages,error=error)

@app.route('/register',methods=["GET","POST"])
def register():
    if g.user:
        return redirect(url_for('my_list'))
    error=None
    if request.method=='POST':
        if not request.form['username']:
            error = "input User ID"
        elif not request.form['email']or'@' not in request.form['email']:
            error = "Please Check the Email include in'@'"
        elif not request.form['password']:
            error = "input Password"
        elif request.form['password']!=request.form['password2']:
            error = "Not correct Password"
        elif len(request.form['password'])<4:
            error = "Please input more than 4 digits"
        elif get_user_id(request.form['username']) is not None:#등록된 사용자가 아닌지 검사
            error ="Already UserId"
        elif get_user_email(request.form['email']) is not None:
            error="Already email"
        else:
            #데이터베이스에 등록
            sql= "INSERT INTO user(username,email,pw_hash) VALUES(?,?,?)" # 데이터 보안
            #비밀번호를 DB에 저장할 때 평문이 아닌 암호문을 저장하기 위한 해시함수
            #해시함수 => 백자이그에서 제공하는 함수--> generate_password_hash()
            g.db.execute(sql,[request.form['username'],request.form['email'],generate_password_hash(request.form['password'])])
            g.db.commit()

            flash('Success Register You can Login')
            return redirect(url_for('login'))#View -> endpoint  | Jinja2 -> function
    return render_template('register.html',error=error)

@app.route('/login',methods=['GET','POST'])
def login():
    if g.user:
        return redirect(url_for('my_list'))
    error=None
    if request.method=="POST":
        #유효성 검사
        sql="SELECT * FROM user WHERE username=?"
        user = query_db(sql,[request.form['username']],one=True)
        if user is None:
            error = "Not correct User ID"
        # check_password_hash() 함수는 hash된 암호와 사용자가 입력한 평문 형태의 비밀번호를 비교
        # 값 :True,False
        elif not check_password_hash(user['pw_hash'],request.form['password']): #사용자가 입력한 PW ==> request.form['password'] || pw_hash ==> DB에 저장된 PW
            error = "Not correct Password"
        else:
            flash("Success Login")
            session['user_id']=user['user_id'] #로그인 되어 있음
            return redirect(url_for('my_list'))
    return render_template('login.html',error=error)

@app.route('/<username>')
def user_list(username):
    sql='SELECT * FROM user WHERE username=?'
    profile_user = query_db(sql,[username],one=True)

    if profile_user is None:
        abort(404)
    followed = False
    
# 자신의 follower 확인
    if g.user:
        sql='SELECT 1 FROM follower WHERE follower.who_id= ? and follower.whom_id= ? '#1=> 테이블 갯수만큼 1을 출력 (True 보다 데이터 존재 유무확인)

        followed= query_db(sql,[session['user_id'],profile_user['user_id']],one=True)is not None

# follower 확인후 해당 Message 조회
    sql='''SELECT message.*,user.* FROM message,user
        WHERE user.user_id=message.author_id and user.user_id=?
        order by message.pub_date desc limit ? '''
    messages = query_db(sql,[profile_user['user_id'],PER_PAGE])
    return render_template('my_list.html',messages=messages,followed=followed,profile_user=profile_user)

#follow 등록
@app.route('/<username>/follow')
def follow_user(username):
    if not g.user:
        abort(401)
    whom_id=get_user_id(username)
    if whom_id is None:
        abort(404)
    sql='INSERT INTO follower(who_id,whom_id)VALUES(?,?)'
    g.db.execute(sql,[session['user_id'],whom_id])
    g.db.commit()
    
    flash('followed "%s"'% username)
    return redirect(url_for('user_list',username=username))

@app.route('/<username>/unfollow')
def unfollow_user(username):
    if not g.user:
        abort(401)
    whom_id = get_user_id(username)
    if whom_id is None:
        abort(404)
    sql='DELETE FROM follower WHERE who_id=? and whom_id=?'
    g.db.execute(sql,[session['user_id'],whom_id])
    g.db.commit()

    flash('unfollowed "%s"'% username)
    return redirect(url_for('user_list',username=username))

@app.route('/logout')
def logout():
    flash('Complete Logout')
    session.pop('user_id',None)
    return redirect(url_for('my_list'))


@app.route('/add_message',methods=['POST'])
def add_message():
    if 'user_id' not in session:
        abort(401)
        
    if request.form['text']:
        sql="INSERT INTO message(author_id,text,pub_date)VALUES(?,?,?)"
        g.db.execute(sql,(session['user_id'],request.form['text'],int(time.time())))
        g.db.commit()
        flash("Complete Message")
    return redirect(url_for('my_list'))

@app.route('/<message_id>/del_message',methods=['POST'])
def del_message(message_id):
    if 'user_id' not in session:
        abort(401)
        
    if request.form['del']:
        sql='DELETE FROM message WHERE author_id=? and message_id=?'
        g.db.execute(sql,(session['user_id'],message_id))
        g.db.commit()
       
    return redirect(url_for('my_list'))

@app.route('/page/<int:num>')
def page(num):
    if not g.user:
        return redirect(url_for('public_page'))
    sql='''SELECT message.*,user.* FROM message,user WHERE message.author_id= user.user_id
        and (user.user_id=? or user.user_id in(SELECT whom_id FROM follower WHERE who_id=?))
        order by message.pub_date desc limit ? offset ?'''
    messages= query_db(sql,[session['user_id'],session['user_id'],PER_PAGE,PER_PAGE*num])
    
    return render_template('my_list.html',messages=messages)

@app.route('/public/page/<int:num>')
def public_page(num):
    sql = '''SELECT message.*,user.* FROM message,user WHERE message.author_id=user.user_id
        order by message.pub_date desc limit ? offset ?'''
    messages= query_db(sql,[PER_PAGE,PER_PAGE*num])
    return render_template('my_list.html',messages=messages)


@app.route('/weather',methods=['GET','POST'])
def all():
    url= "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('weather.html',info=info)

@app.route('/seoul',methods=['POST'])
def seoul():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/gangwon',methods=['POST'])
def gangwon():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=105"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/chungbuk',methods=['POST'])
def chungbuk():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=131"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/chungnam',methods=['POST'])
def chungnam():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=133"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/jeollabuk',methods=['POST'])
def jeollabuk():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=146"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/jeollanam',methods=['POST'])
def jeollanam():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=156"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/gyeongbuk',methods=['POST'])
def gyeongbuk():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=143"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/gyeongnam',methods=['POST'])
def gyeongnam():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=159"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

@app.route('/jeju',methods=['POST'])
def jeju():
    url="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=184"
    res=req.urlopen(url)
    soup=BeautifulSoup(res,'html.parser')
    info={}
    
    for location in soup.find_all('location'):
        cityName=location.find('city').string
        weather = location.find('wf').string
        if not (weather in info):
            info[weather]=[]
        info[weather].append(cityName)
    return render_template('portfolio.html',info=info,url=url)

    


#진자 템플릿 필터 설정

app.jinja_env.filters['datetimeformat'] = format_datetime
app.jinja_env.filters['gravatar'] = gravatar_url


if __name__=="__main__":
    if not os.path.isfile(DATABASE):
        init_db()
    app.run()

