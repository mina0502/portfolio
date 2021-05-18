<%@page import="com.mina.drama.JPDramaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String edit= request.getParameter("edit"); //넘어오는 edit값을 받고 있음
	int PageSize = toInt(request.getParameter("PageSize"));
	if (PageSize < 1) {
		PageSize = 9;
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품 수정</title>
<script type="text/javascript">
function deleteConfirm(id) {
	if(confirm("해당 상품을 삭제합니다")==true)
		{
			location.href="../admin/deleteProduct.jsp?id="+id;
		}
	else
		{
			return;
		}
	
	
}
</script>
</head>
<body>
	<jsp:include page="../main/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">드라마 목록</h1>
		</div>
	</div>
	
	<form action="../query/search_admin.jsp">
		<div class="form-group" align="center">
			<label><strong>드라마 찾기</strong></label>
		</div>
		<div class="form-group" align="center">
			<input type="text" name="search">
			<input type="hidden" name="edit" value="<%=edit %>">
			<input class="btn btn-primary" type="submit" value="검색">
		</div>
	</form>
	<div class="container" align="right">
			<select id="PS" onchange="change()">
				<option value="">게시글 크기지정</option>
				<option value="3">3</option>
				<option value="6">6</option>
				<option value="9">9</option>
			</select>
	</div>
	
	<script>
		function change(){
			var select =document.getElementById('PS');
			var page = select.value;	
			var link = document.location.pathname;
			var para1 = document.location.href.split("?");
			var para2 = para1[1].split("&PageSize=");
			location.href=link+"?"+para2[0]+"&PageSize="+page;
			
		}
		
		
	</script>
	
	<div class="container">
		<div class="row" align="center">
			
		
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
				
				int total_record=dd.getProductsNum();

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
		<%
		ArrayList DramaList = dd.getDramaList(PageSize, record_start_no);
		for(int i=0; i<DramaList.size();i++)
		{
			JPDramaBean jb =(JPDramaBean) DramaList.get(i);
				
		%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resources/images/<%=jb.getJp_filename()%>"
				style="width: 50%">
				<h3><%=jb.getJp_name() %></h3>
				<p><%=jb.getJp_description()%>
				<p><%=jb.getJp_genre()%>
				<p><%=jb.getJp_broad() %>
				<p><%=jb.getJp_person()%>
				<p><%
				if(edit.equals("update"))
				{
					%>
				<a href="../admin/updateProduct.jsp?id=<%=jb.getJp_code()%>"
				class="btn btn-success" role="button">수정 &raquo;</a>
				<%}
				else if(edit.equals("delete"))
				{
				%>
				<a href="#" onclick="deleteConfirm('<%=jb.getJp_code() %>')"
				class="btn btn-danger" role="button">삭제 &raquo;</a>
				<%
				}
				%>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div align="center">
	<a class="btn btn-secondary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=1&PageSize=<%=PageSize%>">&laquo;</a>
	<a  class="btn btn-primary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=prev_pageno%>&PageSize=<%=PageSize%>">[이전]</a> 
		<%for(int i =StartNum;i<=EndNum;i++)
		{%>
			<a class="btn btn-success" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=i %>&PageSize=<%=PageSize%>">
				<%if(pageno == i){ %>
					『<%=i %>』
				<%}else{ %>
					<%=i %>
				<%} %>
			</a> 
	<%} %>
 
<a class="btn btn-primary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=next_pageno%>&PageSize=<%=PageSize%>" >[다음]</a>
<a class="btn btn-secondary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=total_page %>&PageSize=<%=PageSize%>">&raquo;</a>
</div>
<hr>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>