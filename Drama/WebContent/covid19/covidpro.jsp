<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String strAns1=request.getParameter("strAns1");
String strAns2=request.getParameter("strAns2");
String strAns3=request.getParameter("strAns3");
String strAns4=request.getParameter("strAns4");
String strAns5=request.getParameter("strAns5");
String strAns6=request.getParameter("strAns6");
String strAns7=request.getParameter("strAns7");
String strAns8=request.getParameter("strAns8");
String strAns9=request.getParameter("strAns9");
String strAns10=request.getParameter("strAns10");
String[] strArr={strAns1,strAns2,strAns3,strAns4,strAns5,strAns6,strAns7,strAns8,strAns9,strAns10};
boolean check = false;
for(int i=0;i<strArr.length;i++)
{
	if(strArr[i].equals("true"))
	{
		check = true;
		break;
	}
	else
	{
		check=false;
	}
}
%>
<%=check%>

