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
		
		<jsp:setProperty property="id" name="person" value="9999999"/>
		<jsp:setProperty property="name" name="person" value="아무무"/>
	<p> 아이디 : <%=person.getId() %> 
	<p> 이 름 :	<%=person.getName() %>

</body>
</html>