<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("search");
	

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원찾기 결과창</title>
</head>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원찾기 결과창</h1>
		</div>
		<hr>
	<%
	String searchID=(String)session.getAttribute("searchID");
	session.removeAttribute("searchId");
		if(id.equals("id"))
		{
			
	%>
	
		<h3 align="center">아이디는<font color="blue"><%=searchID%></font> 입니다.</h3>
	</div>
	<%
		}
	%>
	
	<%
		if(id.equals("pw"))
		{

	%>
	</div>

	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-4">
			<h3 class="form-signin-heading">회원 비밀번호변경</h3>
			<form action="../members/processResultSearch.jsp" method="post">
				<input type="hidden" name="id" value="<%=searchID%>">
				<div class="form-group">
					<label class="sr-only">비밀번호</label> 
					<input type="password" class="form-control" placeholder="비밀번호" name="password1" required>
				</div>
				<div class="form-group">
					<label class="sr-only">비밀번호 재입력</label> 
					<input type="password" class="form-control" placeholder="비밀번호" name="password2" required>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-success" value="확인">
				</div>
			</form>
		</div>
	</div>
	<%
		}
	if(id.equals("complete"))
	{
	%>
		<div class="jumbotron">
		<div class="container">
			<h3 class="alert alert-danger">비밀번호가 수정되었습니다.</h3>
		</div>
	</div>
	</div>
	<%
	}
	%>
	<jsp:include page="../main/footer.jsp" flush="false"/>
</body>
</html>