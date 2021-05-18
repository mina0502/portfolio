package com.mina.drama;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DramaDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	/******************* DB연결 ***************************/	
	private Connection getConnection(){

		try {
			//Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
			Context initCTX = new InitialContext();
			
			// DB연동 정보를 불러오기(context.xml)
			DataSource ds =
			(DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			
			conn = ds.getConnection();
		} 
		catch (NamingException e) {e.printStackTrace();} 
		catch (SQLException e) {e.printStackTrace();}
		return conn;
	}
	
/********************* DB 닫기 **********************************/

	public void closeDB(){
		try{
			if(rs !=null)
			{
				rs.close();
			}
			if(pstmt!=null)
			{
				pstmt.close();
			}
			if(conn!=null)
			{
				conn.close();
			}
		}catch(SQLException e){
			
		}
	}
/************************************** 모든 드라마 정보 얻기  *************************/
	
public int getProductsNum(){
	conn=getConnection();
	sql = "select count(*) from jpdrama";
	int total_record = 1;
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			total_record = rs.getInt(1);
		} else {
			total_record = 1;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally{
		closeDB();
	}
	return total_record;
}

/************************************* 모든 정보 리스트에 저장 ***********************************/

public ArrayList getDramaList(int PageSize, int record_start_no) {

		conn = getConnection();

		sql = "select * from jpdrama order by jp_date desc limit ? offset ?";

		ArrayList DramaList = new ArrayList();

		JPDramaBean jb = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PageSize);
			pstmt.setInt(2, record_start_no - 1);
			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			while (rs.next()) {
				jb = new JPDramaBean();
				jb.setJp_filename(rs.getString("jp_filename"));
				jb.setJp_name(rs.getString("jp_name"));
				jb.setJp_description(rs.getString("jp_description"));
				jb.setJp_genre(rs.getString("jp_genre"));
				jb.setJp_broad(rs.getString("jp_broad"));
				jb.setJp_person(rs.getString("jp_person"));
				jb.setJp_bu(rs.getString("jp_bu"));
				jb.setJp_code(rs.getString("jp_code"));

				// Bean -> ArrayList 한칸에 저장
				DramaList.add(jb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return DramaList;
	}

/********************************** 검색한 값 찾아오는 구문 **************************************************************/		
		
	public int getSearchProductsNum(String search){
		conn=getConnection();
		sql = "select count(*) from jpdrama where jp_name like ?";
		int total_record = 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total_record = rs.getInt(1);
			} else {
				total_record = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			closeDB();
		}
		return total_record;
	}

	/********************************** 검색한 값의 정보를 가져오는 구문 *****************************/
	
		public ArrayList getSearchDramaList(String search,int PageSize, int record_start_no){
			
			conn=getConnection();
			
			sql="select * from jpdrama where jp_name like ? limit ? offset ?";

			ArrayList DramaList = new ArrayList();
			
			
			JPDramaBean jb= null;
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setInt(2, PageSize);
				pstmt.setInt(3, record_start_no-1);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				
				//5. 데이터 처리
				while(rs.next()){
					jb= new JPDramaBean();
					jb.setJp_filename(rs.getString("jp_filename"));
					jb.setJp_name(rs.getString("jp_name"));
					jb.setJp_description(rs.getString("jp_description"));
					jb.setJp_genre(rs.getString("jp_genre"));
					jb.setJp_broad(rs.getString("jp_broad"));
					jb.setJp_person(rs.getString("jp_person"));
					jb.setJp_code(rs.getString("jp_code"));
					jb.setJp_bu(rs.getString("jp_bu"));
					
					//Bean -> ArrayList 한칸에 저장
					DramaList.add(jb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			
			return DramaList;
		}
		
/************************************** 하나의 정보의 세부사항을 보여주는 구문 ******************************************/		

		public JPDramaBean getDetailList(String code){
			conn=getConnection();
			sql="select * from jpdrama where jp_code=?";
			JPDramaBean jb=null;
			try{
				pstmt=conn.prepareStatement(sql); 
				pstmt.setString(1,code);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					jb= new JPDramaBean();
					
					jb.setJp_filename(rs.getString("jp_filename"));
					jb.setJp_name(rs.getString("jp_name"));
					jb.setJp_description(rs.getString("jp_description"));
					jb.setJp_genre(rs.getString("jp_genre"));
					jb.setJp_bu(rs.getString("jp_bu"));
					jb.setJp_broad(rs.getString("jp_broad"));
					jb.setJp_year(rs.getString("jp_year"));
					jb.setJp_person(rs.getString("jp_person"));
					jb.setJp_code(rs.getString("jp_code"));
					
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return jb;
		}


/*********************** 상품 확인 *******************************/
		public boolean checkProduct(boolean check,String code){
			getConnection();
			sql="select * from jpdrama where jp_code=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, code);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					check=false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return check;
		}
		
		public boolean checkProduct(String code){
			boolean check=false;
			getConnection();
			sql="select * from jpdrama where jp_code=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, code);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					check=true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return check;
		}
/*********************** 상품 등록 *******************************/
		public void addProduct(String filename, String code, 
				String name, String bu, String description,
				String genre, String broad, String person, String year){
			getConnection();
			sql="insert into jpdrama values(?,?,?,?,?,?,?,?,now(6),?)";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,filename);
				pstmt.setString(2,code);
				pstmt.setString(3,name);
				pstmt.setString(4,bu);
				pstmt.setString(5,description);
				pstmt.setString(6,genre);
				pstmt.setString(7,broad);
				pstmt.setString(8,person);
				pstmt.setString(9,year);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
		}
/*************************  상품 삭제 *************************/
		
		public void deleteProduct(String code){
			getConnection();
			sql="select * from jpdrama";
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					sql="delete from jpdrama where jp_code= ?";
					pstmt= conn.prepareStatement(sql);
					pstmt.setString(1, code);
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
		}

/*************************  상품 수정  *************************/
		public void updateProduct(String filename, String code, 
				String name, String bu, String description,
				String genre, String broad, String person, String year){
			getConnection();
			try {
				if(filename !=null)
				{
					sql="insert into jpdrama values(?,?,?,?,?,?,?,?,now(6),?)";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,filename);
					pstmt.setString(2,code);
					pstmt.setString(3,name);
					pstmt.setString(4,bu);
					pstmt.setString(5,description);
					pstmt.setString(6,genre);
					pstmt.setString(7,broad);
					pstmt.setString(8,person);
					pstmt.setString(9,year);
				}
				else
				{
					sql="update jpdrama set jp_name=?,jp_bu=?,jp_description=?, jp_genre=?, jp_broad=?, jp_person=?, jp_year =? where jp_code=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,name);
					pstmt.setString(2, bu);
					pstmt.setString(3,description);
					pstmt.setString(4,genre);
					pstmt.setString(5,broad);
					pstmt.setString(6,person);
					pstmt.setString(7,year);
					pstmt.setString(8,code);
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
		}
/*************************  Members  *************************/
		
/************************ 회원의 모든 정보 *************************/
		
public ArrayList getMemberList(){
			
			conn=getConnection();
			
			sql="select id, mail,phone from members";

			ArrayList MemberList = new ArrayList();
			
			
			MembersDramaBean mb= null;
			
			try {
				pstmt= conn.prepareStatement(sql);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				
				//5. 데이터 처리
				while(rs.next()){
					mb= new MembersDramaBean();
					mb.setId(rs.getString("id"));
					mb.setMail(rs.getString("mail"));
					mb.setPhone(rs.getString("phone"));
					//Bean -> ArrayList 한칸에 저장
					MemberList.add(mb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			
			return MemberList;
		}
/**************** 회원 등록 ***************************/
		public void addMember(String id, String hpw, String name, String gender,
				String birth, String email,String  phone, String address){
			conn= getConnection();
			sql = "insert into members values(?,?,?,?,?,?,?,?,?)";
			Date date=new Date();
			SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, hpw);
				pstmt.setString(3, name);
				pstmt.setString(4, gender);
				pstmt.setString(5, birth);
				pstmt.setString(6, email);
				pstmt.setString(7, phone);
				pstmt.setString(8, address);
				pstmt.setString(9, format.format(date));
				pstmt.executeUpdate();
				System.out.print("저장완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
		}
/************************ 로그인  ***************************/
		
		public int LoginMemberCk(String id){
			int ck=0;
			conn=getConnection();
			sql="select password from members where id=?";
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					ck=1;
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return ck;
		}
		
		public MembersDramaBean LoginMember(String id){
			conn=getConnection();
			sql="select password from members where id=?";
			MembersDramaBean mb=null;
			try{
				pstmt=conn.prepareStatement(sql); 
				pstmt.setString(1,id);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					mb= new MembersDramaBean();
					
					mb.setPw(rs.getString(1));					
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return mb;
		}
		
/********************** ResultSearch *********************/
		
		public void ResultSearch(String hpw,String id){
			conn= getConnection();
			sql="update members set password=? where id= ? ";
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, hpw);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			
		}
/******************* processSearchMember ************************/
		
		public boolean ProSearchID(String phone, String email){
			conn = getConnection();
			sql = "select id from members where phone=? and mail=?";
			boolean check = false;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					check=true;
				}
				else
				{
					check= false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}
		
		public boolean ProSearchPW(String id,String email, String phone){
			conn = getConnection();
			sql = "select password from members where id =? and mail=? and phone = ?";
			boolean check = false;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2, email);
				pstmt.setString(3, phone);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					check=true;
				}
				else
				{
					check= false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}

		public MembersDramaBean FindMember(String phone, String email){
			conn=getConnection();
			sql="select id from members where phone=? and mail=?";
			MembersDramaBean mb=null;
			try{
				pstmt=conn.prepareStatement(sql); 
				pstmt.setString(1,phone);
				pstmt.setString(2, email);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					mb= new MembersDramaBean();
					mb.setId(rs.getString("id"));		
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return mb;
		}
		
		public MembersDramaBean FindMember(String id,String email, String phone){
			conn=getConnection();
			sql="select password from members where id =? and mail=? and phone = ?";
			MembersDramaBean mb=null;
			try{
				pstmt=conn.prepareStatement(sql); 
				pstmt.setString(1,id);
				pstmt.setString(2, email);
				pstmt.setString(3, phone);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					mb= new MembersDramaBean();
					mb.setId(rs.getString("id"));		
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return mb;
		}

/************************* processUpdate *********************/
		public boolean UpdateMemberCheck(String id){
			boolean check=false;
			conn=getConnection();
			sql = "select password from members where id= ?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					check=true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}
		
		public void UpdateMember(String hpw,String mail, String phone,
								String address,String id){
			conn=getConnection();
			sql="update members set password=?, mail=?,phone=?,address=? where id=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, hpw);
				pstmt.setString(2, mail);
				pstmt.setString(3, phone);
				pstmt.setString(4, address);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			
		}
		
		public void UpdateMailMember(String mail, String phone, String address, String id) {
			conn = getConnection();
			sql = "update members set mail=?,phone=?,address=? where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mail);
				pstmt.setString(2, phone);
				pstmt.setString(3, address);
				pstmt.setString(4, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

		}
		
		public void UpdatePWMember(String hpw, String phone, String address, String id) {
			conn = getConnection();
			sql = "update members set password=?,phone=?,address=? where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hpw);
				pstmt.setString(2, phone);
				pstmt.setString(3, address);
				pstmt.setString(4, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

		}
		
		public void UpdateMember(String phone, String address, String id) {
			conn = getConnection();
			sql = "update members set phone=?,address=? where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				pstmt.setString(2, address);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

		}
		
/**************************UpdateMember*************************/
		public MembersDramaBean UpdateMembers(String id) {

			conn = getConnection();

			String sql="select * from members where id= ?";

			MembersDramaBean mb = null;

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();

				while (rs.next()) {
					mb = new MembersDramaBean();
					mb.setId(rs.getString("id"));
					mb.setMail(rs.getString("mail"));
					mb.setPhone(rs.getString("phone"));
					mb.setAddress(rs.getString("address"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return mb;
		}
		
/*************************  찜목록 *********************************/
		public boolean addCartCheck(String loginId){
			conn= getConnection();
			sql= "select * from members where id= ?";
			boolean check = false;
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, loginId);
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					check= true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
			return check;
		}
		
		public void addCart(String loginId, String name){
			conn= getConnection();
			sql = "insert into wish values(null,?,?)";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,loginId);
				pstmt.setString(2,name);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
		}
		
		public void DBCheck(){
			conn=getConnection();
			/* 데이터베이스 중복 체크 */
			sql="delete n1 from wish n1, wish n2 where n1.num>n2.num and n1.l_id=n2.l_id and n1.p_id=n2.p_id";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
		public void DBinit(){
			conn=getConnection();
			/*auto_increment 값 초기화 */
			sql="set @cnt=0";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				
				sql="update wish set wish.num= @cnt:=@cnt+1";	
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
				/*auto_increament이 가지고 있는 값을 새로 설정*/
				sql="alter table wish auto_increment=0";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		public ArrayList Cart(String loginId) {

			conn = getConnection();

			sql = "select * from wish where l_id=?";

			ArrayList WishList = new ArrayList();

			WishDramaBean wb = null;

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, loginId);
				rs=pstmt.executeQuery();
				// 4 sql 실행
				rs = pstmt.executeQuery();

				// 5. 데이터 처리
				while (rs.next()) {
					wb = new WishDramaBean();
					wb.setL_id(rs.getString("l_id"));
					wb.setP_id(rs.getString("p_id"));
					// Bean -> ArrayList 한칸에 저장
					WishList.add(wb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return WishList;
		}
		
		public void RemoveWish(String loginId,String id){
			conn=getConnection();
			sql="delete from wish where l_id=? and p_id= ?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, loginId);
				pstmt.setString(2, id);
				pstmt.executeUpdate(); 
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
		public void DeleteWish(String loginId){
			conn=getConnection();
			sql="delete from wish where l_id=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, loginId);
				pstmt.executeUpdate();  
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
/******************************PW Check**************************/
		public void UpdatePW(String id, String mb){
			conn=getConnection();
			sql="update members set password=? where id=?";
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mb);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
/************************ deleteMember *****************************/
		
		public void deleteMember(String id){
			conn=getConnection();
			sql="delete from members where id=?";
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				RDBinit();
				DBinit();
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}

/***************** getReviewList() *************************/
		public ReviewDramaBean getReviewList(String id,String title){
			conn=getConnection();
			sql="select * from rvdrama where id=? and title=?";
			ReviewDramaBean rb= null;
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2, title);
				rs=pstmt.executeQuery(); 
				
				if(rs.next()){
					rb= new ReviewDramaBean();
					rb.setNum(rs.getInt("num"));
					rb.setContent(rs.getString("content"));
					rb.setDate(rs.getDate("date"));
					rb.setView(rs.getInt("view"));
					rb.setStarinput(rs.getFloat("starinput"));
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return rb;
		}
		
/************************* insertDrama ***********************************/
		public void insertDrama(ReviewDramaBean rb){
			int num = 0;
			try {
				conn = getConnection();		
				
				sql = "select max(num) from rvdrama";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
						num = rs.getInt(1)+1;
				}
				
				// 3 sql 작성 (insert) & pstmt 객체 생성
				sql = "insert into rvdrama values(?,?,?,?,now(),?,?,?)";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, rb.getId());
				pstmt.setString(3, rb.getTitle());
				pstmt.setString(4, rb.getContent());
				pstmt.setInt(5, rb.getView());
				pstmt.setInt(6, rb.getRepl()); 
				pstmt.setFloat(7, rb.getStarinput());
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				// 자원해제 
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}			
			}	
		}	

/************************************ UpdateView *****************************/
		public void updateViewcount(int num)
		{	
			try {
				conn = getConnection();
				sql = "update rvdrama set view=view+1 "
						+ "where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();								
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}
/*****************************************************************************/
		
		public ReviewDramaBean getReview(int num){
			ReviewDramaBean rb = null;
			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 작성(select) & pstmt 객체 
				sql = "select * from rvdrama where num=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				
				// 5 데이터 처리 (bean 저장)
				if(rs.next()){
					rb = new ReviewDramaBean();
					
					rb.setNum(rs.getInt("num"));
					rb.setId(rs.getString("id"));
					rb.setView(rs.getInt("view"));
					rb.setStarinput(rs.getFloat("starinput"));
					rb.setDate(rs.getDate("date"));
					rb.setTitle(rs.getString("title"));
					rb.setContent(rs.getString("content"));
				}
								
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return rb;
		}
		
/******************************** updateViewDrama *******************************/
		public int updateViewDrama(ReviewDramaBean rb){
			int check=0;
			try{
				conn= getConnection();
				sql="select * from rvdrama where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, rb.getNum());
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					sql ="update rvdrama set title=?, content=? where num=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, rb.getTitle());
					pstmt.setString(2,rb.getContent());
					pstmt.setInt(3, rb.getNum());
					check=pstmt.executeUpdate();
				}
				else
				{
					check=-1;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return check;
		}
		
/************************** deleteViewDrama*****************************************/
		
		public int deleteViewDrama(ReviewDramaBean rb){
			int check=0;
			try{
				conn= getConnection();
				sql="select * from rvdrama where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, rb.getNum());
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					sql ="delete from rvdrama where num=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, rb.getNum());
					check=pstmt.executeUpdate();
				}
				else
				{
					check=-1;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return check;
		}
/************************** deleteReview**************************************/
		public void deleteReview(int num, String title){
			conn=getConnection();
			sql="delete from rvdrama where num=? or title=?";
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, title);
				pstmt.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
		public void deleteReview(int num){
			conn=getConnection();
			sql="delete from rvdrama where num=?";
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
		/************************** getReview**************************************/
		public int getReviewNum(){
			conn=getConnection();
			sql = "select count(*) from rvdrama where repl=0 ";
			int total_record = 1;
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					total_record = rs.getInt(1);
				} else {
					total_record = 1;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return total_record;
		}
		
		/********************************************************************************/
		public ArrayList getReviewList(int PageSize, int record_start_no) {

			conn = getConnection();

			sql = "select num,title,starinput,id,view,date from rvdrama where repl=0 order by num desc limit ? offset ?";

			ArrayList ReviewList = new ArrayList();

			ReviewDramaBean rb = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, PageSize);
				pstmt.setInt(2, record_start_no - 1);
				// 4 sql 실행
				rs = pstmt.executeQuery();

				// 5. 데이터 처리
				while (rs.next()) {
					rb = new ReviewDramaBean();
					rb.setNum(rs.getInt("num"));
					rb.setTitle(rs.getString("title"));
					rb.setStarinput(rs.getFloat("starinput"));
					rb.setId(rs.getString("id"));
					rb.setView(rs.getInt("view"));
					rb.setDate(rs.getDate("date"));
					// Bean -> ArrayList 한칸에 저장
					ReviewList.add(rb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return ReviewList;
		}
		
		
/*************************************************************************************/
		
		public void reInsertReview(ReviewDramaBean rb){
			int num = 0;
			
			try {
				// 1) 답글 작성 번호(num)계산
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체
				sql = "select max(num) from rvdrama";
				pstmt = conn.prepareStatement(sql);
				
				// 4 sql 실행 
				rs = pstmt.executeQuery();
				
				// 5 데이터 처리
				if(rs.next()){
					//rs.getInt("max(num)");
					num = rs.getInt(1)+1;
				}
				
				
				sql = "update rvdrama set repl = repl+1 "
						+ "where title=? and repl>?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rb.getTitle());
				pstmt.setInt(2, rb.getRepl());
				
				// sql 실행
				pstmt.executeUpdate();
				
				
				// 3) 답글 쓰기 
				sql ="insert into rvdrama(num,id,title,content,date,repl) values(?,?,?,?,now(),?)";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, rb.getId());
				pstmt.setString(3, rb.getTitle());
				pstmt.setString(4, rb.getContent());
				pstmt.setInt(5, rb.getRepl()+1);
				
				// sql 실행
				pstmt.executeUpdate();
				
				System.out.println(" 답글 작성완료! ");
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		
		}
		
/************************************************ comment ****************************************/
		public ArrayList getRpList(int PageSize, int record_start_no, String title) {

			conn = getConnection();

			sql = "select num,title,content,id,view,date from rvdrama where repl>0 and title=? order by num desc limit ? offset ?";

			ArrayList ReviewList = new ArrayList();

			ReviewDramaBean rb = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setInt(2, PageSize);
				pstmt.setInt(3, record_start_no - 1);
				// 4 sql 실행
				rs = pstmt.executeQuery();

				// 5. 데이터 처리
				while (rs.next()) {
					rb = new ReviewDramaBean();
					rb.setNum(rs.getInt("num"));
					rb.setTitle(rs.getString("title"));
					rb.setContent(rs.getString("content"));
					rb.setId(rs.getString("id"));
					rb.setView(rs.getInt("view"));
					rb.setDate(rs.getDate("date"));
					// Bean -> ArrayList 한칸에 저장
					ReviewList.add(rb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return ReviewList;
		}
		
		public int getRpNum(String title){
			conn=getConnection();
			sql = "select count(*) from rvdrama where repl>0 and title=? ";
			int total_record = 1;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					total_record = rs.getInt(1);
				} else {
					total_record = 1;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				closeDB();
			}
			return total_record;
		}
		
		/******************************** reupdateViewDrama *******************************/
		public int reupdateViewDrama(ReviewDramaBean rb){
			int check=0;
			try{
				conn= getConnection();
				sql="select * from rvdrama where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, rb.getNum());
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					sql ="update rvdrama set content=? where num=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,rb.getContent());
					pstmt.setInt(2, rb.getNum());
					check=pstmt.executeUpdate();
				}
				else
				{
					check=-1;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return check;
		}
		
		
		public void RDBinit(){			
			conn=getConnection();
			/*auto_increment 값 초기화 */
			sql="set @cnt=0";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				
				sql="update rvdrama set rvdrama.num= @cnt:=@cnt+1";	
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
				/*auto_increament이 가지고 있는 값을 새로 설정*/
				sql="alter table rvdrama num=0";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
}