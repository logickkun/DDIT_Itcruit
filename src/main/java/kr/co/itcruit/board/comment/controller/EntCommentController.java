package kr.co.itcruit.board.comment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.comment.service.IBoardCommentService;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/ent")
@Slf4j
public class EntCommentController {

	static String bbsCtgryCmmncd = "BBS201";
	
	@Inject
	private IBoardCommentService boardCommentService;	
	
	
	@RequestMapping(value="/comment/insert.do", method = RequestMethod.POST)
	public String boardCommentInsert(
			@RequestParam String bbsNo, 
			@RequestParam int entNo,
			HttpServletResponse response,
			BoardCommentVO boardCommentVO, Model model) throws Exception {
		
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(boardCommentVO.getBssCmntCn())) {
			errors.put("bssCmntCn", "내용을 입력해주세요");
		}
			
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();
			String accountNick = user.getAccount().getAccountNick();
		
			boardCommentVO.setBssCmntWriter(accountNick);
			boardCommentService.insertComment(boardCommentVO);
			log.info("###" + bbsNo);
			log.info("###" + boardCommentVO);
			
		response.sendRedirect("/board/ent/detail.do?entNo=" + entNo + "&bbsNo=" + boardCommentVO.getBbsNo());
		return "board/ent/entBoardDetail";
	}
	
//	@RequestMapping(value = "/comment/list.do")
//	public String boardCommentList(
//			@RequestParam String bbsNo,
//			BoardCommentVO boardCommentVO, Model model) {
//		
//		log.info("afasf" + bbsNo);
//		log.info("afasf" + boardCommentVO);
//		
//		List<BoardCommentVO> commentList = boardCommentService.commentList(boardCommentVO);
//		model.addAttribute("commentList", commentList);
//		
//		log.info("########" + commentList);
//		
//		return "board/detail";
//	}
	
	@RequestMapping(value = "/comment/delete.do")
	public String boardCommentDelete(@RequestParam int entNo, BoardCommentVO boardCommentVO, RedirectAttributes ra, Model model) {
		
		String goPage = "";
		log.info("$$$$$$$$$$$$" + boardCommentVO);
		ServiceResult result = boardCommentService.deleteComment(boardCommentVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "댓글 삭제가 완료되었습니다");
			goPage = "redirect:/board/ent/detail.do?entNo=" + entNo + "&bbsNo=" + boardCommentVO.getBbsNo();
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/board/ent/detail.do?entNo=" + entNo + "&bbsNo=" + boardCommentVO.getBbsNo();
		}
		return goPage;
	}
	
	@RequestMapping(value = "/comment/update.do", method = RequestMethod.POST)
	public String boardCommentUpdate(@RequestParam int entNo, BoardCommentVO boardCommentVO, RedirectAttributes ra, Model model) {
		String goPage = "";
		ServiceResult result = boardCommentService.updateComment(boardCommentVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "댓글 수정이 완료되었습니다");
			goPage = "redirect:/board/ent/detail.do?entNo=" + entNo + "&bbsNo=" + boardCommentVO.getBbsNo();
		}else {
			model.addAttribute("boardVO", boardCommentVO);
			model.addAttribute("entNo", entNo);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "update");
			goPage = "board/ent/entBoardDetail";
		}
		return goPage;
	}
	
	
		
	
	
	
}
