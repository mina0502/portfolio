<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	DramaDAO dd = new DramaDAO();
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num")); 
	String title= request.getParameter("title");
	if(title!=null)
	{
		dd.deleteReview(num,title);
	}
	else
	{
		dd.deleteReview(num);
	}
	dd.RDBinit();
	response.sendRedirect("../rvdrama/review.jsp");
%>