<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DramaDAO dd = new DramaDAO();
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

	
		if(dd.checkProduct(code))
	{
			dd.updateProduct(filename, code, name, bu, description, genre, broad, person, year);
	}
	response.sendRedirect("../admin/editProduct.jsp?edit=update");

%>