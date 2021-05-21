<%@page import="com.mina.drama.ReviewDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<link href="../resources/css/grade.css" rel="stylesheet" type="text/css">
</head>
<body>
  <%
	  int num = Integer.parseInt(request.getParameter("num"));  
	  String content = request.getParameter("content");
	  String id= request.getParameter("id");
  
  %>
  
  <!-- Db에 처리해야하는 데이터 폼태그 안에 저장(hidden)
            "  안하는 경우  주소줄에 저장(url)
   -->
  <fieldset>
    <form action="reupdatePro.jsp" method="post">
    <input type="hidden" name="num" value="<%=num %>">
          글쓴이  <input type="text" name="id" value="<%=id%>" readonly> <br/>
          내용　  <textarea rows="10" cols="30" name="content"><%=content %></textarea>
      <hr>
          
      <input class="btn btn-success" type="submit" value="글 수정 하기">
    </form>
  </fieldset>

</body>
</html>