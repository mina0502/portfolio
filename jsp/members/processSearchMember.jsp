<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String search= request.getParameter("search"); //id
	String id = request.getParameter("user_id");
	String email = request.getParameter("user_email");
	String phone1= request.getParameter("phone1");
	String phone2= request.getParameter("phone2");
	String phone3= request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	
	boolean check = false;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;	
	
	if(search.equals("id"))
	{

		String searchID = "";

		sql = "select * from members where phone=? and mail=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		pstmt.setString(2, email);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			searchID = rs.getString("id");
			session.setAttribute("searchID", searchID);
			check = true;
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		if (check) {
			response.sendRedirect("../members/resultSearch.jsp?search=id");
		} else {
			response.sendRedirect("../error/exceptionNoSearchID.jsp");
		}
	} // ID 찾기

	if (search.equals("pw")) {
		String searchPW="";
		sql = "select * from members where id =? and mail=? and phone = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2, email);
		pstmt.setString(3, phone);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			searchPW=rs.getString("id");
			session.setAttribute("searchPW", searchPW);
			check=true;
		}
		
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		if(check)
		{
			response.sendRedirect("../members/resultSearch.jsp?search=pw");
		}
		else
		{
			response.sendRedirect("../error/exceptionNoSearchPW.jsp");
		}
	}
%>