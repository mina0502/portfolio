<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<script type="text/javascript">
function CheckAddProuct() {
	
	if(confirm("등록하시겠습니까?\nDo You Want to Add?"))
		{
			document.newProduct.submit();
		}
	else
		{
			document.newProduct.reset();
		}
}
	
</script>
<title>드라마등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message" >

	<jsp:include page="../main/menu.jsp" flush="false"/>
	<div class="jumbotron">
		<div class="container">
		<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a>||<a href="?language=en">english</a>
			<a href="../members/logoutMember.jsp" class="btn btn-sm btn-success pull-right"><b>로그아웃</b></a>
		</div>
		
		
		<form name="newProduct" action="../admin/processAddProduct.jsp" class="form-horizontal" method="post"
			enctype="multipart/form-data">
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="code"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="code" name="code" class="form-control" placeholder="※필수※드라마 코드번호를 입력하세요">					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="pname"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" placeholder="드라마 이름을 입력하세요">					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="year"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="year" name="year" class="form-control" placeholder="년도를 입력하세요">					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="bu"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="bu" name="bu" class="form-control" placeholder="부작을 입력하세요">					
				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="description"/></b></label>
				<div class="col-sm-5">
					<textarea id="description" name="description" cols="50" rows="2" class="form-control" placeholder="상세정보를 입력하세요"></textarea>										
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="genre"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="genre" name="genre" class="form-control" placeholder="장르를 입력하세요">					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="broad"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="broad" name="broad" class="form-control" placeholder="방송사를 입력하세요">					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="person"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="person" name="person" class="form-control" placeholder="등장인물의 이름을 입력하세요">					
				</div>
			</div>		
			
			<div class="form-group row">
				<label class="col-sm-2"><b><fmt:message key="productImage"/></b></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">					
				</div>
			</div>
			
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key='button'/>" onclick="CheckAddProuct()">					
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
	</fmt:bundle>
</body>
</html>