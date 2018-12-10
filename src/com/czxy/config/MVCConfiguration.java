package com.czxy.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@ComponentScan(basePackages={"com.czxy.web.controller","com.czxy.resolver","com.czxy.interceptor"})
@EnableWebMvc//2 启用mvc配置（启用默认值）
public class MVCConfiguration extends WebMvcConfigurerAdapter{//1 继承类（所有的默认配置）

	@Bean
	public CommonsMultipartResolver multipartResolver(){
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(52428800L);
		multipartResolver.setMaxInMemorySize(4096);
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
//	@Resource
//	private HandlerInterceptor interceptor;
//	
//	/**
//	 * 拦截器注册方法
//	 */
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(interceptor);
//		
//	}
}
