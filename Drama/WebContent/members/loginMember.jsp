<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<%! int cnt=0; %>
		<div class="container" align="center">
		<div class="col-md-5 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			
			<%
								
				String error= request.getParameter("error");
				if(error!=null)
				{
					if(cnt==3){
					out.println("<div class='alert alert-danger'> ");
					out.println("존재하는 아이디가 없습니다. 회원가입을 해주세요!");
					out.println("</div>");
					}
					else
					{
						out.println("<div class='alert alert-danger'> ");
						out.println("아이디와 비밀번호를 확인해주세요!");
						out.println("</div>");
					}
					cnt++;
				}
				
			%>
			
			<form class="form-signin" action="LoginPro.do" action="j_security_check" method="post">
				
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="아이디" name="id" required autofocus>
				</div>
				
				<div class="form-group">
					<label for="inputUserPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="비밀번호" name="password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
				<br/>
				<div>
					<a href="../members/searchMember.jsp?search=id" class="btn btn-primary">아이디 찾기</a>
					<a href="../members/searchMember.jsp?search=pw" class="btn btn-secondary">비밀번호 찾기</a>
				</div>
		</div>
	</div>
</body>
</html>
