<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="webshop.dto.Product" %>
<%@ page import="webshop.dao.ProductRepository" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		String id=request.getParameter("id");
		if (id==null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		ProductRepository dao = ProductRepository.getInstance();
		
		Product product = dao.getProductById(id);
		if(product == null){
			response.sendRedirect("exeptionNoProductId.jsp");
		}
		
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
		Product goodsQnt = new Product();
		for(int i=0; i<cartList.size(); i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cartList.remove(goodsQnt);
			}
		}
		
		response.sendRedirect("cart.jsp");
%>
</body>
</html>