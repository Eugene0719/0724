<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>배송 정보</title>
</head>
<script type="text/javascript">
	function checkOrder(){
		
		var form = document.Order;
		
		if(form.name.value == ""){
			alert("이름을 입력해주세요.");
			form.name.focus();
			return false;
		}else if (form.shippingDate.value == ""){
			alert("원하는 배송도착날짜를 입력해주세요.")
			form.shippingDate.focus();
			return false;
		}else if (form.country.value == ""){
			alert("국가를 입력해주세요.")
			form.country.focus();
			return false;
		}else if (form.zipCode.value == ""){
			alert("우편번호를 입력해주세요.")
			form.zipCode.focus();
			return false;
		}else if(form.addressName.value == ""){
			alert("주소를 입력해주세요.")
			form.addressName.focus();
			return false;
		}
			
			
		form.submit();
	}

</script>

<body>	
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="webshop.dto.message">
	<jsp:include page="header.jsp"/>
	<div class="jumbotron">
		<div class="container">
		<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			<h1 class="display-3"><fmt:message key="ShippingInfo"/></h1>
		</div>
	</div>
	<div class="container">
		<form action="./processShippingInfo.jsp" name="Order" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>" />
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="shippingDate"/></label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="country"/></label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="zipCode"/></label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="addressName"/></label>
				<div class="col-sm-3">
					<input name="addressName" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary" role="button"><fmt:message key="before"/></a>
					<input type="button" class="btn btn-primary" onclick="checkOrder()" value="<fmt:message key="submit"/>" />
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"><fmt:message key="cancle"/></a>
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>