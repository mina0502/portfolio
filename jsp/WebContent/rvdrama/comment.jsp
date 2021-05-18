<%@page import="com.mina.drama.ReviewDramaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				
				String id = request.getParameter("id");
				String title= request.getParameter("title");
				String num = request.getParameter("num");
				
				int PageSize =5;
				DramaDAO dd= new DramaDAO();
				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {
					pageno = 1;
				}
/**************DramaDAO--> getTotal_record	************/
			int total_record= dd.getRpNum(title,Integer.parseInt(num));
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
	
	<div class="container">
		<div style="padding-top: 50px">
				<table class="table table-hover">
							<tr>
								<th colspan="20%">내용</th>
								<th colspan="20%">작성자</th>
								<th colspan="20%">날짜</th>
							</tr>
	<%
	ArrayList ReviewList = dd.getRpList(PageSize,record_start_no,title,Integer.parseInt(num));
	for(int i=0; i<ReviewList.size();i++)
	{
		ReviewDramaBean rb =(ReviewDramaBean) ReviewList.get(i);
	%>
			<tr>
				<td colspan="20%"><%=rb.getContent() %></td>
				<td colspan="20%"><a href="../rvdrama/review_recontent.jsp?content=<%=rb.getContent()%>&id=<%=rb.getId()%>&num=<%=rb.getNum()%>&title=<%=rb.getTitle()%>"><%=rb.getId() %></a></td>
				<td colspan="20%"><%=rb.getDate() %></td>
			</tr>			
	<%}%>
	
				</table>
			</div>
		</div>
	<div align="center">
		<a class="btn btn-secondary"
			href="../rvdrama/review_content.jsp?title=<%=title %>&id=<%=id %>&num=<%=num %>&pageno=1">&laquo;</a>
		<a class="btn btn-primary"
			href="../rvdrama/review_content.jsp?title=<%=title %>&id=<%=id %>&num=<%=num %>&pageno=<%=prev_pageno%>">[이전]</a>
		<%
			for (int i = StartNum; i <= EndNum; i++) {
				if(i<0)
				{
					continue;
				}
		%>
		<a class="btn btn-success"
			href="../rvdrama/review_content.jsp?title=<%=title %>&id=<%=id %>&num=<%=num %>&pageno=<%=i%>">
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
			href="../rvdrama/review_content.jsp?title=<%=title %>&id=<%=id %>&num=<%=num %>&pageno=<%=next_pageno%>">[다음]</a>
		<a class="btn btn-secondary"
			href="../rvdrama/review_content.jsp?title=<%=title %>&id=<%=id %>&num=<%=num %>&pageno=<%=total_page%>">&raquo;</a>
	</div>
	
</body>
</html>