package kr.co.itcruit.enterprise.evaluation.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import kr.co.itcruit.enterprise.evaluation.service.IEvaluationService;


@Controller
public class EvaluationController {

	//기업평가
	//전현직 평가와 면접후기가 여기서 구현됩니다
	@Inject
	private IEvaluationService evaluationService;
}
