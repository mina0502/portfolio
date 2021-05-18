<%@page import="secure.AES256Util"%>
<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>

</head>
<body>
<%
DramaDAO dd= new DramaDAO();
AES256Util aes = new AES256Util();

String currentpw=request.getParameter("currentpw");
String changepw = request.getParameter("changepw");
String changepwCk = request.getParameter("changepwCk");
String id =(String) session.getAttribute("sessionId");

MembersDramaBean mb = dd.LoginMember(id);
String cpw=mb.getPw();

System.out.println("cpw 확인: "+cpw);

cpw=aes.decrypt(cpw);
if(currentpw.equals(cpw))
{
	if(changepw.equals(changepwCk))
	{
		String hpw=aes.encrypt(changepw);
		dd.UpdatePW(id, hpw);
		%>
		<script type="text/javascript">
			alert("비밀번호가 변경되었습니다.");
			window.open('','_self').close();
		</script>
		<%
	}
	else
	{
		%>
		<script type="text/javascript">
			alert("변경할 비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
		<%
	}
}
else{
	%>
	<script type="text/javascript">
		alert("현재 비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
	<% 
}

%>
</body>
</html>