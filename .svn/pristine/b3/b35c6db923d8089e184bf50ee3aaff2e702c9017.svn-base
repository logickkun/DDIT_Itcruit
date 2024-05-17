package kr.co.itcruit.mypage.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/myPage/admin")
@Slf4j
public class AdminModifyController {
	
	static String bbsCtgryCmmncdFreeBoard = "BBS101";
	static String bbsCtgryCmmncd = "BBS103";
	static String bbsCtgryCmmncdNotice = "BBS102";
	
	
	@Inject
	private IFreeBoardService freeBoardService;
	
	
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdateForm(String bbsNo, ModelMap model) {
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		BoardVO boardVO = freeBoardService.detail(bvo);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("status", "update");
		return "admin/noticeForm";
	}
	
	@RequestMapping(value = "/noticeUpdate.do", method = RequestMethod.POST)
	public String noticeUpdate(
			HttpServletRequest req,
			RedirectAttributes ra, 
			BoardVO boardVO, Model model) {
		String goPage = "";
		ServiceResult result = freeBoardService.update(req, boardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 수정이 완료되었습니다");
			goPage = "redirect:/myPage/admin/noticeDetail.do?bbsNo=" + boardVO.getBbsNo();
		}else {
			model.addAttribute("boardVO", boardVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "update");
			goPage = "admin/noticeForm";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete(
			HttpServletRequest req,
			RedirectAttributes ra,
			String bbsNo, Model model) {
		String goPage = "";
		
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);

		ServiceResult result = freeBoardService.delete(req, bvo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 삭제가 완료되었습니다");
			goPage = "redirect:/myPage/admin/noticeList.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/myPage/admin/noticeDetail.do?bbsNo=" + bbsNo;
		}
		return goPage;
	}

	
	@RequestMapping(value = "/faqDelete.do", method = RequestMethod.POST)
	public String faqDelete(BoardVO boardVO, String bbsNo, RedirectAttributes ra,HttpServletRequest req) {
		String goPage = "";
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		ServiceResult result = freeBoardService.delete(req, bvo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "삭제가 완료되었습니다");
			goPage = "redirect:/myPage/admin/faq.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/myPage/admin/faq.do";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.GET)
	public String faqUpdateForm(String bbsNo, ModelMap model) {
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		BoardVO boardVO = freeBoardService.detail(bvo);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("status", "update");
		
		log.info("$%%%%%%%%%%" + bvo);
		log.info("$%%%%%%%%%%" + boardVO);
		return "admin/fqpForm";
	}
	
	@RequestMapping(value = "/faqUpdate.do", method = RequestMethod.POST)
	public String boardCommentUpdate(BoardVO boardVO, RedirectAttributes ra, HttpServletRequest req, Model model) {
		String goPage = "";
		ServiceResult result = freeBoardService.update(req, boardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다");
			goPage = "redirect:/myPage/admin/faq.do";
		}else {
			goPage = "redirect:/myPage/admin/faq.do";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/freeBoardDelete.do", method = RequestMethod.POST)
	public String freeBoardDelete(BoardVO boardVO, BoardReportVO boardReportVO, String bbsNo, RedirectAttributes ra,HttpServletRequest req, Model model) {
		String goPage = "";
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		bvo.setBbsCtgryCmmncd(bbsCtgryCmmncdFreeBoard);
		ServiceResult result = freeBoardService.adminFreeBoarddelete(req, bvo, boardReportVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "삭제가 완료되었습니다");
			model.addAttribute("bvo", bvo);
			goPage = "redirect:/myPage/admin/freeBoard.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/myPage/admin/freeBoard.do";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/freeBoardCommentDelete.do", method = RequestMethod.POST)
	public String freeBoardCommetDelete(BoardReportVO boardReportVO, RedirectAttributes ra) {
		
		String goPage = "";
		ServiceResult result = freeBoardService.adminFreeBoardCommentDelete(boardReportVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "댓글 삭제가 완료되었습니다");
			goPage = "redirect:/myPage/admin/freeBoard.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/myPage/admin/freeBoard.do";
		}
		return goPage;
	}


}
