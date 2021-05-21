
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<% request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../resources/js/post.js" type="text/JavaScript"></script>
<script src="../resources/js/checker.js" type="text/JavaScript"></script>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message" >
	<jsp:include page="../main/menu.jsp" flush="false"/>
<%	
	String register = "회원 가입";
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=register %></h1>
		</div>
		<hr>
	</div>
	
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a>||<a href="?language=en">english</a>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-4">
			<h3 class="form-signin-heading"><fmt:message key="registerpage"/></h3><br/>

				<form name="AddMember" action="../members/MemberAddPro.do" method="post">
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_id"/></label>
					<div class="col-sm-3">
			 		<input type="text" placeholder="<fmt:message key="user_id"/>" id= "user_id" name="user_id" required autofocus ><br/><br/>
			 		<input class="btn btn-warning" type="button" value="<fmt:message key="id_check"/>" onclick="test()">
			 		</div>
		 		</div>
		 				 		
		 		<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_pw"/></label>
					<div class="col-sm-3"> 
		 				<input type="password" placeholder="<fmt:message key="user_pw"/>" name="user_pw" required><br/>
		 			</div>
		 		</div>
		 		
		 		<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_pw2"/></label>
					<div class="col-sm-3"> 
		 				<input type="password" placeholder="<fmt:message key="user_pw2"/>" name="user_pw2" required><br/>
		 			</div>
		 		</div>
		 		
		 		<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_name"/></label>
					<div class="col-sm-3">
		 				<input type="text" placeholder="<fmt:message key="user_name"/>" name="user_name" required>
		 			</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_gender"/></label>
					<div class="col-sm-3">
		 				<input type="radio"	name="user_gender" value="<fmt:message key="user_male"/>" checked><fmt:message key="user_male"/><br/>
		 				<input type="radio" name="user_gender" value="<fmt:message key="user_female"/>"><fmt:message key="user_female"/><br/>
		 				<input type="radio" name="user_gender" value="<fmt:message key="user_other"/>"><fmt:message key="user_other"/><br/>
		 			</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_birth"/></label>
					<div class="col-sm-3">
		 				<input type="date" placeholder="<fmt:message key="user_birth"/>" name="user_birth" required>
		 			</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_email"/></label>
					<div class="col-sm-3">
						<input type="button" class="btn btn-warning"value="<fmt:message key="email_check"/>" onclick="email()"/><br/><br/>
		 				<input type="text" id="user_email"placeholder="<fmt:message key="user_email"/>" name="user_email" readonly >
		 			</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_phone"/></label>
					<div class="col-sm-8">
		 				<select name="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" maxlength="4" size="4" name="phone2"> -
						<input type="text" maxlength="4" size="4" name="phone3">
		 			</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_address"/></label>
					<div class="col-sm-3">
						<input type="button" class="btn btn-warning" value="<fmt:message key="post"/>" onclick="execDaumPostcode()"><br/><br/>
						<input type="text" placeholder="<fmt:message key="post_address"/>" name="post_address" id="post_address"  required readonly>
		 				<input type="text" placeholder="<fmt:message key="user_address"/>" name="user_address" id="user_address" required readonly><br/>
		 				<input type="text" placeholder="<fmt:message key="detail_address"/>" name="detail_address" id="detail_address" required><br/>
		 			</div>
				</div>
				
				<div class="form-group row" align="right">
					<div class="col-sm-3">
						<input class="btn btn-primary" type="button" value="<fmt:message key="register"/>" onclick="clickMember()">
					</div>
					<div class="col-sm-3">
						<input class="btn btn-secondary" type="reset" value="<fmt:message key="reset"/>">
					</div>
				</div>
				</form>
		</div>
	</div>
	<hr>
	<jsp:include page="../main/footer.jsp" flush="false"/>
	</fmt:bundle>
</body>
</html>