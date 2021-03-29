<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../db/dbconn.jsp" %>

<%
	//제품을 편집할 id 값이 넘어오는 것을 받고 있음
	String code= request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs= null;

	String sql="select * from jpdrama";
	
	//Connection객체로 부터 쿼리를 주고 PreparedStatment를 얻고 있음
	pstmt=conn.prepareStatement(sql); 
	
	//쿼리문의 결과를 받아오고 있음
	rs=pstmt.executeQuery();
	
	if(rs.next())
	{
		sql ="delete from jpdrama where jp_code= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		pstmt.executeUpdate();
	}
	else
	{
		out.println("일치하는 상품이 없습니다.");
	}
	
	if(rs!=null)
	{
		rs.close();
	}
	if(pstmt!=null)
	{
		pstmt.close();
	}
	if(conn!=null)
	{
		conn.close();
	}
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>