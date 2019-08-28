<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file= "dbconn.jsp" %>
	<%
		request.setCharacterEncoding("EUC-KR");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		ResultSet rs=null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select id, passwd from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()){
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)){
					sql= "delete from member where id = ? and passwd = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, passwd);
					pstmt.executeUpdate();
					out.println("Member ���̺��� �����߽��ϴ�.");					
				}else
					out.println("��ġ�ϴ� ��й�ȣ�� �ƴմϴ�.");
			}else
				out.println("Member ���̺� ��ġ�ϴ� ���̵� �����ϴ�.");
		}catch (SQLException ex){
			out.println("SQLException : " +ex.getMessage());
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
				
		%>
</body>
</html>