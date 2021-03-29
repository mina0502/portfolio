<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../db/dbconn.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	
	String filename="";
	String realFolder="C:/Users/MIna/Desktop/workspace/Drama/WebContent/resources/images";
	
	
	int maxSize = 10* 1024* 1024; // 업로드 크기 (10M)
	String encType= "utf-8"; // 인코딩 유형
	
	MultipartRequest multi= new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	
	String code = multi.getParameter("code");
	String name = multi.getParameter("name");
 	String description = multi.getParameter("description");
 	String genre = multi.getParameter("genre");
 	String broad = multi.getParameter("broad");
 	String person = multi.getParameter("person");
 	String bu = multi.getParameter("bu");
 	String year= multi.getParameter("year");
	Enumeration files= multi.getFileNames();
	String fname= files.nextElement().toString();
	filename=multi.getFilesystemName(fname);
	
	PreparedStatement pstmt= null;
	ResultSet rs= null;

	String sql="select * from jpdrama where jp_code=?";
	
	pstmt=conn.prepareStatement(sql); 
	pstmt.setString(1, code);
	rs=pstmt.executeQuery();
		if(rs.next())
	{
		if(filename !=null)
		{
			sql="update jpdrama set jp_filename=?, jp_name=?,jp_bu=?,jp_description=?, jp_genre=?, jp_broad=?, jp_person=? jp_year=? where jp_code=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,filename);
			pstmt.setString(2,name);
			pstmt.setString(3, bu);
			pstmt.setString(4,description);
			pstmt.setString(5,genre);
			pstmt.setString(6,broad);
			pstmt.setString(7,person);
			pstmt.setString(8,year);
			pstmt.setString(9,code);
			pstmt.executeUpdate();
		}
		else// 이미지의 변경이 없을 경우
		{
			sql="update jpdrama set jp_name=?,jp_bu=?,jp_description=?, jp_genre=?, jp_broad=?, jp_person=?, jp_year =? where jp_code=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2, bu);
			pstmt.setString(3,description);
			pstmt.setString(4,genre);
			pstmt.setString(5,broad);
			pstmt.setString(6,person);
			pstmt.setString(7,year);
			pstmt.setString(8,code);
			pstmt.executeUpdate();
		}
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
	response.sendRedirect("../admin/editProduct.jsp?edit=update");

%>