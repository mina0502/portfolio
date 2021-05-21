<%@page import="email.GoogleAuthentication"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
session.setAttribute("receiver",request.getParameter("receiver"));
String receiver=(String)session.getAttribute("receiver");
String subject = "DramaWorld 인증메일입니다.";
String content = (String)session.getAttribute("content");
response.setContentType("text/html;charset=UTF-8");
String username="miyamotomina686@gmail.com";

try {
	Properties properties = System.getProperties();
	properties.put("mail.smtp.starttls.enable", "true");
	properties.put("mail.smtp.host","smtp.gmail.com");
	properties.put("mail.smtp.auth","true");
	properties.put("mail.smtp.port","587");
	
	
	Authenticator auth = new GoogleAuthentication();
	
	Session s = Session.getDefaultInstance(properties, auth);
	Message message = new MimeMessage(s);
	Address sender_address = new InternetAddress(username);
	Address receiver_address = new InternetAddress(receiver);
	message.setHeader("content-type", "text/html;charset=UTF-8");
	message.setFrom(sender_address);
	message.setReplyTo(new Address[]{sender_address});
	message.addRecipient(Message.RecipientType.TO, receiver_address);
	message.setSubject(subject);
	message.setContent("인증 번호는 "+content+" 입니다.","text/html;charset=UTF-8");
	message.setSentDate(new java.util.Date());
	message.saveChanges();
	Transport.send(message);
	%>
		<script>
	alert('메일이 성공적으로 발송되었습니다');
	location.href='../email/email_chk.jsp';
	</script>
	
	<%
} catch (Exception e) {
	out.println("SMTP 서버가 잘못설정되었거나 서비스에 문제가 있습니다.");
	e.printStackTrace();
}
%>

</body>
</html>