package kr.co.itcruit.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/freeBoard")
@Slf4j
public class ReportController {

	static String bbsCtgryCmmncd = "BBS101";
	
	@Inject
	private IFreeBoardService freeBoardService;
	
	@RequestMapping(value = "/reportInsert.do", method = RequestMethod.POST)
	public String reportInsert(
			@RequestParam String bbsNo,
			@RequestParam String bbsWriter,
			RedirectAttributes ra,
			BoardReportVO boardReportVO, Model model) {
		String goPage = "";
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String accountId = user.getAccount().getAccountId();
		
		boardReportVO.setBbsReportId(accountId);   //임시
		boardReportVO.setWriteId(bbsWriter);
		ServiceResult result = freeBoardService.insertReport(boardReportVO);
		if(result.equals(ServiceResult.OK)) {
			model.addAttribute("boardReportVO", boardReportVO);
//			ra.addFlashAttribute("message", "신고되었습니다");
			goPage = "redirect:/freeBoard/detail.do?bbsNo=" + bbsNo;
		}else {
//			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요");
			goPage = "redirect:/freeBoard/detail.do?bbsNo=" + bbsNo;
		}
		return goPage;
	}
	
	@RequestMapping(value = "/reportCommentInsert.do", method = RequestMethod.POST)
	public String reportCommentInsert(
			@RequestParam int bssCmntNo,
			@RequestParam String bbsNo,
			@RequestParam String bbsWriter,
			RedirectAttributes ra,
			BoardReportVO boardReportVO, Model model) {
		String goPage = "";
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String accountId = user.getAccount().getAccountId();
		
		boardReportVO.setBbsReportId(accountId);   //임시
		boardReportVO.setBbsNo(bbsNo);
		boardReportVO.setWriteId(bbsWriter);
		boardReportVO.setCmmtNo(bssCmntNo);
		ServiceResult result = freeBoardService.insertReport(boardReportVO);
		if(result.equals(ServiceResult.OK)) {
			model.addAttribute("boardReportVO", boardReportVO);
//			ra.addFlashAttribute("message", "신고되었습니다");
			goPage = "redirect:/freeBoard/detail.do?bbsNo=" + bbsNo;
		}else {
//			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요");
			goPage = "redirect:/freeBoard/detail.do?bbsNo=" + bbsNo;
		}
		return goPage;
	}
	
}
















