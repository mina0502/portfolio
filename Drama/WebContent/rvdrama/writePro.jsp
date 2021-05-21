<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   <%
    // 한글처리 
    request.setCharacterEncoding("utf-8");
   %>
   <!-- 자바빈객체 생성 -->
   <jsp:useBean id="rb" class="com.mina.drama.ReviewDramaBean"/>
   <!-- 전달된 파라미터 저장 -->
   <jsp:setProperty property="*" name="rb" />
   <%
     // DB에 대한 처리를 하는 객체를 생성
     DramaDAO dd = new DramaDAO(); 	
     // 글쓰기 기능을 사용
     dd.insertDrama(rb);
     
     //페이지 이동
     response.sendRedirect("../rvdrama/review.jsp"); 
   %>
</body>
</html>