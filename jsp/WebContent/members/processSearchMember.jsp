<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String search= request.getParameter("search"); //id
	String id = request.getParameter("user_id");
	String email = request.getParameter("user_email");
	String phone1= request.getParameter("phone1");
	String phone2= request.getParameter("phone2");
	String phone3= request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	
	DramaDAO dd = new DramaDAO();
	
	boolean check = false;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;	
	
	if(search.equals("id"))
	{

		String searchID = "";


		if (dd.ProSearchID(phone, email)) {
			MembersDramaBean mb = (MembersDramaBean) dd.FindMember(phone, email);
			searchID = mb.getId();
			session.setAttribute("searchID", searchID);
			check = true;
		}

		if (check) {
			response.sendRedirect("../members/resultSearch.jsp?search=id");
		} else {
			response.sendRedirect("../error/exceptionNoSearchID.jsp");
		}
	} // ID 찾기

	if (search.equals("pw")) {
		String searchPW="";
	
		if(dd.ProSearchPW(id, email, phone))
		{
			MembersDramaBean mb= (MembersDramaBean) dd.FindMember(id, email, phone);
			searchPW=mb.getPw();
			session.setAttribute("searchPW", searchPW);
			check=true;
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