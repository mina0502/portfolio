<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 오류</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">존재하는 코드입니다.</h2>
		</div>
	</div>
	
	<div class="container">
		<p><%=request.getRequestURL() %>
		<!-- 요청 URL을 표시하고 요청 파라메터의 값도 같이 표식을 하고 있는 부분 -->
		<p> <a href="../products/products.jsp" class="btn btn-secondary">드라마 목록 &raquo;</a>
	</div>
	
	<hr>
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>