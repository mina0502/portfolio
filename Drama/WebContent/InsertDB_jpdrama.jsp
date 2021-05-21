<%@page import="java.io.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String sql = "insert into jpdrama values(?,?,?,?,?,?,?,?,now(6),?)";
	pstmt=conn.prepareStatement(sql);
	String filePath = "C:\\Users\\MIna\\Desktop\\일드목록.txt";						
	 
	//파일을 읽어오기 위한 FileInputStream 객체 선언
	FileInputStream fileStream = null; 
	
	//FileInputStream에 읽어올 파일 경로 지정 실시
	fileStream = new FileInputStream(filePath);
	String[] str= {};
	byte readBuffer[] = new byte[fileStream.available()];
	while (fileStream.read(readBuffer) != -1)
	{
	String txt=new String(readBuffer,"utf-8");
	str= txt.split("/");
	}
	for(int i=0; i<str.length;i++)
	{
		if(i%10==1)
		{
			pstmt.setString(3,str[i]);
		}
		else if(i%10==2)
		{
			pstmt.setString(5,str[i]);
		}
		else if(i%10==3)
		{
			pstmt.setString(4,str[i]);
		}
		else if(i%10==4)
		{
			pstmt.setString(2,str[i]);
		}
		else if(i%10==5)
		{
			pstmt.setString(6,str[i]);
		}
		else if (i%10==6)
		{
			pstmt.setString(7,str[i]);
		}
		else if(i%10==7)
		{
			pstmt.setString(8,str[i]);
		}
		else if(i%10==8)
		{
			pstmt.setString(1,str[i]);
		}
		else if(i%10==9)
		{
			pstmt.setString(9,str[i]);
			pstmt.executeUpdate();
		}
			
	}
	fileStream.close();
	System.out.println("END");
		
%>