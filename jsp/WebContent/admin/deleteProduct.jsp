<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	DramaDAO dd= new DramaDAO();
	//제품을 편집할 id 값이 넘어오는 것을 받고 있음
	String code= request.getParameter("id");

	dd.deleteProduct(code);
	response.sendRedirect("editProduct.jsp?edit=delete");
%>