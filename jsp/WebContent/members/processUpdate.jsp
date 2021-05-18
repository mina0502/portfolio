<%@page import="com.mina.drama.DramaDAO"%>
<%@page import="secure.AES256Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
public String UpdateCheck(String pw, String mail){
	if(!mail.equals("") && !pw.equals(""))
	{
		return "all";
	}
	else if(!mail.equals("") && pw.equals(""))
	{
		return "mail";	
	}
	else if(mail.equals("")&&!pw.equals(""))
	{
		return "pw";
	}
	else
	{
		return "no";
	}
	
}
%>

<%
	request.setCharacterEncoding("utf-8");
	String id =(String)session.getAttribute("sessionId");
	String pw= request.getParameter("pw");
	String mail = request.getParameter("mail");
	String phone1= request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3= request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	String post_address= request.getParameter("post_address");
	String user_address = request.getParameter("user_address");
	String detail_address = request.getParameter("detail_address");
	String address = post_address+"/"+user_address+"/"+detail_address;
	
	AES256Util secure=new AES256Util();
	String hpw= secure.encrypt(pw);

	
	boolean check = false;
	DramaDAO dd = new DramaDAO();
	
	if(UpdateCheck(pw, mail).equals("all"))
	{
		if(dd.UpdateMemberCheck(id))
		{
			dd.UpdateMember(hpw, mail, phone, address, id);
			check=true;
		}
	}
	else if(UpdateCheck(pw, mail).equals("pw"))
	{
		if(dd.UpdateMemberCheck(id))
		{
			dd.UpdatePWMember(hpw, phone, address, id); 
			check=true;
		}
	}
	else if(UpdateCheck(pw, mail).equals("mail"))
	{
		if(dd.UpdateMemberCheck(id))
		{
			dd.UpdateMailMember(mail, phone, address, id);
			check=true;
		}
	}
	else
	{
		if(dd.UpdateMemberCheck(id))
		{
			dd.UpdateMember(phone, address, id);
			check=true;
		}
	}
	
	if(check)
	{
		response.sendRedirect("../members/resultMember.jsp?msg=0"); 
	}
	else
	{
		response.sendRedirect("../members/exceptionNoUpdate.jsp"); 
	}
%>
