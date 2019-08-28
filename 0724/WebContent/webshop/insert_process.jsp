<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Database SQL</title>
</head>
<body>
<p><input type="button" value="확인" onclick="location.href='select.jsp'"/>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	PreparedStatement pstmt = null;
	
	try{
		String sql = "insert into member(id, passwd, name)values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		out.println("Member 테이블 삽입이 성공했습니다.");
		
		} catch (SQLException ex){
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException:" + ex.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			
		}
	
	
	
	
/*	try{
		String sql = "INSERT INTO Member(id, passwd, name)VALUES('"+id+"','"+passwd+"','"+name+"')";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		out.println("Member 테이블 삽입이 성공했습니다.");
		} catch (SQLException ex){
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException:" + ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}		*/
%>
</body>
</html>