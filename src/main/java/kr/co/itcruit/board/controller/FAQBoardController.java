package kr.co.itcruit.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MidPaginationVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/faq")
@Controller
@Slf4j
public class FAQBoardController {
	
	static String bbsCtgryCmmncd = "BBS103";
	
	@Inject
	private IFreeBoardService freeBoardService;
	
//	@RequestMapping(value = "/form", method = RequestMethod.GET)
//	public String faqBoardForm() {
//		return "board/notice/faqBoard";
//	}

	@RequestMapping(value = "/faq.do")
	public ModelAndView faqManagmentList(	
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO board = new BoardVO();
		board.setBbsCtgryCmmncd(bbsCtgryCmmncd);
		
		log.info("@######" + board.getBbsCtgryCmmncd());
		
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
		
		List<BoardVO> dataList = freeBoardService.selectFreeBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		
		log.info("@#########" + dataList);
		
		mav.addObject("pagingVO", pagingVO);
		mav.setViewName("board/notice/faqBoard");
		return mav;
	}
}
