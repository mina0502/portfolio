<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var id=opener.document.getElementById("user_id").value;
if(id.length>10)
	{
		alert("아이디는 10자 미만으로 해주세요");
		window.close();
	}
if(!id)
	{
		alert("아이디를 입력해주세요");
		window.close();
	}


location.href="../id/processId.jsp?id="+id;
</script>
</head>
<body>

</body>
</html>