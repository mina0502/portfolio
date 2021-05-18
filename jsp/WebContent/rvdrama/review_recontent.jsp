
<%@page import="com.mina.drama.ReviewDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String title= request.getParameter("title");
String id = request.getParameter("id");
String my_id= (String)session.getAttribute("sessionId");
String content = request.getParameter("content");
int num = Integer.parseInt(request.getParameter("num"));
if(my_id==null)
{
	my_id="";
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=id%>님의 -<%=title%> 리뷰</title>
</head>
<body>
<%
	DramaDAO dd = new DramaDAO();
	if(!my_id.equals(id))
	{
		dd.updateViewcount(num);
	}
	ReviewDramaBean rb=dd.getReviewList(id, title);
		
%>
<jsp:include page="../main/menu.jsp" flush="false"/>
	
	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">리뷰 내용</h2>
		</div>
	</div>

	<div class="container">
		<div style="padding-top: 50px">
				<table class="table table-hover">
      <tr>
        <th>작성자</th>
        <td><%=id%></td>
      </tr>
      <tr>
        <th>작성일</th>
        <td><%=rb.getDate()%></td>
      </tr>
      <tr>
        <th>글 제목</th>
        <td colspan="3"><%=title%></td>
      </tr>

      <tr>
        <th>글내용</th>
        <td colspan="3"><%=content%></td>
      </tr>
      <tr>
        <td colspan="4">
<%
	if(my_id.equals(id))
	{
%>
      
          <input class="btn btn-warning" type="button" value="수정하기" 
                 onclick="location.href='../rvdrama/reupdateForm.jsp?id=<%=id%>&content=<%=content %>&num=<%=num%>&title=<%=title %>';"
          >
          <input class="btn btn-danger"type="button" value="삭제하기" 
                onclick=" location.href='../rvdrama/deleteReview.jsp?num=<%=num%>';"
          >      
<%}

	else if(!my_id.equals(""))
	{%>
		
			<input class="btn btn-success" type="button" value="답글쓰기" 
                onclick="location.href='../rvdrama/reWriteForm.jsp?num=<%=rb.getNum()%>&title=<%=title%>';">
<%}%>
			<input class="btn btn-primary" type="button" value="목록으로" 
                 onclick="location.href='../rvdrama/review.jsp';" >
                </td>
		</tr>
    </table>
		</div>
	</div>
<hr>
	<jsp:include page="../rvdrama/comment.jsp?title=<%=title %>" flush="false"/>
<hr>
	<jsp:include page="../main/footer.jsp" flush="false"/>	
</body>
</html>