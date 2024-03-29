<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
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
		
		ArrayList<Product> goodsList = dao.getAllProducts();
		Product goods = new Product();
		for (int i = 0; i < goodsList.size(); i++){
			goods = goodsList.get(i);
			if(goods.getProductId().equals(id)){
				break;
			}
		}
		
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartlist", list);
		}
		
		int cnt = 0;
		Product goodsQnt = new Product();
		for(int i=0; i<list.size(); i++){
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() +1;
				goodsQnt.setQuantity(orderQuantity);
			}
		}
		
		if(cnt == 0){
			goods.setQuantity(1);
			list.add(goods);
		}
		
		response.sendRedirect("product.jsp?id=" +id);
	%>
</body>
</html>