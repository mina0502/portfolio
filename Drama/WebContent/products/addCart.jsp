<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
</head>
<body>
	<%
		String id= request.getParameter("id");
		

		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("../products/products.jsp");
			return;
		}
	
		String loginId = (String)session.getAttribute("sessionId");
		String name =request.getParameter("jp_name");
		boolean rs_check=false;
		
		DramaDAO dd = new DramaDAO();
		
	
		

		if(dd.addCartCheck(loginId))
		{
			dd.addCart(loginId, name);
			
			dd.DBCheck();
			dd.DBinit();
			response.sendRedirect("../products/product.jsp?id="+id);//URLEncoder.encode(id)
		}
		else
		{
			response.sendRedirect("../error/exceptionNoLogin.jsp");
		}
	

	%>
</body>
</html>