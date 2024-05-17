package kr.co.itcruit.aop.log.controller;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import kr.co.itcruit.aop.log.service.ILoggingService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class RecruitProcessLogController {

	private ILoggingService loggingService;
	//채용프로세스 관리로그가 이 곳에서 관리됨
	//각 프로세스 단계별 지원자 관리에 대한 로그가 이곳에서 관리될 것
}
