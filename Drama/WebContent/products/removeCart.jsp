<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당상품삭제</title>
</head>
<body>
	<%
		String loginId = (String)session.getAttribute("sessionId");
		String id= request.getParameter("id");
		
		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("../products/products.jsp");
			return;
		}
		DramaDAO dd = new DramaDAO();
		
 		dd.RemoveWish(loginId, id);
		
		
		response.sendRedirect("../products/cart.jsp");
		%>
</body>
</html>