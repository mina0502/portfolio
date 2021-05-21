<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 글쓰기</title>
<link href="../resources/css/grade.css" rel="stylesheet" type="text/css">
</head>
<body>
  <h2> 리뷰 글쓰기 </h2>
  
  <fieldset>
    <form action="writePro.jsp" method="post">
          작성자 : <input type="text" name="id" value="<%=id%>" readonly> <br>
          제목 : <input type="text" name="title"><br>
          평점 : <span class="star-input" style="height: 30px; padding-bottom: 5px; padding-top: 1px;">
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
		</span><br/>
          내용 : <textarea rows="10" cols="30" name="content"></textarea>
      <hr>
          
      <input type="submit" value="글쓰기">
    </form>
  </fieldset>
<script src="../resources/js/jquery-1.11.3.min.js"></script>
<script src="../resources/js/star.js"></script>
</body>
</html>