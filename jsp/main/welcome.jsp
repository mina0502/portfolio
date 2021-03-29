<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drama World</title>
</head>
<% request.setCharacterEncoding("utf-8"); %>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
<%	
	String logo = "Mina's Drama Wrold";
%>
	<div class="jumbotron" align="center">
		<div class="container">
			<h1 class="display-3"><%=logo %></h1>
		</div>
		<hr>
	</div>
	<jsp:include page="../main/footer.jsp" flush="false"/>
</body>
</html>