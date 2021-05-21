<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
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
<title>회원 수정</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../resources/js/post.js" type="text/JavaScript"></script>
<script src="../resources/js/checker.js" type="text/JavaScript"></script>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message" >
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정 </h1>
		</div>
	</div>
	
	<%
		DramaDAO dd = new DramaDAO();
	
		String id= (String)session.getAttribute("sessionId");
		
		PreparedStatement pstmt = null;
		ResultSet rs= null;
	
		MembersDramaBean mb = (MembersDramaBean) dd.UpdateMembers(id);
		
		if(mb!=null)
		{
	%>
	<div class="container">
		<div class="text-right">
			<button type="button" class="btn btn-danger" onclick="CheckDeleteMember()">회원탈퇴</button>
		</div>
	</div>
		<div class="col-md-7">
			<form name="updateMember" action="../members/processUpdate.jsp" method="post">
				<input type="hidden" id="id" name="id" value=<%=mb.getId() %>>
				<div class="form-group row">
						<label class="col-sm-3"><fmt:message key="user_pw"/></label>
						<div class="col-sm-3">
								<input type="password" id="pw" name="pw" class="form-control" readonly>
						</div>
						<input class="btn btn-primary btn-sm" type="button" value="비밀번호 변경" onclick="check_pw()">						
				</div>
				
				<div class="form-group row">
						<label class="col-sm-3"><fmt:message key="user_email"/></label>
						<div class="col-sm-3">
							<input type="button" class="btn btn-warning"value="<fmt:message key="email_check"/>" onclick="email()"/><br/><br/>
							<input type="text" id="user_email" name="mail" class="form-control" readonly> <!-- mb.getMail() -->
						</div>
				</div>
				<% 
					String phone = mb.getPhone(); 
					String[]phoneNum = phone.split("-");
				%>
				<div class="form-group row">
					<label class="col-sm-3"><fmt:message key="user_phone"/></label>
					<div class="col-sm-8">
		 				<select name="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" maxlength="4" size="4" name="phone2" value="<%= phoneNum[1]%>"> -
						<input type="text" maxlength="4" size="4" name="phone3" value="<%=phoneNum[2]%>">
		 			</div>
				</div>
				<%
					String[] address=mb.getAddress().split("/");
					String post_address= address[0];
					String user_address= address[1];
					String detail_address= address[2];
				%>
				<div class="form-group row">
					
					<div class="col-sm-3">
						<input type="button" class="btn btn-warning" value="우편번호 찾기" onclick="execDaumPostcode()"><br/><br/>
						<label class="col-sm-8"><fmt:message key="post_address"/></label>
						<input type="text" name="post_address" id="post_address" class="form-control" value="<%=post_address%>" readonly required><br/>
						<label class="col-sm-4"><fmt:message key="user_address"/></label>
		 				<input type="text" name="user_address" id="user_address" class="form-control" value="<%=user_address%>" readonly required><br/>
		 				<label class="col-sm-8"><fmt:message key="detail_address"/></label>
		 				<input type="text" name="detail_address" id="detail_address" class="form-control" value="<%=detail_address%>" required><br/>
		 			</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-success" value="수정완료" onclick="checkUpdateMember()">
						<input type="reset" class="btn btn-secondary" value="리셋">
					</div>
				</div>
				
			</form>	
		</div>
		
	<%
		}
	%>
</fmt:bundle>
</body>
</html>