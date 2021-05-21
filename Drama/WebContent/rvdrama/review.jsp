<%@page import="com.mina.drama.ReviewDramaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id= (String)session.getAttribute("sessionId");
	int PageSize = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>드라마 리뷰</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
</head>
<script type="text/javascript">
function writeForm()
{
	<%
	if(id!=null)
	{
	%>
		location.href="../rvdrama/writeForm.jsp?id=<%=id%>";
	<%
	}
	else
	{
	%>
		alert("로그인을 해주세요");
	<%
	}
	%>
}
</script>
<%/* 페이징 시작*/ %>
			<%!
			public Integer toInt(String x) {
			int a = 0;
			try {
				a = Integer.parseInt(x);
			} catch (Exception e) {
			}
			return a;
			}
			%>
			<%
				DramaDAO dd = new DramaDAO();
				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {
					pageno = 1;
				}
/**************DramaDAO--> getTotal_record	************/
			int total_record= dd.getReviewNum();
/******************************************************************/
				
				int BtnSize = 10;
				
				int record_end_no = pageno * PageSize;
				int record_start_no = record_end_no - (PageSize - 1);
				
				if (record_end_no > total_record) {
					record_end_no = total_record;
				}

				int total_page = total_record / PageSize + (total_record % PageSize > 0 ? 1 : 0);
				
				if (pageno > total_page) {
					pageno = total_page;
				}

				int group_no = pageno / BtnSize + (pageno % BtnSize > 0 ? 1 : 0);

				int EndNum = group_no * BtnSize;
				int StartNum = EndNum - (BtnSize - 1);

				if (EndNum > total_page) {
					EndNum = total_page;
				}

				int prev_pageno = pageno-1;
				int next_pageno = pageno+1;
				
				if (prev_pageno < 1) {
					prev_pageno = 1;
				}
				if (next_pageno > total_page) {
					next_pageno = total_page; 
				}
				
				/* 페이징 끝*/
%>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	
	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">리뷰 목록</h2>
		</div>
	</div>
	
	<div class="container">
		<div class="text-right">
			<input class="btn btn-success" type="button" value="글쓰기" onclick="writeForm()"/>
		</div>
	</div>
	
	<div class="container">
		<div style="padding-top: 50px">
				<table class="table table-hover">
							<tr>
								<th colspan="20%">제목</th>
								<th colspan="20%">평점</th>
								<th colspan="20%">작성자</th>
								<th colspan="20%">조회수</th>
								<th colspan="20%">날짜</th>
							</tr>
	<%
	ArrayList ReviewList = dd.getReviewList(PageSize,record_start_no);
	for(int i=0; i<ReviewList.size();i++)
	{
		ReviewDramaBean rb =(ReviewDramaBean) ReviewList.get(i);
	%>
			<tr>
				<td colspan="20%"><a href="../rvdrama/review_content.jsp?title=<%=rb.getTitle() %>&id=<%=rb.getId() %>&num=<%=rb.getNum()%>"><%=rb.getTitle() %></a></td>
				<td colspan="20%"><%=rb.getStarinput() %></td>
				<td colspan="20%"><%=rb.getId() %></td>
				<td colspan="20%"><%=rb.getView() %></td>
				<td colspan="20%"><%=rb.getDate() %></td>
			</tr>			
	<%}%>
	
				</table>
			</div>
		</div>
	<div align="center">
		<a class="btn btn-secondary"
			href="../rvdrama/review.jsp?pageno=1">&laquo;</a>
		<a class="btn btn-primary"
			href="../rvdrama/review.jsp?pageno=<%=prev_pageno%>">[이전]</a>
		<%
			for (int i = StartNum; i <= EndNum; i++) {
				if(i<0)
				{
					i=1;
				}
		%>
		<a class="btn btn-success"
			href="../rvdrama/review.jsp?pageno=<%=i%>">
			<%
				if (pageno == i) {
			%> 『<%=i%>』 <%
				} else {
			%> <%=i%> <%
 	}
 %>
		</a>
		<%
			}
		%>

		<a class="btn btn-primary"
			href="../rvdrama/review.jsp?pageno=<%=next_pageno%>">[다음]</a>
		<a class="btn btn-secondary"
			href="../rvdrama/review.jsp?pageno=<%=total_page%>">&raquo;</a>
	</div>
	
	<hr>
	<jsp:include page="../main/footer.jsp" flush="false"/>
</body>
</html>