<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mina.drama.MembersDramaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mina.drama.DramaDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var error="";
</script>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("text/html charset=utf-8");
String id = request.getParameter("id");
boolean check=true;
DramaDAO dd = new DramaDAO();
ArrayList MemberList = dd.getMemberList();

for(int i=0; i<MemberList.size();i++)
{
	MembersDramaBean mb = (MembersDramaBean) MemberList.get(i);
	
	if(mb.getId().equals(id))
	{ 
%>
	<script>
		error+="ID가 중복됩니다";
	</script>
<%
	check=false;
	}
}

if(check)
{
%>
<script type="text/javascript">

	if(confirm("이 아이디를 사용하시겠습니까?\nDo You Want to use this ID?"))
			{
				opener.document.getElementById("user_id").value="<%=id%>";
				window.close();
			}
	else
		{
		opener.document.getElementById("user_id").value="";
			window.close();
		}
	 
 </script>
<%
}
else
{
%>
	<script>
		alert(error);
		window.close();
	</script>
<%
}
%>
