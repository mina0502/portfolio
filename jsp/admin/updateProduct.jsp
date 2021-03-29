<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="../main/menu.jsp" flush="false"/>
	

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%@ include file="../db/dbconn.jsp" %>
	
	<%
		//제품을 편집할 id 값이 넘어오는 것을 받고 있음
//		String productId= request.getParameter("id");
	
		String code = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs= null;
	
		String sql="select * from jpdrama where jp_code=?";
	
	//Connection객체로 부터 쿼리를 주고 PreparedStatment를 얻고 있음
	pstmt=conn.prepareStatement(sql); 
	
	pstmt.setString(1,code);
	//쿼리문의 결과를 받아오고 있음
	rs=pstmt.executeQuery();
	
	if(rs.next())
	{
	%>	
	
	<div class="container">
		<div class="row">
			<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("jp_filename") %>"
				style="width: 20%">
		</div>
		<div class="col-md-7">
			
			<form action="../admin/processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			
				<div class="form-group row">
					<label class="col-sm-3">상품 코드</label>
					<div class="col-sm-3">
						<input type="text" id="code" name="code" class="form-control" value="<%=rs.getString("jp_code")%>"readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">이름</label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control" value="<%= rs.getString("jp_name")%>">
					</div>
				</div>
				
				<div class="form-group row">
				<label class="col-sm-3">방송년도</label>
					<div class="col-sm-3">
						<input type="text" id="year" name="year" class="form-control" value="<%=rs.getString("jp_year")%>">
					</div>
				</div>
				
				<div class="form-group row">
				<label class="col-sm-3">부작</label>
					<div class="col-sm-3">
						<input type="text" id="bu" name="bu" class="form-control" value="<%=rs.getString("jp_bu")%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">설명</label>
					<div class="col-sm-9">
					<textarea id="description" name="description" cols="50" rows="2" class="form-control"><%= rs.getString("jp_description")%></textarea>
					</div>
				</div>
				
				
				<div class="form-group row">
					<label class="col-sm-3">장르</label>
					<div class="col-sm-3">
						<input type="text" id="genre" name="genre" class="form-control" value="<%= rs.getString("jp_genre")%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">방송</label>
					<div class="col-sm-3">
						<input type="text" id="broad" name="broad" class="form-control" value="<%= rs.getString("jp_broad")%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">등장인물</label>
					<div class="col-sm-3">
						<input type="text" id="person" name="person" class="form-control" value="<%= rs.getString("jp_person")%>">
					</div>
				</div>
				
				
				<div class="form-group row">
					<label class="col-sm-3">이미지</label>
					<div class="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="편집완료">
					</div>
				</div>
			</form>
				
		</div>
	</div>
	<%
	}
	
	if(rs!=null)
	{
		rs.close();
	}
	if(pstmt!=null)
	{
		pstmt.close();
	}
	if(conn!=null)
	{
		conn.close();
	}
	%>
</body>
</html>