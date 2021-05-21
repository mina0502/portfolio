<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="secure.AES256Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	String password=request.getParameter("password");
	
	AES256Util pw_secure= new AES256Util();
	String hpassword="", check_pw="";
	
	DramaDAO dd = new DramaDAO();
	
	
	MembersDramaBean mb = dd.LoginMember(id);
	if(dd.LoginMemberCk(id)==1)
	{
		hpassword=mb.getPw();
	}
	check_pw=pw_secure.decrypt(hpassword);
	
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

