<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
	<%
	String content = (String)session.getAttribute("content");
	String receiver= (String)session.getAttribute("receiver");
	session.removeAttribute("receiver");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>E-Mail check</title>

<script type="text/javascript">
function check() {
	var code = document.fr.con_chk.value;
	var authNum = <%=content %>;
	
	if(!code) {
		alert("인증번호를 입력해주세요");
		return;
	}
	
	if(authNum == code) {
		
		alert("인증 성공!");
		
	<%
		session.removeAttribute("content");
	%>
		opener.document.getElementById("user_email").value ="<%=receiver%>";
		window.close();
		
	} else {
		alert("인증번호가 틀립니다. 다시 입력해 주세요.");
		return;
	}
}
</script>

</head>
<body>

	<h3 style="text-align: center; margin-top: 100px;">인증번호를 입력해주세요</h3>
	
	<form name="fr" method="post" style="max-width:400px; margin:50px auto;">
		<div class="input-container">
			<span class="log-span2">인증번호</span> <input type="text"
				class="input-field" name="con_chk">
		</div>
		<br>
		<div class="container">
			<input type="button" class="btn btn-success btn-log-2"
				onclick="check(); return false;" style="height: 50px;" value="입력">
		</div>
	</form>

</body>
</html>