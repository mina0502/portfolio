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
	
	


	
 	String name = multi.getParameter("name");
 	String code = multi.getParameter("code");
 	String description = multi.getParameter("description");
 	String genre = multi.getParameter("genre");
 	String broad = multi.getParameter("broad");
 	String person = multi.getParameter("person");
 	String bu = multi.getParameter("bu");
 	String year = multi.getParameter("year");
	
 	boolean check=true, doubleCheck=false;
 	

 	
	Enumeration files= multi.getFileNames();
	String fname= files.nextElement().toString();
	filename=multi.getFilesystemName(fname);
	
	
		dd.checkProduct(check, code);
	
		if(name.equals("")||code.equals("")||description.equals("")||genre.equals("")||broad.equals("")||person.equals("")||bu.equals("")||year.equals(""))
	 	{
	 %>
	 	<script type="text/javascript">
			alert("입력되지 않은 부분이 있습니다.");
			window.history.back();
		</script>
	 <%  
	 return;
	 	}
		

	if(check)
	{
	if(filename!=null)
		{
	dd.addProduct(filename, code, name, bu, description, genre, broad, person, year);
	doubleCheck=true;
		}
	else
	{
%>
	<script type="text/javascript">
		alert("이미지를 첨부해주세요!");
		window.history.back();
	</script>
<%
	}
	
	///////////////////////////////////////////	
	if(doubleCheck)
	{
		response.sendRedirect("../products/products.jsp");
	}
	///////////////////////////////////////////
	}
	else
	{
		response.sendRedirect("../error/exceptionYesCode.jsp");
	}
%>