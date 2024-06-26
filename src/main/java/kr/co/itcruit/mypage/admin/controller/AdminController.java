package kr.co.itcruit.mypage.admin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.atch.service.IAtchFileService;
import kr.co.itcruit.board.comment.service.IBoardCommentService;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.mypage.admin.service.IAdminService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EntSttsPaginationVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MidPaginationVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/myPage/admin")
@Slf4j
public class AdminController {

	static String bbsCtgryCmmncdFreeBoard = "BBS101";	//자유
	static String bbsCtgryCmmncd = "BBS103";	//faq
	static String bbsCtgryCmmncdNotice = "BBS102";	//공지
	static String bbsCtgryCmmncdinquiry = "BBS104";	// 문의
	
	@Inject
	private IAdminService adminService;
	
	@Inject
	private IFreeBoardService freeBoardService;
	

	@Inject
	private IBoardCommentService boardCommentService;
	

	@Inject
	private IAtchFileService atchFileService;
	
//	@PreAuthorize("hasAnyRole('ROLE_AUTH101')")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(AccountVO accountVO,EnterpriseVO enterpriseVO, Model model) {
		int aVO = adminService.accountNum(accountVO);
		model.addAttribute("aVO", aVO);
		
		int eVO = adminService.entNum(enterpriseVO);
		model.addAttribute("eVO", eVO);
		
		int monthNum  = adminService.monthNum(accountVO);
		model.addAttribute("monthNum", monthNum);
		
