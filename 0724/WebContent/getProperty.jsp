<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Action Tag</title>
</head>
<body>
		<jsp:useBean id="person" class="webshop.Person" scope="request"/>
	<p> 아이디 : <jsp:getProperty property="id" name="person"/>
	<p> 이 름 :	<jsp:getProperty property="name" name="person"/>

</body>
</html>