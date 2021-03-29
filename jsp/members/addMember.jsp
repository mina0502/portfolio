
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">

function clickMember()
{
	var regExpId=/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName = /^[가-힣|a-z|A-Z]*$/;
	var regExpPhone= /^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	/*DOM 객체형의 멤버로 변수에 할당*/
	var form= document.AddMember;
	var id = form.user_id.value;
	var name= form.user_name.value;
	var phone = form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
	var email = form.user_email.value;
	var pw= form.user_pw.value;
	var birth=form.user_birth.value;
	var address=form.user_address.value;
	

	
	
	if(!regExpId.test(id))
		{
			alert("id는 문자로 시작해주세요");
			return;
		}
	if(pw=="")
	{
		alert("비밀번호는 필수로 입력하셔야 합니다");
		return;
	}
	
	if(name=="")
	{
		alert("이름은 비워두실 수 없습니다.");
		return;
	}
	
	if(!regExpName.test(name))
	{
		alert("이름 형식이 올바르지 않습니다");
		return;
	}
	
	if(birth=="")
	{
		alert("생일을 입력해주세요");
		return;
	}
	
	if(!regExpEmail.test(email))
	{
		alert("Email을 입력해주세요");
		return;
	}
	
	if(!regExpPhone.test(phone))
	{
		alert("연락처 입력을 확인해 주세요");
		return;
	}
	
	if(address=="")
	{
		alert("주소를 입력해주세요");
		return;
	}
	
	 form.submit(); 
}

</script>
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
			<h3 class="form-signin-heading">Please register in</h3><br/>

				<form name="AddMember" action="../members/processAddMember.jsp" method="post">
				
				<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_id"/></label>
					<div class="col-sm-3">
			 			<input type="text" placeholder="<fmt:message key="user_id"/>" name="user_id" required autofocus><br/>
			 		</div>
		 		</div>
		 				 		
		 		<div class="form-group row">
					<label class="col-sm-4"><fmt:message key="user_pw"/></label>
					<div class="col-sm-3">
		 				<input type="password" placeholder="<fmt:message key="user_pw"/>" name="user_pw" required><br/>
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
		 				<input type="radio"	 name="user_gender" value="<fmt:message key="user_male"/>" checked><fmt:message key="user_male"/><br/>
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
		 				<input type="text" placeholder="<fmt:message key="user_email"/>" name="user_email" >
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
		 				<input type="text" placeholder="<fmt:message key="user_address"/>" name="user_address" required>
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