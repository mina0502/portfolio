<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>드라마 목록</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">드라마 목록</h2>
		</div>
	</div>
	
	<form action="../query/search.jsp">
		<div class="form-group" align="center">
			<label><strong>드라마 찾기</strong></label>
		</div>
		<div class="form-group" align="center">
			<input type="text" name="search">
			<input class="btn btn-primary" type="submit" value="검색">
		</div>
	</form>
	<%-- <%
		ProductRepository dao=ProductRepository.getInstance();
		ArrayList<Product> listofProducts = dao.getAllProducts();
	%> --%>
	
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
				/* for(int i=0;i<listofProducts.size();i++)
				{
					Product product= listofProducts.get(i); */
				 pstmt = null;
				 rs= null;
				
				 sql="select * from jpdrama order by jp_date desc limit ? offset ?";
				
				//Connection객체로 부터 쿼리를 주고 PreparedStatment를 얻고 있음
				pstmt=conn.prepareStatement(sql); 
				pstmt.setInt(1, page_per_record_cnt);
				pstmt.setInt(2,record_start_no-1);
				//쿼리문의 결과를 받아오고 있음
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					
			%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("jp_filename") %>"
				style="width: 50%">
				<h3><%=rs.getString("jp_name") %></h3>
				<h5><strong>부작: <%=rs.getString("jp_bu") %></strong></h5>

				
				<p><a href="../products/product.jsp?id=<%=rs.getString("jp_code")%>"
				class="btn btn-secondary" role="button">상세정보 &raquo;</a></p> 
				
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
	<a class="btn btn-secondary" href="../products/products.jsp?pageno=1">&laquo;</a>
	<a  class="btn btn-primary" href="../products/products.jsp?pageno=<%=prev_pageno%>">[이전]</a> 
		<%for(int i =page_sno;i<=page_eno;i++)
		{%>
			<a class="btn btn-success" href="../products/products.jsp?pageno=<%=i %>">
				<%if(pageno == i){ %>
					『<%=i %>』
				<%}else{ %>
					<%=i %>
				<%} %>
			</a> 
	<%} %>
 
<a class="btn btn-primary" href="../products/products.jsp?pageno=<%=next_pageno%>" >[다음]</a>
<a class="btn btn-secondary" href="../products/products.jsp?pageno=<%=total_page %>">&raquo;</a>
</div>
<hr>
	<jsp:include page="../main/footer.jsp" flush="false"/>

</body>
</html>