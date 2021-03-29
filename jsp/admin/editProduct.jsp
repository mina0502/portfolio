<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String edit= request.getParameter("edit"); //넘어오는 edit값을 받고 있음
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
	
	<div class="container">
		<div class="row" align="center">
		<%@ include file="../db/dbconn.jsp" %>
		
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
				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {
					pageno = 1;
				}
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select count(*) from jpdrama";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int total_record;
				if (rs.next()) {
					total_record = rs.getInt(1);
				} else {
					total_record = 0;
				}

				int page_per_record_cnt = 9;
				int group_per_page_cnt = 10;

				int record_end_no = pageno * page_per_record_cnt;
				int record_start_no = record_end_no - (page_per_record_cnt - 1);
				if (record_end_no > total_record) {
					record_end_no = total_record;
				}

				int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
				if (pageno > total_page) {
					pageno = total_page;
				}

				int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);

				int page_eno = group_no * group_per_page_cnt;
				int page_sno = page_eno - (group_per_page_cnt - 1);

				if (page_eno > total_page) {
					page_eno = total_page;
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
			pstmt=null;
			rs = null;
			
			sql="select * from jpdrama order by jp_date desc limit ? offset ?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, page_per_record_cnt);
			pstmt.setInt(2,record_start_no-1);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				
		%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("jp_filename") %>"
				style="width: 50%">
				<h3><%=rs.getString("jp_name") %></h3>
				<p><%=rs.getString("jp_description") %>
				<p><%=rs.getString("jp_genre") %>
				<p><%=rs.getString("jp_broad") %>
				<p><%=rs.getString("jp_person") %>
				<p><%
				if(edit.equals("update"))
				{
					%>
				<a href="../admin/updateProduct.jsp?id=<%=rs.getString("jp_code")%>"
				class="btn btn-success" role="button">수정 &raquo;</a>
				<%}
				else if(edit.equals("delete"))
				{
				%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("jp_code") %>')"
				class="btn btn-danger" role="button">삭제 &raquo;</a>
				<%
				}
				%>
			</div>
			<%
			}
			
			if(rs!=null)
			{
				rs.close();
			}
			if(pstmt!=null)
			{
				pstmt.close();
			}
			if(conn!=null)
			{
				conn.close();
			}
			%>
		</div>
	</div>
	<div align="center">
	<a class="btn btn-secondary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=1">&laquo;</a>
	<a  class="btn btn-primary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=prev_pageno%>">[이전]</a> 
		<%for(int i =page_sno;i<=page_eno;i++)
		{%>
			<a class="btn btn-success" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=i %>">
				<%if(pageno == i){ %>
					『<%=i %>』
				<%}else{ %>
					<%=i %>
				<%} %>
			</a> 
	<%} %>
 
<a class="btn btn-primary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=next_pageno%>" >[다음]</a>
<a class="btn btn-secondary" href="../admin/editProduct.jsp?edit=<%=edit %>&pageno=<%=total_page %>">&raquo;</a>
</div>
<hr>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>