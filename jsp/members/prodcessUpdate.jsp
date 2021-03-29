<%@page import="secure.AES256Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id =(String)session.getAttribute("sessionId");
	String pw= request.getParameter("pw");
	AES256Util secure_pw=new AES256Util();
	String hpw= secure_pw.encrypt(pw);
	String mail = request.getParameter("mail");
	String phone1= request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3= request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	String address = request.getParameter("address");
	boolean check = false;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from members where id= ?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next())
	{
		sql="update members set password=?, mail=?,phone=?,address=? where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, hpw);
		pstmt.setString(2, mail);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
		check=true;
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
	if(check)
	{
		response.sendRedirect("../members/resultMember.jsp?msg=0"); 
	}
	else
	{
		response.sendRedirect("../members/exceptionNoUpdate.jsp"); 
	}
%>
