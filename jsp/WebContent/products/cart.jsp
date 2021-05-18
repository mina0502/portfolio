<%@page import="com.mina.drama.WishDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<%
	String cartId = session.getId();
	String loginId= (String)session.getAttribute("sessionId");
%>


<meta charset="UTF-8">
<title>찜목록</title>
</head>
<body>
<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">찜목록</h2>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>"class="btn btn-danger">전체삭제</a></td>
				</tr>
			</table>
		</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th class="col-md-8" align="center">제목</th>
						<th class="col-md-4" align="center" >비고</th>
					</tr>
					
					<%
						DramaDAO dd = new DramaDAO();
					
						ArrayList WishList = dd.Cart(loginId);
						for(int i=0;i<WishList.size();i++)
						{
							WishDramaBean wb =(WishDramaBean) WishList.get(i);
					%>
					<tr>
						<td class="col-md-8"><%=wb.getP_id() %></td>
						<td class="col-md-4"><a href="../products/removeCart.jsp?id=<%=wb.getP_id()%>" class="badge badge-danger">삭제</a></td>
					</tr>
					<%
						}
					%>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</table>
				<a href="./products.jsp" class="btn btn-secondary"> &raquo;드라마 둘러보기  &laquo;</a>
			</div>
			<hr>
	</div>
	<jsp:include page="../main/footer.jsp"/>	
</body>
</html>