<%@page import="com.mina.drama.JPDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
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
	int PageSize = toInt(request.getParameter("PageSize"));
	if (PageSize < 1) {
		PageSize = 9;
	}
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
			location.href=link+"?PageSize="+page;
			
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
/**************DramaDAO--> getTotal_record	************/
			int total_record= dd.getProductsNum();
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
			<%
				/* for(int i=0;i<listofProducts.size();i++)
				{
					Product product= listofProducts.get(i); */
					
		/****************** ArrayList **************************/
				
				ArrayList DramaList = dd.getDramaList(PageSize, record_start_no);
					for(int i=0; i<DramaList.size();i++)
					{
						JPDramaBean jb =(JPDramaBean) DramaList.get(i);
			%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resources/images/<%=jb.getJp_filename()%>" 
				style="width: 50%">
				<h3><%=jb.getJp_name() %></h3>
				<h5><strong>부작: <%=jb.getJp_bu() %></strong></h5>

				
				<p><a href="../products/product.jsp?id=<%=jb.getJp_code()%>"
				class="btn btn-secondary" role="button">상세정보 &raquo;</a></p> 
				
			</div>
<%
					}
%>
		</div>
	</div>
	
	<div align="center">
	<a class="btn btn-secondary" href="../products/products.jsp?pageno=1&PageSize=<%=PageSize%>">&laquo;</a>
	<a  class="btn btn-primary" href="../products/products.jsp?pageno=<%=prev_pageno%>&PageSize=<%=PageSize%>">[이전]</a> 
		<%for(int i =StartNum;i<=EndNum;i++)
		{%>
			<a class="btn btn-success" href="../products/products.jsp?pageno=<%=i %>&PageSize=<%=PageSize%>">
				<%if(pageno == i){ %>
					『<%=i %>』
				<%}else{ %>
					<%=i %>
				<%} %>
			</a> 
	<%} %>
 
<a class="btn btn-primary" href="../products/products.jsp?pageno=<%=next_pageno%>&PageSize=<%=PageSize%>" >[다음]</a>
<a class="btn btn-secondary" href="../products/products.jsp?pageno=<%=total_page %>&PageSize=<%=PageSize%>">&raquo;</a>
</div>
<hr>
	<jsp:include page="../main/footer.jsp" flush="false"/>

</body>
</html>