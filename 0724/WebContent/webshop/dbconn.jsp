<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;

	
	String url = "jdbc:mysql://localhost:3306/smartweb";
	String user = "root";
	String password = "1111";
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
	if(conn==null){
		System.out.println("연결실패");
	}else{
		System.out.println("연결성공");
		}
	}catch(Exception e){
		System.out.println("오류 "+e);
	}
%>


</body>
</html>