package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class BasicFilter implements Filter{

	FilterConfig config;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("BasicFilter -> destroy() 호출됨.");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String filterInitParam = config.getInitParameter("FILTER_INIT_PARAM");
		System.out.println("BasicFilter -> 초기화 매개변수 : "+filterInitParam);
		
		String mode = ((HttpServletRequest)request).getMethod();
		System.out.println("BasicFilter -> 전송방식 : "+ mode);
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		config = filterConfig;
		String filterName = config.getFilterName();
		
		System.out.println("BasicFilter -> init() 호출됨. : "+ filterName);
	}

	
}
