<%@page import="email.random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
 random r = new random();

String content = r.randomNum();

session.setAttribute("content", content);

%>
</head>
<body>
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-4">

			<form method="post" action="../email/processEmail.jsp">

				<input type="hidden" name="content" value="<%=content%>"> <label>E-mail
				</label>
				<div class="col-sm-12">

					<input type="email" name="receiver" class="form-control"
						placeholder="Email Address" required="required">

				</div>

			<label style="font-size: 15px; text-align: center; margin-top: 50px;">
			개인정보 수집 및 이용에 관한 동의 </label><br/>

			<button type="submit" class="btn btn-success btn-send">Send Now</button>
		
		</form>
	</div>
	</div>
</body>
</html>