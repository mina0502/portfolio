<%@page import="com.mina.drama.JPDramaBean"%>
<%@page import="com.mina.drama.DramaDAO"%>
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
	
	<%
		DramaDAO dd= new DramaDAO();
	
		String code = request.getParameter("id");
		
		JPDramaBean jb= dd.getDetailList(code);
	%>	
	
	<div class="container">
		<div class="row">
			<img src="${pageContext.request.contextPath}/resources/images/<%=jb.getJp_filename() %>"
				style="width: 20%">
		</div>
		<div class="col-md-7">
			
			<form action="../admin/processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			
				<div class="form-group row">
					<label class="col-sm-3">상품 코드</label>
					<div class="col-sm-3">
						<input type="text" id="code" name="code" class="form-control" value="<%=jb.getJp_code()%>"readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">이름</label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control" value="<%= jb.getJp_name()%>">
					</div>
				</div>
				
				<div class="form-group row">
				<label class="col-sm-3">방송년도</label>
					<div class="col-sm-3">
						<input type="text" id="year" name="year" class="form-control" value="<%=jb.getJp_year()%>">
					</div>
				</div>
				
				<div class="form-group row">
				<label class="col-sm-3">부작</label>
					<div class="col-sm-3">
						<input type="text" id="bu" name="bu" class="form-control" value="<%=jb.getJp_bu()%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">설명</label>
					<div class="col-sm-9">
					<textarea id="description" name="description" cols="50" rows="2" class="form-control"><%=jb.getJp_description()%></textarea>
					</div>
				</div>
				
				
				<div class="form-group row">
					<label class="col-sm-3">장르</label>
					<div class="col-sm-3">
						<input type="text" id="genre" name="genre" class="form-control" value="<%=jb.getJp_genre()%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">방송</label>
					<div class="col-sm-3">
						<input type="text" id="broad" name="broad" class="form-control" value="<%=jb.getJp_broad()%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3">등장인물</label>
					<div class="col-sm-3">
						<input type="text" id="person" name="person" class="form-control" value="<%=jb.getJp_person()%>">
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
</body>
</html>