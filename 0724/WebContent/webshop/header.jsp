<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Directives Tag</title>
</head>
<body>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
	<div id="nav" class = "navbar navbar-expand navbar-dark bg-dark">
		<div class = "container">
			<div class = "navbar-brand">
				<a class = "navbar-brand" href="../webshop/welcome.jsp">Home</a>	
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li class = "nav-item"><a class = "nav-link" href="<c:url value="../member/loginMember.jsp"/>">로그인</a></li>
							<li class = "nav-item"><a class = "nav-link" href="<c:url value="../member/addMember.jsp"/>">회원 가입</a></li>
						</c:when>
						<c:otherwise>
							<li class = "nav-item"><a class = "nav-link" href="<c:url value="../member/logoutMember.jsp"/>">로그아웃</a></li>
							<li class = "nav-item"><a class = "nav-link" href="<c:url value="../member/updateMember.jsp"/>">회원 수정</a></li>
						</c:otherwise>
					</c:choose>
					<li class = "nav-item"><a class = "nav-link" href="../webshop/products.jsp">상품 목록</a></li>
					<li class = "nav-item"><a class = "nav-link" href="../webshop/addProduct.jsp">상품 등록</a></li>
					<li class = "nav-item"><a class = "nav-link" href="../webshop/editproduct.jsp?edit=update">상품 편집</a></li>
					<li class = "nav-item"><a class = "nav-link" href="../webshop/editproduct.jsp?edit=delete">상품 삭제</a></li>
					<li class = "nav-item"><a class = "nav-link" href="<c:url value="/webshop/BoardListAction.do?pageNum=1"/>">게시판</a></li>
			

				</ul>
			</div>
		</div>
	</div>
</body>
</html>