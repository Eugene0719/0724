package webshop.filter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("webshop �ʱ�ȭ");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("������ Ŭ���̾�Ʈ IP : "+ request.getRemoteAddr());
		long start = System.currentTimeMillis();
		System.out.println("������  URL ��� : " +getURLPath(request));
		System.out.println("��û ó�� ���� �ð� : " +getCurrentTime());
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("��û ó�� ���� �ð� : "+getCurrentTime());
		System.out.println("��û ó�� �ҿ� �ð� : "+(end-start)+"ms");
		System.out.println("--------------------------------------------------");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	private String getURLPath(ServletRequest request) {
		// TODO Auto-generated method stub
		HttpServletRequest req;
		String currentPath="";
		String queryString="";
		if(request instanceof HttpServletRequest) {
			req=(HttpServletRequest)request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ?"" : "?" +queryString;
		}
		return currentPath+queryString;
	}
	
	private String getCurrentTime() {
		// TODO Auto-generated method stub
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
}
