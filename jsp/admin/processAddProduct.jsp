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
	
	
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	String sql="select * from jpdrama where jp_code=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, code);
	rs=pstmt.executeQuery();
	
	if(rs.next())
	{
		check=false;
	}
	else
	{
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
		
	}
	if(check)
	{
	if(filename!=null)
		{
	sql="insert into jpdrama values(?,?,?,?,?,?,?,?,now(6),?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,filename);
	pstmt.setString(2,code);
	pstmt.setString(3,name);
	pstmt.setString(4,bu);
	pstmt.setString(5,description);
	pstmt.setString(6,genre);
	pstmt.setString(7,broad);
	pstmt.setString(8,person);
	pstmt.setString(9,year);
	pstmt.executeUpdate();
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
	
	
	/////////////////////////////////////////
	if(pstmt!=null)
	{
		pstmt.close();
	}
	if(conn!=null)
	{
		conn.close();
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
		if(pstmt!=null)
		{
			pstmt.close();
		}
		if(conn!=null)
		{
			conn.close();
		}
		response.sendRedirect("../error/exceptionYesCode.jsp");
	}
%>