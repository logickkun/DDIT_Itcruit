package kr.co.itcruit.mypage.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.mypage.admin.service.IAdminService;
import kr.co.itcruit.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/myPage/admin")
@Slf4j
public class AdminDetailController {
	
	static String bbsCtgryCmmncd = "BBS103";
	static String bbsCtgryCmmncdNotice = "BBS102";
	
	
	@Inject
	private IFreeBoardService freeBoardService;
	
	@RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(String bbsNo, ModelMap model) {
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		
		BoardVO boardVO = freeBoardService.detail(bvo);
		model.addAttribute("boardVO", boardVO);
	
		return "admin/noticeDetail";
	}

}
