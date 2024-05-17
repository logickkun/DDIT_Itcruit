package kr.co.itcruit.board.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.ListPaginationVO;
import kr.co.itcruit.vo.MidPaginationVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/freeBoard")
@Slf4j
public class FreeBoardController {
	
	static String bbsCtgryCmmncd = "BBS101";
	
	@Inject
	private IFreeBoardService freeBoardService;
	
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String freeBoardListForm() {
		
		return "board/list";
	}
	
	@RequestMapping(value = "/list.do")
	public ModelAndView freeBoardList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> board = freeBoardService.bestList();
		
		log.info("$$$" + board);
		
//		freeBoardService.latelyList();
		
		MidPaginationVO<BoardVO> pagingVO = new MidPaginationVO<BoardVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			mav.addObject("searchType", searchType);
			mav.addObject("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncd);
		int totalRecord = freeBoardService.selectFreeBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
//		log.info("$$$$$$$$$$$$$$" + pagingVO.getBbsCtgryCmmncd());
		
		List<BoardVO> dataList = freeBoardService.selectFreeBoardList(pagingVO);
		
		pagingVO.setDataList(dataList);
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncd);
		

		log.info("%%%%%%%%%%%" + pagingVO);
		
		mav.addObject("pagingVO", pagingVO);
		mav.addObject("board", board);
		mav.setViewName("board/list");
		return mav;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String freeBoardInsertForm() {
		return "board/insert";
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
			goPage = "board/insert";
		}else {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();
			String accountNick = user.getAccount().getAccountNick();
			
			if(accountId != null) {
				boardVO.setBbsWriter(accountNick);
				boardVO.setBbsCtgryCmmncd(bbsCtgryCmmncd);
				ServiceResult result = freeBoardService.insert(req, boardVO);
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!");
					goPage = "redirect:/freeBoard/detail.do?bbsNo=" + boardVO.getBbsNo();
				}else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요");
					goPage = "board/insert";
				}
			}
		}
		return goPage;
	}
	
//	상세보기
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String freeBoardDetailForm(String bbsNo, BoardCommentVO boardCommentVO, ModelMap model) {
		
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		List<BoardCommentVO> bcvo = freeBoardService.commentList(boardCommentVO);
		
		List<BoardVO> board = freeBoardService.bestList();
		
		BoardVO boardVO = freeBoardService.detail(bvo);
		
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if(obj instanceof CustomUser) {
//			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			String accountId = user.getAccount().getAccountId();
//			boardVO.setAccountId(accountId);
//			log.info("ssss" + accountId);
//		}
		log.info("####$$$$" + boardVO.toString());
		model.addAttribute("bcvo", bcvo);
		model.addAttribute("board", board);
		model.addAttribute("boardVO", boardVO);

	
		return "board/detail";
	}
	
	// 수정 폼 불러오기
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String freeBoardUpdateForm(String bbsNo, ModelMap model) {
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		BoardVO boardVO = freeBoardService.detail(bvo);
//		log.info("###123" + bvo);
//		log.info("#########" + boardVO);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("status", "update");
		return "board/insert";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String freeBoardUpdate(
			HttpServletRequest req,
			RedirectAttributes ra, 
			BoardVO boardVO, Model model) {
		String goPage = "";
		ServiceResult result = freeBoardService.update(req, boardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 수정이 완료되었습니다");
			goPage = "redirect:/freeBoard/detail.do?bbsNo=" + boardVO.getBbsNo();
		}else {
			model.addAttribute("boardVO", boardVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "update");
			goPage = "board/insert";
		}
		return goPage;
	}
	
	// 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String freeBoardDelete(
			HttpServletRequest req,
			RedirectAttributes ra,
			String bbsNo,Model model) {
		String goPage = "";
		
		BoardVO bvo = new BoardVO(bbsNo, bbsCtgryCmmncd);
		bvo.setFileSrcNo(bbsNo);
		log.info("rrrr>>>>>>>>>>>>" + bvo);

		ServiceResult result = freeBoardService.delete(req, bvo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 삭제가 완료되었습니다");
			goPage = "redirect:/freeBoard/list.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/freeBoard/detail.do?bbsNo=" + bbsNo;
		}
		return goPage;
	}
	
	@RequestMapping(value="/download.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> fileDownload(int fileNo) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = null;
		AtchVO fileVO = freeBoardService.download(fileNo);
		if(fileVO != null) {
			fileName = fileVO.getFileName();
			try {
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				HttpHeaders headers = new HttpHeaders();
				in = new FileInputStream(fileVO.getFilePath());
				
//				if(mType != null) {
//					headers.setContentType(mType);
//				}else {
					fileName = fileName.substring(fileName.indexOf("_") + 1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\"" + 
							new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
//				}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			}finally {
				in.close();
			}
		}else {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}


























