<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% 
	request.setCharacterEncoding("utf-8");
	//로그인 여부를 판단
	String sessionId=(String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
		
			<div class="navbar-header">
				<a class="navbar-brand" href="../main/welcome.jsp">HOME</a>
			</div>

						

			<div>
				<ul class="navbar-nav mr-auto"> 
						<li class="nav-item"><jsp:include page="../covid19/covid19.jsp"/></li>
						<li class="nav-item"><jsp:include page="../Weather/Weather.jsp"/></li>
					<c:choose>
						<c:when test="${empty sessionId }">
							<li class="nav-item"><a class="nav-link" 
							href="<c:url value="../members/loginMember.jsp"/> ">로그인</a></li>
							
							<li class="nav-item"><a class="nav-link" 
							href="<c:url value="/members/addMember.jsp"/> ">회원가입</a></li>
							
						</c:when>
						
						<c:otherwise>
							<li style="padding-top: 7px; color:white">[<%=sessionId %>님]</li>
							
							<li class="nav-item"><a class="nav-link" href="<c:url value="../products/cart.jsp"/> ">찜목록</a></li>
							
							<li class="nav-item"><a class="nav-link" href="<c:url value="../members/updateMember.jsp"/> ">회원수정</a></li>
							
							<li class="nav-item"><a class="nav-link" href="<c:url value="../members/logoutMember.jsp"/> ">로그아웃</a></li>
						
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${sessionId eq 'admin' }">
							<li class="nav-item"><a class="nav-link" href="../products/products.jsp">드라마 목록</a></li>
							<li class="nav-item"><a class="nav-link" href="../admin/addProduct.jsp">드라마 등록</a></li>
							<li class="nav-item"><a class="nav-link" href="../admin/editProduct.jsp?edit=update">드라마 수정</a></li>
							<li class="nav-item"><a class="nav-link" href="../admin/editProduct.jsp?edit=delete">드라마 삭제</a></li>
							<li class="nav-item"><a class="nav-link" href="../rvdrama/review.jsp">리뷰 목록</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="../products/products.jsp">드라마 목록</a></li>
							<li class="nav-item"><a class="nav-link" href="../rvdrama/review.jsp">리뷰 목록</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>