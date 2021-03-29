<%@page import="secure.AES256Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	String password=request.getParameter("password");
	AES256Util pw_secure= new AES256Util();
	String hpassword="", check_pw="";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from members where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	
	if(rs.next())
	{
		hpassword=rs.getString("password");
		check_pw=pw_secure.decrypt(hpassword);
	}
	if(pstmt!=null)
	{
		pstmt.close();
	}
	if(conn!=null)
	{
		conn.close();
	}
	if(check_pw.equals(password))
	{
		session.setAttribute("sessionId", id);
		response.sendRedirect("../members/resultMember.jsp?msg=2");
	}
	else
	{
		response.sendRedirect("../members/loginMember.jsp?error=1");
	}
%>

