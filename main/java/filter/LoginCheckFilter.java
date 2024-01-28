package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/* Filter 클래스를 구현하기 위해 filter 인터페이스를 implements 해준다.*/
public class LoginCheckFilter implements Filter {
	
	/* filter 객체를 초기화 해준다.*/
    @Override
    public void init(FilterConfig config) throws ServletException {
    	System.out.println("==================="+config.getServletContext());
    }

    /* 실제 filter 기능을 수행하는 메소드*/
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
    	
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        
        System.out.println("request"+request);
        System.out.println("response"+response);
        
        boolean login = false;
        if (session != null) {
            if (session.getAttribute("MEMBER") != null) {
                login = true;
            }
        }
        if (login) {
        	/* chain을 이용해서 다음 filter로 처리를 전달한다.*/
            chain.doFilter(request, response);
        } else {
            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/loginForm.jsp");
            dispatcher.forward(request, response);
        }
    }

    /* filter가 웹 컨테이너에 의해 삭제될 때 호출한다.*/
    @Override
    public void destroy() {
    }
}
