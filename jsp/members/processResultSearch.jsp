<%@page import="secure.AES256Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
	AES256Util secure_pw = new AES256Util();
	System.out.println(id);
	if(id.equals("null"))
	{	
		response.sendRedirect("../error/exceptionNocorrectPath.jsp");
		return;
	}
	
	if(password1.equals(password2))
	{	
		String hpw= secure_pw.encrypt(password1);
		PreparedStatement pstmt = null;
		String sql="update members set password=? where id= ? ";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, hpw);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		response.sendRedirect("../members/resultSearch.jsp?search=complete");
	}
	else
	{
		response.sendRedirect("../error/exceptionNocorrectPW.jsp");
	}
%>