<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp" %>
	<%
		String id= request.getParameter("id");
		

		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("../products/products.jsp");
			return;
		}
	
		String loginId = (String)session.getAttribute("sessionId");
		String name =request.getParameter("jp_name");
		boolean rs_check=false;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		System.out.println(name);
		String sql= "select * from members where id= ?";
		pstmt=conn.prepareStatement(sql); 
		pstmt.setString(1, loginId);
		rs=pstmt.executeQuery();
		

		if(rs.next())
		{
			sql = "insert into wish values(null,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,loginId);
			pstmt.setString(2,name);
			pstmt.executeUpdate();
			
			 /* 데이터베이스 중복 체크 */
			sql="delete n1 from wish n1, wish n2 where n1.num>n2.num and n1.l_id=n2.l_id and n1.p_id=n2.p_id";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			/*auto_increment 값 초기화 */
			sql="set @cnt=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.execute();
			
			sql="update wish set wish.num= @cnt:=@cnt+1";	
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			/*auto_increament이 가지고 있는 값을 새로 설정*/
			sql="alter table wish auto_increment=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			if(rs!=null)
			{
				rs.close();
			}
			if(pstmt !=null)
			{
				pstmt.close();
			}
			if(conn !=null)
			{
				conn.close();
			}
			response.sendRedirect("../products/product.jsp?id="+id);//URLEncoder.encode(id)
		}
		else
		{
			response.sendRedirect("../error/exceptionNoLogin.jsp");
		}
	

	%>
</body>
</html>