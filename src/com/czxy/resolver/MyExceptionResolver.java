package com.czxy.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.czxy.exception.UserException;
/**
 * 异常处理解析器
 * @author liangtong
 *
 */
@Component
public class MyExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception ex) {
		
		ex.printStackTrace();
		
		ModelAndView mav = new ModelAndView();
		
		//判断异常类型是否为UserException
		if(ex instanceof UserException){
			//设置数据
			mav.addObject("msg", "用户异常信息，异常如下：" + ex.getMessage());
		}else{
			mav.addObject("msg", "异常信息，异常如下：" + ex.getMessage());
		}
		
		
		mav.setViewName("/error.jsp");
		return mav;
	}

}
