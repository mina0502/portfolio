<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 비우기</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp" %>
	<%
		String id= request.getParameter("cartId");
		String loginId = (String)session.getAttribute("sessionId");
		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("../products/cart.jsp");
			return;
		}
		
		PreparedStatement pstmt = null;
		String sql ="delete from wish where l_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, loginId);
		pstmt.executeUpdate();  

		response.sendRedirect("../products/cart.jsp");
	%>
</body>
</html>