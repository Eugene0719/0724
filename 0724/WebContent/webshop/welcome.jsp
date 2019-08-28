<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href="../resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
<%@ include file="header.jsp" %>
	
	<%!
	//String greeting = "Welcome to Web Shopping Mall";
	String greeting = "Welcome to Web Shopping Mall";
	String tagline = "Welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
			
				<%= greeting %>
			</h1>
		</div>
	</div>
	<div class ="container">
		<div class ="text-center">
		<a href="./products.jsp" class="btn btn-info btn-lg">   상품   목록   </a>
			<h3>
				<%= tagline %>
			</h3>
			<%
			response.setIntHeader("Refresh", 5);
			Date day=new java.util.Date();
			String am_pm;
			int hour=day.getHours();
			int minute=day.getMinutes();
			int second=day.getSeconds();
			if (hour/12 ==0){
				am_pm="AM";
			}else{
				if(hour==12){
				am_pm="PM";
				hour=12;
				}else{
				am_pm="PM";
				hour=hour-12;
				}				
			}
			String CT=hour + ":" + minute +":"+second+"&nbsp;&nbsp;&nbsp;"+am_pm;
			out.println("현재 접속 시각: "+CT + "\n");
			%>
			
			<div style= "float:right;">
				 <a href="https://www.instagram.com/0719_ugee/?hl=ko">
                     	<img src="instagram_PNG12.png" title="Instagram"></a>
                 <a href="https://www.facebook.com/profile.php?id=100003637133156">
                     	<img src="facebook.png" title="Facebook"></a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>