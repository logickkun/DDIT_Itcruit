package kr.co.itcruit.mypage.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.mypage.admin.service.IAdminService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.BoardVO;

@Controller
@RequestMapping("/myPage/admin")
public class AdminInsertController {
	
	static String bbsCtgryCmmncd = "BBS103";

	@Inject
	private IAdminService adminService;
	
	@Inject
	private IFreeBoardService freeBoardService;
	
	@RequestMapping(value = "/faqInsertForm", method = RequestMethod.GET)
	public String faqInsertForm() {
		return "admin/fqpForm";
	}
	
	@RequestMapping(value = "/faqInsert.do", method = RequestMethod.POST)
	public String faqInsert(BoardVO boardVO, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(boardVO.getBbsTtl())){
			errors.put("bbsTtl", "제목을 입력해주세요");
		}
		if(StringUtils.isBlank(boardVO.getBbsCn())){
			errors.put("bbsCn", "내용을 입력해주세요");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("boardVO", boardVO);
			goPage = "admin/faq";
		}else {
			
			AccountVO accountVO = new AccountVO();
			
			if(accountVO != null) {
				boardVO.setBbsWriter("관리자");
				boardVO.setBbsCtgryCmmncd("BBS103");
				ServiceResult result = adminService.faqInsert(boardVO);
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "FAQ 등록이 성공했습니다");
					goPage = "redirect:/myPage/admin/faq.do";
				}else {
					model.addAttribute("message", "서버에러 , 다시 시도해주세요");
					goPage = "redirect:/myPage/admin/faq.do";
				}
			}
		}
		return goPage;
	}
	
	@RequestMapping(value = "/noticeInsertForm", method = RequestMethod.GET)
	public String noticeInsertForm() {
		return "admin/noticeForm";
	}
	
	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(
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
			goPage = "admin/noticeForm";
		}else {
//			HttpSession session = req.getSession();
//			AccountVO accountVO = (AccountVO) session.getAttribute("");
			
			AccountVO accountVO = new AccountVO();
			
			if(accountVO != null) {
				boardVO.setBbsWriter("관리자");	//임시 데이터
				boardVO.setBbsCtgryCmmncd("BBS102");
				ServiceResult result = freeBoardService.insert(req, boardVO);
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!");
					goPage = "redirect:/myPage/admin/noticeDetail.do?bbsNo=" + boardVO.getBbsNo();
				}else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요");
					goPage = "admin/noticeForm";
				}
			}
		}
		return goPage;
	}
}
