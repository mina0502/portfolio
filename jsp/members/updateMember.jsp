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
<script type="text/javascript">
function CheckDeleteMember() {
	
	if(confirm("삭제하시겠습니까?\nDo You Want to delete ID?"))
		{
			window.location.href="../members/deleteMember.jsp";
		}
	else
		{
			return;
		}
}
</script>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message" >
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정 </h1>
		</div>
	</div>
	<%@ include file="../db/dbconn.jsp" %>
	
	<%
		String id= (String)session.getAttribute("sessionId");
		PreparedStatement pstmt = null;
		ResultSet rs= null;
	
		String sql="select * from members where id= ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next())
		{
	%>
	<div class="container">
		<div class="text-right">
			<button type="button" class="btn btn-danger" onclick="CheckDeleteMember()">회원탈퇴</button>
		</div>
	</div>
		<div class="col-md-7">
			<form action="../members/prodcessUpdate.jsp" method="post">
				<input type="hidden" id="id" name="id" value=<%=id %>>
				<div class="form-group row">
						<label class="col-sm-3"><fmt:message key="user_pw"/></label>
						<div class="col-sm-3">
				<input type="password" id="pw" name="pw" class="form-control" value=<%=rs.getString("password") %>>
						</div>
				</div>
				
				<div class="form-group row">
						<label class="col-sm-3"><fmt:message key="user_email"/></label>
						<div class="col-sm-3">
				<input type="text" id="mail" name="mail" class="form-control" value=<%=rs.getString("mail") %>>
						</div>
				</div>
				<% 
					String phone = rs.getString("phone"); 
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
				
				<div class="form-group row">
						<label class="col-sm-3"><fmt:message key="user_address"/></label>
						<div class="col-sm-3">
				<input type="text" id="address" name="address" class="form-control" value=<%=rs.getString("address") %>>
						</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-success" value="수정완료">
						<input type="reset" class="btn btn-secondary" value="리셋">
					</div>
				</div>
				
			</form>	
		</div>
		
	<%
		}
		if(rs!=null)
		{
			rs.close();
		}
		if(pstmt!=null)
		{
			pstmt.close();
		}
		if(conn!=null)
		{
			conn.close();
		}
	%>
</fmt:bundle>
</body>
</html>