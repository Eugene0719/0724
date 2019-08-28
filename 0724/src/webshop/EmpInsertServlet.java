package webshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Empinsert")
public class EmpInsertServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			req.setCharacterEncoding("UTF-8");
			String empno=req.getParameter("empno");
			String ename=req.getParameter("ename");
			String job=req.getParameter("job");
			String sal=req.getParameter("sal");
			String deptno=req.getParameter("deptno");
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			
			out.print("<html><body>");
			String driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/haksa?useUnicode=true&amp;characterEncoding=UTF-8";
			String user="root";
			String password="1111";
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			
			try {
				Class.forName(driver);
				conn=DriverManager.getConnection(url, user, password);
			
				String sql="INSERT INTO emp01 VALUES(?, ?, ?, ?, ?)";  
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(empno)); //인덱스 번호 DB에 직접 값입력
				pstmt.setString(2, ename);
				pstmt.setString(3, job);
				pstmt.setInt(4, Integer.parseInt(sal));
				pstmt.setInt(5, Integer.parseInt(deptno));
				
				int num=pstmt.executeUpdate();
				if(num==1) {
					out.print("emp01 테이블 입력 성공");
				}else {
					out.print("emp01 테이블 입력 실패");
				}
				
				if(pstmt!=null) {
					pstmt.close();
				}
				
				if(conn!=null) {
					conn.close();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.print("</body></html>");
		}
	}
	

