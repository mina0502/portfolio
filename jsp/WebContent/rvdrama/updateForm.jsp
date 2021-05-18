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
   // DB에서 글번호에 해당하는 정보를 가져와서 출력
   
   // DAO 객체 생성
   DramaDAO dd = new DramaDAO();
   
   // 글번호에 해당하는 정보를 가져오는 메서드 
   ReviewDramaBean rb = dd.getReview(num);
  
  %>
  
  <!-- Db에 처리해야하는 데이터 폼태그 안에 저장(hidden)
            "  안하는 경우  주소줄에 저장(url)
   -->
  <fieldset>
    <form action="updatePro.jsp" method="post">
    <input type="hidden" name="num" value="<%=rb.getNum() %>">
          글쓴이  <input type="text" name="id" value="<%=rb.getId()%>" readonly> <br/>
          제목　  <input type="text" name="title" value="<%=rb.getTitle() %>"><br/>
          평점　  <span class="star-input" style="height: 30px; padding-bottom: 5px; padding-top: 1px;">
		<span class="input">
		<input type="radio" name="starinput" value="0.5" id="p0.5">
    	<label for="p0.5">0.5</label>
    	<input type="radio" name="starinput" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="starinput" value="1.5" id="p1.5">
    	<label for="p1.5">1.5</label>
    	<input type="radio" name="starinput" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="starinput" value="2.5" id="p2.5">
    	<label for="p2.5">2.5</label>
    	<input type="radio" name="starinput" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="starinput" value="3.5" id="p3.5">
    	<label for="p3.5">3.5</label>
    	<input type="radio" name="starinput" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="starinput" value="4.5" id="p4.5">
    	<label for="p4.5">4.5</label>
    	<input type="radio" name="starinput" value="5" id="p5">
    	<label for="p5">5</label>
  		</span>
  		<output for="star-input"><b></b> 점</output>						
		</span><br/><br/>
          내용　  <textarea rows="10" cols="30" name="content"><%=rb.getContent() %></textarea>
      <hr>
          
      <input class="btn btn-success" type="submit" value="글 수정 하기">
    </form>
  </fieldset>
<script src="../resources/js/jquery-1.11.3.min.js"></script>
<script src="../resources/js/star.js"></script>

</body>
</html>