<%@page import="secure.AES256Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<script type="text/javascript">
	error="";
</script>
<!-- DB에서 값 조회 및 없을 경우 돌아가기 -->
<!-- 
<script>
window.history.back();
</script> 
-->
<%@ include file="../db/dbconn.jsp" %>
<%

String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
AES256Util pw_secure=new AES256Util();
String hpw=pw_secure.encrypt(pw);
String name = request.getParameter("user_name");
String gender = request.getParameter("user_gender");
String birth= request.getParameter("user_birth");
String email = request.getParameter("user_email");
String phone1= request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone = phone1+"-"+phone2+"-"+phone3;
String address = request.getParameter("user_address");

Date date=new Date();
SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
boolean check= true;

PreparedStatement pstmt = null;
ResultSet rs = null;
String sql="select * from members";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

while(rs.next())
{
	if(rs.getString("id").equals(id))
	{
%>
	<script type="text/javascript">
		error+="id가 중복됩니다.\n";
	</script>
<%
	check=false;
	}
	if(rs.getString("mail").equals(email))
	{
%>
	<script>
		error+="E-Mail이 중복됩니다\n";
	</script>
<%
	check=false;
	}
	if(rs.getString("phone").equals(phone))
	{
%>
	<script>
		error+="전화번호가 중복됩니다.\n";
	</script>
<%	
	check=false;
	}

}

if(check)
{
	{
		sql = "insert into members values(?,?,?,?,?,?,?,?,?)";
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
		
		if(rs!=null)
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
	
	}
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