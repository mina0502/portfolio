<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	DramaDAO dd = new DramaDAO();
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("sessionId");
	
	dd.deleteMember(id); 
	
	session.invalidate();
	response.sendRedirect("../members/MemberResult.do");
%>