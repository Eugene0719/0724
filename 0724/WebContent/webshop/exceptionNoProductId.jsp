<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ���̵� ����</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">�ش� ��ǰ�� �������� �ʽ��ϴ�.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString() %>
		<p>	<a href="./products.jsp" class="btn btn-secondary">��ǰ ��� &raquo;</a>
	</div>
</body>
</html>