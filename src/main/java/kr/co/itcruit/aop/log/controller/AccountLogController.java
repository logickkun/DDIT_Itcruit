package kr.co.itcruit.aop.log.controller;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import kr.co.itcruit.aop.log.service.ILoggingService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class AccountLogController {

	private ILoggingService loggingService;
	
	//계정관련 로그
	//기업회원 일반회원의 
	//로그인, 회원가입, 회원정보 찾기에 대한 로그
	//시간, 소스ip, 가용 메서드, 파라메터, 리턴값
	
	@Around("execution(* kr.co.cruit.account.service.IBoardService.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();
		log.info("[@Around] : " + Arrays.toString(pjp.getArgs()));
		
		Object result = pjp.proceed();
		
		long endTime =  System.currentTimeMillis();
		log.info("[@Around] : " + Arrays.toString(pjp.getArgs()));
		
		//직후 시간 - 직전시간 : 메소드 실행시간
		log.info("[@Around] timeLog: " + pjp.getSignature());
		log.info("[@Around] 메소드 실행시간: " + (endTime - startTime));
		return result;
	}
	
	
	
}
