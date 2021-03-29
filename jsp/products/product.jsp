<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/exceptionNoProductId.jsp"  %>
    <%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); 
DecimalFormat dfFormat= new DecimalFormat("###,###");
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
	
<%@ include file="../db/dbconn.jsp" %>
	
	<%
		//제품을 편집할 id 값이 넘어오는 것을 받고 있음
		String code= request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs= null;
	
	String sql="select * from jpdrama where jp_code=?";
	
	//Connection객체로 부터 쿼리를 주고 PreparedStatment를 얻고 있음
	pstmt=conn.prepareStatement(sql); 
	
	pstmt.setString(1,code);
	//쿼리문의 결과를 받아오고 있음
	rs=pstmt.executeQuery();
	
	if(rs.next())
	{
	%>
	
	
	<div class="container">
		<div class="row">
		
			<div class="col-md-5">
				<%-- <img src="d:/upload/<%=rs.getString("p_filename") %>"
				style="width: 100%"> --%>
				 <img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("jp_filename") %>"
				style="width: 50%"> 	
			</div>
			
			<div class="col-md-6">
				<h3><%=rs.getString("jp_name")%></h3>
				<p><%=rs.getString("jp_description") %></p>
				<% 
				//<p><b>코드 : </b><span class="badge badge-danger">  <%=rs.getString("jp_code") %=> </span></p>  
				%>
				<p><b>장르 : </b><%=rs.getString("jp_genre") %></p>
				<p><b>방송사 : </b><%=rs.getString("jp_broad") %></p>
				<p><b>방송 년도:</b><%=rs.getString("jp_year") %>
				<p><b>등장인물 : </b><%=rs.getString("jp_person")%></p>
				
				<p><form name="addForm" action="${pageContext.request.contextPath}/products/addCart.jsp?id=<%=rs.getString("jp_code") %>" method="post">
					<input type="hidden" name="jp_name" value="<%=rs.getString("jp_name")%>">
					<a href="#" class="btn btn-info" onclick="addToCart()">찜하기 &raquo;</a>
					<a href="${pageContext.request.contextPath}/products/cart.jsp" class="btn btn-warning">찜목록 &raquo;</a>
					<a href="${pageContext.request.contextPath}/products/products.jsp" class="btn btn-secondary">드라마목록 &raquo;</a>
					</form>
			</div>
			<%}
	if(rs!=null)
	{
		rs.close();
	}
	if(pstmt !=null)
	{
		pstmt.close();
	}
	if(conn !=null)
	{
		conn.close();
	}
	%>
		</div>
		<hr/>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>