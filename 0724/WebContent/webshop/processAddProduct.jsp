<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="webshop.dto.Product" %>                                                                                                                                                                                                                                                                                                                                                                                            
    <%@ page import="webshop.dao.ProductRepository" %>
    <%@ page import="com.oreilly.servlet.*" %>
    <%@ page import="com.oreilly.servlet.multipart.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="dbconn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
	
		String filename = "";
		String realFolder = "C:\\eclipse_ee\\eclipse-workspace\\0724\\WebContent\\upload";
		int maxSize = 5 * 1024 * 1024;
		String encType = "EUC-KR";
		
		ProductRepository dao=ProductRepository.getInstance();
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		Integer price;
		
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			price = Integer.valueOf(unitPrice);
		}
		
		long stock;
		
		if(unitsInStock.isEmpty()){
			stock = 0;
		}else{
			stock = Long.valueOf(unitsInStock);
		}
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		pstmt.setString(2,name);
		pstmt.setInt(3, price);
		pstmt.setString(4,description);
		pstmt.setString(5,category);
		pstmt.setString(6,manufacturer);
		pstmt.setLong(7,stock);
		pstmt.setString(8,condition);
		pstmt.setString(9,fileName);
		pstmt.executeUpdate();
		
		
		if(pstmt !=null)
			pstmt.close();
		if(conn !=null)
			conn.close();
		
		
		Product newProduct=new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);
		newProduct.setFilename(filename);
		
		
		dao.addProduct(newProduct);
		
		response.sendRedirect("products.jsp");
		%>
</body>
</html>
		
		
		
		
		
		<%--ProductRepository dao = ProductRepository.getInstance();
		
		Product newProduct = new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);
		newProduct.setFilename(fileName);
		
		dao.addProduct(newProduct); --%>
		
		