		return "admin/home";
	}
	
	@RequestMapping(value = "/mainChart")
	public ResponseEntity<List<RecruitVO>> mainChart( Model model){
		
		
		RecruitVO recruitVO = new RecruitVO();
		
		List<RecruitVO> recruitList = adminService.mainChart(recruitVO);
		model.addAttribute("recruitList", recruitList);
		
		log.info("$$$" + recruitList);
		
		 return new ResponseEntity<>(recruitList, HttpStatus.OK);
	}
	
	
	

	@RequestMapping(value = "/entManagment", method = RequestMethod.GET)
	public String entManagment() {
		return "admin/entManagement";
	}
	
	@RequestMapping(value = "/memberManagment", method = RequestMethod.GET)
	public String memberManagment() {
		return "admin/memberManagement";
	}
	
	@RequestMapping(value = "/freeBoard.do", method = RequestMethod.GET)
	public ModelAndView freeBoardManagment(
	        @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
	        @RequestParam(name = "commentPage", required = false, defaultValue = "1") int currentCommentPage,
	        HttpServletRequest req) {
	    
	    ModelAndView mav = new ModelAndView();
	    
	    MidPaginationVO<BoardReportVO> boardPagingVO = new MidPaginationVO<BoardReportVO>();
	    MidPaginationVO<BoardReportVO> commentPagingVO = new MidPaginationVO<BoardReportVO>();
	    
	    // 게시글 신고 페이징 정보 설정
	    boardPagingVO.setCurrentPage(currentPage);
	    boardPagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncdFreeBoard);
	    int totalBoardRecord = freeBoardService.selectFreeBoardReportCount(boardPagingVO);
	    boardPagingVO.setTotalRecord(totalBoardRecord);
	    List<BoardReportVO> boardDataList = freeBoardService.adminfreeBoardReport(boardPagingVO);
	    boardPagingVO.setDataList(boardDataList);
	    mav.addObject("boardPagingVO", boardPagingVO);
	    
	    // 댓글 신고  페이징 정보 설정
	    commentPagingVO.setCurrentPage(currentCommentPage);
	    commentPagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncdFreeBoard);
	    int totalCommentRecord = freeBoardService.selectFreeBoardCommentReportCount(commentPagingVO);
	    commentPagingVO.setTotalRecord(totalCommentRecord);
	    List<BoardReportVO> commentDataList = freeBoardService.adminfreeBoardCommentReport(commentPagingVO);
	    commentPagingVO.setDataList(commentDataList);
	    mav.addObject("commentPagingVO", commentPagingVO);
	    
	    mav.setViewName("admin/freeBoard");
	    mav.addObject("show1", "show");
	    log.info("1111111111111>>>>>>>>Board>>>" + boardPagingVO );
	    log.info("1111111111111>>>>>>>>Comment>>>" + commentPagingVO );
	    log.info("@>>>>Comment>>>" + commentDataList );
	    return mav;
	}

	

	
	@RequestMapping(value = "/faq.do", method = RequestMethod.GET)
	public ModelAndView faqManagmentList(	
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO board = new BoardVO();
		board.setBbsCtgryCmmncd(bbsCtgryCmmncd);
		
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
		
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncd);
		
		List<BoardVO> dataList = freeBoardService.selectFreeBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		log.info("@@@@@#############>>>" + pagingVO);
		log.info("@@@@@#########$%%%%#####>>>" + dataList);
		
		mav.addObject("pagingVO", pagingVO);
		mav.setViewName("admin/faq");
		mav.addObject("show1", "show");
		return mav;
	}
	
	@RequestMapping(value = "/noticeList.do")
	public ModelAndView noticeManagmentList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO board = new BoardVO();
		board.setBbsCtgryCmmncd(bbsCtgryCmmncdNotice);
		
		MidPaginationVO<BoardVO> pagingVO = new MidPaginationVO<BoardVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			mav.addObject("searchType", searchType);
			mav.addObject("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncdNotice);
		int totalRecord = freeBoardService.selectFreeBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncdNotice);
		
		List<BoardVO> dataList = freeBoardService.selectFreeBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		
		log.info("@####444#####" + dataList);
		log.info("@####444#####" + pagingVO);
		
		mav.addObject("pagingVO", pagingVO);
		mav.setViewName("admin/notice");
		mav.addObject("show1", "show");
		return mav;
	}
	
	@RequestMapping(value = "/inquiryList.do", method = RequestMethod.GET)
	public ModelAndView inquiryManagmentList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO board = new BoardVO();
		board.setBbsCtgryCmmncd(bbsCtgryCmmncdinquiry);
		
		MidPaginationVO<BoardVO> pagingVO = new MidPaginationVO<BoardVO>();
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncdinquiry);
		int totalRecord = freeBoardService.selectFreeBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		pagingVO.setBbsCtgryCmmncd(bbsCtgryCmmncdinquiry);
		
		List<BoardVO> dataList = freeBoardService.selectFreeBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		log.info("@####444#####" + dataList);
		log.info("@####444#####" + pagingVO);
		
		mav.addObject("pagingVO", pagingVO);
		mav.setViewName("admin/inquiry");
		mav.addObject("show1", "show");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inquiryDetail", method = RequestMethod.GET)
	public Map<String, Object> inquiryAnswerDetail(@RequestParam String bbsNo) {
	    Map<String, Object> response = new HashMap<>();
	    
	    // 여기서 적절한 서비스 호출 등을 통해 데이터를 가져옴
	    BoardVO boardVO = freeBoardService.detail(new BoardVO(bbsNo, bbsCtgryCmmncd));
	    
	    // 가져온 데이터를 response에 추가
	    response.put("bbsTtl", boardVO.getBbsTtl()); // 예시로 게시글 제목 추가
	    response.put("bbsCn", boardVO.getBbsCn()); // 예시로 게시글 내용 추가
	    response.put("bssCmntCn", boardVO.getBssCmntCn());
	    response.put("bbsAtchFileList", boardVO.getAtchFileList());
	    // 필요한 다른 데이터도 추가할 수 있음
	    log.info("inquiryAnswerDetail>>>>>>>>>>>>>>>>>\n" + boardVO.getAtchFileList() );
	    
	    return response;
	}

	
	@RequestMapping(value = "/inquiryAnswerInsert", method = RequestMethod.POST)
	public String inquiryAnswerInsert(
			@RequestParam String bbsNo,
			BoardCommentVO boardCommentVO) {
		
		log.info(")))))>>>>>>>>>>>"+bbsNo);
		boardCommentVO.setBbsNo(bbsNo);
		boardCommentVO.setBssCmntWriter("관리자");
		boardCommentService.insertComment(boardCommentVO);
//		log.info("34343434214234" + boardCommentVO);
		
		BoardVO boardVO = new BoardVO();
		boardCommentService.inquiryAnswerUpdate(boardVO, boardCommentVO);
		
		return "redirect:/myPage/admin/inquiryList.do";
	}
	
	@RequestMapping(value="/signin.do")
	public String adminSignin(HttpSession session, AccountVO accountVO, 
			Model model, RedirectAttributes ra){
		
		String goPage = "";
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("관리자user {} ", user);
		AccountVO account = user.getAccount();
		log.info("관리자account {} ", account);
		
		if(account != null) {
			String auth = account.getAuthCmmncd();
			if(auth.equals("AUTH101")) {
				log.info("성공");
				session.setAttribute("SessionInfo", account);
				goPage = "redirect:/myPage/admin/index";
			}else {
				model.addAttribute("message", "관리자 로그인창입니다.");
				goPage = "conn/loginForm";
			}
		}else {
			log.info("실패");
			model.addAttribute("message", "로그인 실패, 재입력");
			model.addAttribute("account", account);
			goPage = "conn/adminLoginForm";
		}
		
		return goPage;
				
	}

	
	/*
	 영상 	
	 */
	@RequestMapping(value = "/accountManagement.do")
	public String accountManagment(Model model,
			@RequestParam(name = "reportListPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "entSttsListPage", required = false, defaultValue = "1") int currentPage1
			) {

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>어드민");
		
		EntSttsPaginationVO<AtchVO> atchPagingVO = new EntSttsPaginationVO<AtchVO>();
		
		atchPagingVO.setCurrentPage(currentPage1);
		
		int entSttsCount = adminService.entSttsCount();

		atchPagingVO.setTotalRecord(entSttsCount);
		
		List<AtchVO> entSttsList = adminService.entSttsList(atchPagingVO);
		
		atchPagingVO.setDataList(entSttsList);
		
		model.addAttribute("atchPagingVO", atchPagingVO);
		
		
		
		RecruitPaginationVO<BoardReportVO> reportPagingVO = new RecruitPaginationVO<BoardReportVO>();
		
		reportPagingVO.setCurrentPage(currentPage);
		
		int reportCount = adminService.reportCount();
		
		reportPagingVO.setTotalRecord(reportCount);
		
		List<BoardReportVO> reportList = adminService.reportList(reportPagingVO);
		
		reportPagingVO.setDataList(reportList);
		
		model.addAttribute("reportPagingVO", reportPagingVO);
		
		
		
		return "admin/accountManagement";
	}

	
	@ResponseBody
	@RequestMapping(value = "/entApproval.do" , method = RequestMethod.POST)
	public ResponseEntity<String> entApproval(@RequestBody AccountVO av){
		
		ServiceResult result = adminService.entApproval(av);
		
		log.info(">>>>>>>>>>>>>>>>"+ av.getAccountId());
		
		String status = null;

		if (result.equals(ServiceResult.OK)) {
			status = "SUCCESS";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} else {
			status = "FAILED";
			return new ResponseEntity<String>(status, HttpStatus.FAILED_DEPENDENCY);
		}
		
	}
	 
	
	
	@ResponseBody
	@RequestMapping(value = "/handlingYn.do" , method = RequestMethod.POST)
	public ResponseEntity<String> handlingYn(@RequestBody BoardReportVO brVO){
		
		ServiceResult result = adminService.handlingYn(brVO);
		
		String status = null;
		
		if (result.equals(ServiceResult.OK)) {
			status = "SUCCESS";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} else {
			status = "FAILED";
			return new ResponseEntity<String>(status, HttpStatus.FAILED_DEPENDENCY);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/stopAccount.do" , method = RequestMethod.POST)
	public ResponseEntity<String> stopAccount(@RequestBody AccountVO av){
		
		ServiceResult result = adminService.stopAccount(av);
		
		String status = null;
		
		if (result.equals(ServiceResult.OK)) {
			status = "SUCCESS";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} else {
			status = "FAILED";
			return new ResponseEntity<String>(status, HttpStatus.FAILED_DEPENDENCY);
		}
		
	}
	
	@RequestMapping(value = "/getEntImage.do" , method = RequestMethod.GET)
	public ResponseEntity<byte[]> entSttsImg(@RequestParam("entNo") String entNo){
	
		log.info("여기는 이미지  뿌리는곳 <<<<<<<<<<<<<<<<<<" + entNo);
		
		String orgnCmmncd = "사업자등록증";
		
		AtchFileVO afv = atchFileService.getFileInfo(entNo, orgnCmmncd);
		
		String filePath = afv.getFilePath();
		
		log.info(filePath);
		
		File file = new File(filePath);
		
		byte[] imegeByte = null;
		try {
			imegeByte = Files.readAllBytes(file.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<byte[]>(imegeByte, HttpStatus.OK);
		
		
		
	}
	
	
	
//	/myPage/admin/recurit.do
	@RequestMapping(value="/recurit.do")
	public String adminRecruitManage(
			Model model
			) {
		return "admin/recruitList";
	}
	
	@RequestMapping(value = "/entInfoManagement")
	public String entInfoManagement(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		log.info("searchWord = ", searchWord);
		log.info("searchType = ", searchType);
		
		PaginationInfoVO<EnterpriseVO> pagingVO = new PaginationInfoVO<EnterpriseVO>();
		
		// 검색 기능 추가시 활용
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			// 검색 후, 목록 페이지로 이동 할 때 검색된 내용을 적용시키기 위한 데이터 전달
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		// 현재 페이지 전달 후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);
		int totalRecord =  adminService.selectEntCount(pagingVO);	// 총  수 가져오기
		pagingVO.setTotalRecord(totalRecord); // 총 수 전달 후, 총 페이지 설정
		
		List<EnterpriseVO> dataList = adminService.selectEntList(pagingVO);
		pagingVO.setDataList(dataList); // 받아온 목록 데이터 설정
		
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "admin/entInfoManagement";
	}
	
	@RequestMapping(value = "/analytics.do", method = RequestMethod.GET)
	public String analytics() {
		return "admin/analytics";
	}
	
	@RequestMapping(value = "/pieChart")
	public ResponseEntity<List<RecruitVO>> pieChart(Model model){

		RecruitVO recruitVO = new RecruitVO();

		List<RecruitVO> recruitList = adminService.pieChart(recruitVO);
		model.addAttribute("recruitList", recruitList);
//		log.info("%%%%" + recruitList);
		return new ResponseEntity<>(recruitList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/horizontalChart")
	public ResponseEntity<List<RecruitVO>> horizontalChart(Model model){

		RecruitVO recruitVO = new RecruitVO();

		List<RecruitVO> recruitList = adminService.horizontalChartChart(recruitVO);
		model.addAttribute("recruitList", recruitList);
//		log.info("%%%^^^%" + recruitList);
		return new ResponseEntity<>(recruitList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/lineChart")
	public ResponseEntity<List<RecruitVO>> lineChart(Model model){

		RecruitVO recruitVO = new RecruitVO();

		List<RecruitVO> recruitList = adminService.mainChart(recruitVO);
		model.addAttribute("recruitList", recruitList);
//		log.info("%%%%" + recruitList);
		return new ResponseEntity<>(recruitList, HttpStatus.OK);
	}
}


