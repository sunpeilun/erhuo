package com.czxy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.czxy.domain.MsgVo;
import com.czxy.domain.User;
import com.czxy.service.UserService;
import com.czxy.service.Impl.UserServiceImpl;
import com.czxy.utils.MyJsonUtils;

/**
 * Servlet Filter implementation class loginFilter
 */
public class loginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public loginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		String path = request.getServletPath();
		
		if(path.startsWith("/css")
				||path.startsWith("/images")
				||path.startsWith("/js")
				||path.startsWith("/service")
				||path.startsWith("/upload")
				||path.equals("/index.jsp")
				||path.endsWith("/register.jsp")
				||path.endsWith("/register.apx")
				||path.endsWith("/login.apx")
				||path.endsWith("/validateCode.apx")
				||path.endsWith("/login.jsp")){
			chain.doFilter(request, response);
			return;
		}
		if(path.contains("publish.jsp")){
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		
		//获得登录session
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser != null){
			//已经登录放行
			chain.doFilter(request, response);
			return;
		}
		//还未登陆
		if(!path.equals("/good/publish.apx")&&!path.startsWith("/user")){
			chain.doFilter(request, response);
			return;
		}else{
			
			if(path.equals("/user/login.apx")||path.equals("/user/isUserPicture.apx")){
				chain.doFilter(request, response);
				return;
			}
			
			//跳转登录页面
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		//chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
