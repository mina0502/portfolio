<%@page import="com.mina.drama.DramaDAO"%>
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
	<%
		String id= request.getParameter("cartId");
		String loginId = (String)session.getAttribute("sessionId");
		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("../products/cart.jsp");
			return;
		}
		
		DramaDAO dd = new DramaDAO();
		
		dd.DeleteWish(loginId);

		response.sendRedirect("../products/cart.jsp");
	%>
</body>
</html>