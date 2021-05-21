<%@page import="com.mina.drama.DramaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      // 한글처리 
      request.setCharacterEncoding("utf-8");
      
   %>
     <jsp:useBean id="rb" class="com.mina.drama.ReviewDramaBean" />
     <jsp:setProperty property="*" name="rb"/>
   <%   

     DramaDAO dd = new DramaDAO();
     // 해당 글정보를 사용해서 글내용 수정
     int check = dd.updateViewDrama(rb);
    
     if(check == 1){
    	 %>
    	 <script type="text/javascript">
    	    location.href="review.jsp?num=<%=rb.getNum()%>";
    	 </script>
    	 <%
     }
     else{
    	 %>
    	 <script type="text/javascript">
    	   alert(" 해당 글 없음 ! ");
    	   history.back();
    	 </script>
    	 <%
     }
     
     
   %>  
   
   
   
   
   
   
   
   

</body>
</html>