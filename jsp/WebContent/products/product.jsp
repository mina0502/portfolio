<%@page import="com.mina.drama.JPDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/exceptionNoProductId.jsp"%>
    <%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("utf-8"); 
	String code= request.getParameter("id");
%>
<html>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">-->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>드라마 상세정보</title>
<script type="text/javascript">

function addToCart() {
	
	if(confirm("해당 드라마를 찜목록에 추가 하시겠습니까?"))
		{
			document.addForm.submit();
		}
	else
		{
			document.addForm.reset();
		}
}
</script>
</head>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">드라마 정보</h2>
		</div>
	</div>
	

	
	<%
		DramaDAO dd = new DramaDAO();
	
		JPDramaBean jb= dd.getDetailList(code);
	%>
	
	
	<div class="container">
		<div class="row">
		
			<div class="col-md-5">
				<%-- <img src="d:/upload/<%=rs.getString("p_filename") %>"
				style="width: 100%"> --%>
				 <a href="../products/product_down.jsp?filename=<%=jb.getJp_filename()%>"><img src="${pageContext.request.contextPath}/resources/images/<%=jb.getJp_filename()%>"
				style="width: 50%"></a><br/>
				<p><b>이미지를 클릭하시면 이미지가 <font color="red">다운</font>이 됩니다.</b></p> 	
			</div>
			
			<div class="col-md-6">
				<h3><%=jb.getJp_name()%></h3>
				<p><%=jb.getJp_description() %></p>
				<p><b>장르 : </b><%=jb.getJp_genre() %></p>
				<p><b>방송사 : </b><%=jb.getJp_broad() %></p>
				<p><b>방송 년도:</b><%=jb.getJp_year()%></p>
				<p><b>등장인물 : </b><%=jb.getJp_person()%></p>
				
				
				<p><form name="addForm" action="${pageContext.request.contextPath}/products/addCart.jsp?id=<%=jb.getJp_code() %>" method="post">
					<input type="hidden" name="jp_name" value="<%=jb.getJp_name()%>">
					<a href="#" class="btn btn-info" onclick="addToCart()">찜하기 &raquo;</a>
					<a href="${pageContext.request.contextPath}/products/cart.jsp" class="btn btn-warning">찜목록 &raquo;</a>
					<a href="${pageContext.request.contextPath}/products/products.jsp" class="btn btn-secondary">드라마목록 &raquo;</a>
					</form>
			</div>
			<%
	
	%>
		</div>
		<hr/>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>