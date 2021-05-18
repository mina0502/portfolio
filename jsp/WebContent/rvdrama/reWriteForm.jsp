<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글 쓰기</title>
</head>
<body>

  <%
    // 전달된 파라미터값 저장 (num,re_ref,re_lev,re_seq)
    
    int num = Integer.parseInt(request.getParameter("num"));
  	String id = (String)session.getAttribute("sessionId");
  	String title=request.getParameter("title");

  
  %>
  
  <fieldset>
    <form action="reWritePro.jsp" method="post">
      <input type="hidden" name="num" value="<%=num%>">
      <input type="hidden" name="id" value="<%=id %>">
      <input type="hidden" name="title" value="<%=title %>">
          내용 : <textarea rows="10" cols="30" name="content"></textarea>
      <hr>
      <input type="submit" value="답글쓰기">
    </form>
  </fieldset>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 

</body>
</html>