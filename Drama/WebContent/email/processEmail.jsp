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
String email = request.getParameter("receiver");
boolean check=true;
DramaDAO dd = new DramaDAO();
ArrayList MemberList = dd.getMemberList();

for(int i=0; i<MemberList.size();i++)
{
	MembersDramaBean mb = (MembersDramaBean) MemberList.get(i);
	
	if(mb.getMail().equals(email))
	{ 
%>
	<script>
		error+="E-Mail이 중복됩니다\n";
	</script>
<%
	check=false;
	}
}

if(check)
{
 response.sendRedirect("../email/emailPro.jsp?receiver="+email);
}
else
{
%>
	<script>
		alert(error);
		window.history.back();
	</script>
<%
}
%>
