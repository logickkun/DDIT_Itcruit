package kr.co.itcruit.report.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcruit.report.service.IReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Inject
	private IReportService reportService;
	//adasdasd
	//게시글 댓글 등 각종 신고버튼 관리는 이곳에서 
}
