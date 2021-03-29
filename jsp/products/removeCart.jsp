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
	<%@ include file="../db/dbconn.jsp" %>
	<%
		String loginId = (String)session.getAttribute("sessionId");
		String id= request.getParameter("id");
		
		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("../products/products.jsp");
			return;
		}

 		PreparedStatement pstmt = null;
		String sql ="delete from wish where l_id=? and p_id= ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, loginId);
		pstmt.setString(2, id);
		pstmt.executeUpdate();  
		
		
		response.sendRedirect("../products/cart.jsp");
		%>
</body>
</html>