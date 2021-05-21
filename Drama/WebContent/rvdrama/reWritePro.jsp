<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/board/reWritePro.jsp</h1>
  <%
    // 한글 처리
    request.setCharacterEncoding("UTF-8");
  	request.getParameter("id");
  	request.getParameter("num");
  	request.getParameter("content");
    // 전달되는 파라미터값 저장 (액션태그 사용)    
  %>
  <jsp:useBean id="rb" class="com.mina.drama.ReviewDramaBean"/>
  <jsp:setProperty property="*" name="rb"/>
  
  <%

  
    // BoardDAO 객체 생성
    DramaDAO dd = new DramaDAO();
    
    dd.reInsertReview(rb);
    
    
    // 페이지 이동
    response.sendRedirect("review.jsp");
  %>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
</body>
</html>