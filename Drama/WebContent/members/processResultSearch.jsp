<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="secure.AES256Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
	AES256Util secure = new AES256Util();
	
	DramaDAO dd = new DramaDAO();
	
	if(id.equals("null"))
	{	
		response.sendRedirect("../error/exceptionNocorrectPath.jsp");
		return;
	}
	
	if(password1.equals(password2))
	{	
		String hpw= secure.encrypt(password1);
		dd.ResultSearch(hpw, id);
		response.sendRedirect("../members/resultSearch.jsp?search=complete");
	}
	else
	{
		response.sendRedirect("../error/exceptionNocorrectPW.jsp");
	}
%>