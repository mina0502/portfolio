<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<script>
function clickMember()
{
	var form= document.UpdateMember;
	var pw= form.currentpw.value;
	var pw1= form.changepw.value;
	var pw2= form.changepwCk.value;
	if(pw==""||pw1==""||pw2=="")
	{
		alert("모든 비밀번호는 필수로 입력하셔야 합니다");
		return;
	}
	
	 form.submit(); 
}
</script>
</head>
<body>
<%
String id = (String)session.getAttribute("sessionId");
	DramaDAO dd = new DramaDAO();
	MembersDramaBean mb = (MembersDramaBean) dd.LoginMember(id);
%>
<form name="UpdateMember" action="../members/ProPwCheck.jsp" method="post">
	<input type="password" placeholder="현재 비밀번호" id="currentpw" name="currentpw" required><br/><br/>
	<input type="password" placeholder="변경할 비밀번호" id="changepw" name="changepw" required><br/><br/>
	<input type="password" placeholder="변경할 비밀번호 확인" id="changepwCk" name="changepwCk" required><br/><br/>
	<input type="button" value="변경" onclick="clickMember()">&nbsp;&nbsp;
	<input type="reset" value="초기화">
</form>
</body>
</html>