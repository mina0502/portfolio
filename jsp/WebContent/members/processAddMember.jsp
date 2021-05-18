<%@page import="java.util.ArrayList"%>
<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="secure.AES256Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<script type="text/javascript">
var error="";
</script>
<!-- DB에서 값 조회 및 없을 경우 돌아가기 -->
<!-- 
<script>
window.history.back();
</script> 
-->
<%

String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
String pwck= request.getParameter("user_pw2");
String name = request.getParameter("user_name");
String gender = request.getParameter("user_gender");
String birth= request.getParameter("user_birth");
String email = request.getParameter("user_email");
String phone1= request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone = phone1+"-"+phone2+"-"+phone3;
String post_address= request.getParameter("post_address");
String user_address = request.getParameter("user_address");
String detail_address= request.getParameter("detail_address");
String address=post_address+"/"+user_address+"/"+detail_address;

AES256Util secure=new AES256Util();
String hpw=secure.encrypt(pw);

Date date=new Date();
SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
boolean check=true;

DramaDAO dd = new DramaDAO();
ArrayList MemberList = dd.getMemberList();
for(int i=0; i<MemberList.size();i++)
{
	MembersDramaBean mb = (MembersDramaBean) MemberList.get(i);
	
	if(mb.getId().equals(id))
	{ 
%>
	<script type="text/javascript">
		error+="id가 중복됩니다.\n";
	</script>
<%
	 check=false;
	}
	if(mb.getMail().equals(email))
	{ 
%>
	<script>
		error+="E-Mail이 중복됩니다\n";
	</script>
<%
	check=false;
	}
	if(mb.getPhone().equals(phone))
	{ 
%>
	<script>
		error+="전화번호가 중복됩니다.\n";
	</script>
<%	
	 check=false;
	}
}
	if(!pw.equals(pwck))
	{ 
%>
	<script>
		error+="비밀번호가 일치하지 않습니다.\n";
	</script>
<%
	check=false;
}

if(check)
{
		dd.addMember(id, hpw, name, gender, birth, email, phone, address);
%>
 <c:redirect url="../members/resultMember.jsp?msg=1"/> 
<%
}
else
{
%>
	<script>
		alert(error);
		window.history.back();
	</script>
<%
}
%>