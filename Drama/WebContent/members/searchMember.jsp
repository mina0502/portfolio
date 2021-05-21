<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%
	request.setCharacterEncoding("utf-8");
	String search=request.getParameter("search");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 찾기</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message" >
	<jsp:include page="../main/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원찾기</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-4">
			<h3 class="form-signin-heading">회원찾기</h3>
<%
	if(search.equals("id"))
	{
%>
	<form class="form-horizontal" action="processSearchMember.jsp?search=id" method="post">
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_email"/></label>
					<div class="col-sm-3">
		 				<input type="text" placeholder="<fmt:message key="user_email"/>" name="user_email" required >
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
				<button class="btn btn btn-lg btn-success btn-block" type="submit">회원 찾기</button>
			</form>
<%
}
if(search.equals("pw"))
{
%>
	<form class="form-horizontal" action="processSearchMember.jsp?search=pw" method="post">
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_id"/></label>
					<div class="col-sm-3">
			 			<input type="text" placeholder="<fmt:message key="user_id"/>" name="user_id" required autofocus><br/>
			 		</div>
		 		</div>
				
				<div class="form-group row"> 
					<label class="col-sm-4"><fmt:message key="user_email"/></label>
					<div class="col-sm-3">
		 				<input type="text" placeholder="<fmt:message key="user_email"/>" name="user_email" required >
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
				<button class="btn btn btn-lg btn-success btn-block" type="submit">회원 찾기</button>
			</form>

<%
} 
%>
		</div>
	</div>
</fmt:bundle>
</body>
</html>