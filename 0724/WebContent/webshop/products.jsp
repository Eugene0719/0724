<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, webshop.dto.Product" %>
<%@ page import="webshop.dao.ProductRepository" %>
<%@ page import="java.sql.*" %>

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
			<h1 class="display-3" align="center">상품 목록</h1>
		</div>
	</div>
		<%
			ProductRepository dao = ProductRepository.getInstance();
			ArrayList<Product> listOfProducts = dao.getAllProducts();
			
		%>
	<div class ="container">
		<div class ="row" align="center">
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
		%>
		
		
		
		
		<div class="col-md-4">
		<img src="../upload/<%=rs.getString("p_fileName") %>" style = "width:100%; height :280px">

			<h3><%=rs.getString("p_name") %></h3>
			<p><%=rs.getString("p_description")%>
			<p><%=rs.getString("p_unitPrice") %>
			<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>" class="btn btn-secondary">상세 정보&raquo;</a>
		</div>
		<%
			}
		%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>