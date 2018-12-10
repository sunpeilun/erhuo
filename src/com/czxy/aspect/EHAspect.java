package com.czxy.aspect;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class EHAspect {
	
	@Before("execution(* com.czxy.service..*.*(..))")
	public void bf(){
		
	}


	@AfterReturning("execution(* com.czxy.service..*.*(..))")
	public void af(){
		
	}

	
}
