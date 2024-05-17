package kr.co.itcruit.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;

@RequestMapping("/inquiry")
@Controller
public class InquiryBoardController {
	
	static String bbsCtgryCmmncd = "BBS104";
	
	@Inject
	private IFreeBoardService freeBoardService;
	
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String faqBoardForm() {
		return "board/notice/inquiryBoard";
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String freeBoardInsert(
			HttpServletRequest req,
			BoardVO boardVO,
			Model model,
			RedirectAttributes ra) {
		String goPage = "";
		
		Map<String , String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(boardVO.getBbsTtl())) {
			errors.put("bbsTtl", "제목을 입력해주세요");
		}
		if(StringUtils.isBlank(boardVO.getBbsCn())) {
			errors.put("bbsCn", "내용을 입력해주세요");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("boardVO", boardVO);
			goPage = "redirect:/inquiry/form";
		}else {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();
			
			if(accountId != null) {
				boardVO.setBbsWriter(accountId);
				boardVO.setBbsCtgryCmmncd(bbsCtgryCmmncd);
				ServiceResult result = freeBoardService.insert(req, boardVO);
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "문의 등록이 성공했습니다!");
					goPage = "redirect:/inquiry/form";
				}else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요");
					goPage = "redirect:/inquiry/form";
				}
			}
		}
		return goPage;

	}

}