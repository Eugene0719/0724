<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Database SQL</title>
</head>
<body>
	<form method="post" action="insert_process.jsp">
		<p>���̵� : <input type="text" name= "id"/>
		<p>��й�ȣ : <input type="password" name="passwd"/>
		<p>�̸� : <input type="text" name="name"/>
		<p><input type="submit" value="������"/>
		<p><input type="button" value="����" onclick="location.href='select.jsp'"/>
	</form>
</body>
</html>