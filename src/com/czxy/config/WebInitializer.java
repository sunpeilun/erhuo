package com.czxy.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * web启动类，tomcat启动时执行的类。
 * @author liangtong
 *
 */
public class WebInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		//1 创建spring容器，加载【配置类】
		// 1.1 创建
		AnnotationConfigWebApplicationContext application = new AnnotationConfigWebApplicationContext();
		// 1.2 注册
		// * 注册mvc配置类
		application.register(MVCConfiguration.class);
		// * 注册spring配置类
		application.register(SpringConfiguration.class);
		// * 注册mybatis配置类
		application.register(MyBatisConfiguration.class);
		FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter("UTF-8"));
		/** addMappingForUrlPatterns 配置过滤器拦截路径
		 *  参数1：确定servlet在什么位置拦截。默认请求前拦截。 等效于xml <dispatcher>REQUEST</dispatcher> 配置
		 *  参数2：确定当前过滤器拦截时机，
		 *  	true：其他拦截后面，1,2 --> 1,2,3
		 *  	false：其他拦截前面，1,2 --> 3,1,2
		 *  参数3：拦截路径
		 *  	/*  拦截所有路径
		 *  常见使用格式：
		 *  	addMappingForUrlPatterns(null , true, "/*")
		 *  其他格式：
		 *  	addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*")
		 */
		encodingFilter.addMappingForUrlPatterns(null, true, "/*");
		//2 配置servlet，将spring容器和核心控制器DispatcherServlet结合起来。
		// 2.1 添加了一个servlet ，且和spring容器关联
		ServletRegistration.Dynamic springMvcServlet = servletContext.addServlet("springmvc", new DispatcherServlet(application) );
		// 2.2 添加映射路径
		springMvcServlet.addMapping("*.apx");
		springMvcServlet.addMapping("*.image");
		springMvcServlet.addMapping("*.admin");
		
		springMvcServlet.setLoadOnStartup(2);
	}

}
