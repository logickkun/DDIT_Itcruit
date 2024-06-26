package kr.co.itcruit.enterprise.info.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import javax.annotation.security.PermitAll;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.enterprise.info.service.IEnterpriseInfoService;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EntInterviewVO;
import kr.co.itcruit.vo.EntScoreVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.InterviewPaginationVO;
import kr.co.itcruit.vo.ListPaginationVO;
import kr.co.itcruit.vo.MiniPaginationVO;
import kr.co.itcruit.vo.RecruitListPaginationVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitStatsVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ReviewPaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ent")
public class EntRetrieveController {

	@Inject
	private IEnterpriseInfoService entService;

	/**
	 * 김영상 기업정보 목록 리스트
	 * 
	 * @param currentPage
	 * @param model
	 * @return
	 */
//	@Permit
	@RequestMapping(value = "/list.do")
	public String entList(@RequestParam(name = "entPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchCount, @RequestParam(required = false) String searchEnt,
			@RequestParam(required = false) String searchLoc, Model model, HttpSession session,
			Principal principal,
			HttpServletRequest req) {
		ListPaginationVO<EnterpriseVO> pagingVO = new ListPaginationVO<EnterpriseVO>();


		
//		//////// 로그인한 회원 아이디 담기
//		CustomUser user = null;
//		AccountVO accountVO = new AccountVO();
//		Authentication authenti = SecurityContextHolder.getContext().getAuthentication();
//		if(authenti.isAuthenticated()) {
//			user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		}
//		accountVO = user.getAccount();
//		if(accountVO != null) {
//			pagingVO.setAccountId(accountVO.getAccountId());
//		}else {
//		}
		
		
		if(principal != null) {
			pagingVO.setLoginId(principal.getName());
		}else {
			pagingVO.setLoginId("기본값");
		}
		
		if (StringUtils.isNotBlank(searchEnt) || StringUtils.isNotBlank(searchCount)
				|| StringUtils.isNotBlank(searchLoc)) {
			pagingVO.setSearchEnt(searchEnt);
			pagingVO.setSearchCount(searchCount);
			pagingVO.setSearchLoc(searchLoc);

			model.addAttribute("searchEnt", searchEnt);
			model.addAttribute("searchCount", searchCount);
			model.addAttribute("searchLoc", searchLoc);
		}

		log.info(searchLoc + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		
		// 현재 페이지 전달 후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);

		int totalRecord = entService.selectEntCount(pagingVO); // 총 기업 목록 수 가져오기

		//////// 로그 지우기
		log.info(totalRecord + "<<<<<<<<< 총 기업수");

		pagingVO.setTotalRecord(totalRecord); // 총 기업 목록 수 전달 후, 총 페이지 설정

		List<EnterpriseVO> dataList = entService.selectEntList(pagingVO);
		pagingVO.setDataList(dataList);

		model.addAttribute("pagingVO", pagingVO);

		return "ent/entList";
	}

	/**
	 * 관심등록 되있는 기업을 관심등록 삭제
	 * 
	 * @param entVO
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@ResponseBody
	@RequestMapping(value = "/likeEnt.do", method = RequestMethod.POST)
	public ResponseEntity<String> likeEnt(@RequestBody EnterpriseVO entVO, HttpServletRequest req) {

		// accountId와 entNo를 사용하여 로직을 처리

		//[스프링 시큐리티] 회원 ID를 스프링 시큐리티 UserDetails 정보에서 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String accountId = user.getAccount().getAccountId();

		entVO.setLoginId(accountId);


		
		log.info(accountId + "<<<<<<<<<<<<<<<<<<< 아이디");

		ServiceResult result = entService.likeEnt(entVO);

		String status = null;

		if (result.equals(ServiceResult.OK)) {
			status = "SUCCESS";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} else {
			status = "FAILED";
			return new ResponseEntity<String>(status, HttpStatus.FAILED_DEPENDENCY);
		}

	}

	/**
	 * 관심 기업 등록
	 * 
	 * @param entVO
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@ResponseBody
	@RequestMapping(value = "/disLikeEnt.do", method = RequestMethod.POST)
	public ResponseEntity<String> disLikeEnt(@RequestBody EnterpriseVO entVO, HttpServletRequest req) {

		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String accountId = user.getAccount().getAccountId();

		entVO.setLoginId(accountId);

		
		log.info(accountId + "<<<<<<<<<<<<<<<<<<< 아이디");

		ServiceResult result = entService.disLikeEnt(entVO);

		String status = null;

		if (result.equals(ServiceResult.OK)) {
			status = "SUCCESS";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} else {

			status = "FAILED";
			return new ResponseEntity<String>(status, HttpStatus.FAILED_DEPENDENCY);
		}

	}

	/**
	 * 모달에 띄울 기업 정보와 게시판 리스트 조회 메소드
	 * 
	 * @param entNO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/modalDetail.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> modalDetail(
			@RequestParam(name = "BBS202page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "BBS202title") String BBS202searchType,
			@RequestParam(required = false) String BBS202searchWord, @RequestParam("entNo") int entNo, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		EnterpriseVO entVO = entService.selectEnt(entNo);

		MiniPaginationVO<BoardVO> pagingVO = new MiniPaginationVO<BoardVO>();

		pagingVO.setEntNo(entNo);

		// 기업 일반 게시판 검색 기능
		if (StringUtils.isNotBlank(BBS202searchWord)) {
			pagingVO.setBBS202searchType(BBS202searchType);
			pagingVO.setBBS202searchWord(BBS202searchWord);

			model.addAttribute("BBS202searchType", BBS202searchType);
			model.addAttribute("BBS202searchWord", BBS202searchWord);

		}

		pagingVO.setCurrentPage(currentPage);

		int totalRecord = entService.entBoardCount(pagingVO);

		pagingVO.setTotalRecord(totalRecord);

		List<BoardVO> dataList = entService.entBoardList(pagingVO);

		pagingVO.setDataList(dataList);

		map.put("entVO", entVO);
		map.put("pagingVO", pagingVO);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	/**
	 * 기업 정보 디테일 메소드
	 * 
	 * @param currentPage
	 * @param BBS201searchType
	 * @param BBS201searchWord
	 * @param entNo
	 * @param model
	 * @return
	 */
//	@PermitAll
	@RequestMapping(value = "/detail.do")
	public String entDetail(Principal principal, int entNo, Model model,
			@RequestParam(name = "BBS201page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "BBS201title") String BBS201searchType,
			@RequestParam(required = false) String BBS201searchWord,
			@RequestParam(name="entReviewPage" , required = false, defaultValue = "1") int currentPage1,
			@RequestParam(required = false, defaultValue = "") String reviewJob,
			@RequestParam(required = false, defaultValue = "") String reviewWorkStts,
			@RequestParam(name="entInterviewPage" , required = false, defaultValue = "1") int currentPage2,
			@RequestParam(required = false, defaultValue = "") String interviewSearchType,
			@RequestParam(name="recruitMiniListPage" , required = false, defaultValue = "1") int currentPage3
			) {

		
		// 기업 정보 조회
		EnterpriseVO entVO = entService.selectEnt(entNo);

		model.addAttribute("entVO", entVO);

		////////////////////////////////////////////////////////////////

		// 기업 일반 게시판 리스트 조회
		MiniPaginationVO<BoardVO> pagingVO = new MiniPaginationVO<BoardVO>();

		// 기업 일반 게시판 검색 기능
		if (StringUtils.isNotBlank(BBS201searchWord)) {
			pagingVO.setBBS201searchType(BBS201searchType);
			pagingVO.setBBS201searchWord(BBS201searchWord);

			model.addAttribute("BBS201searchType", BBS201searchType);
			model.addAttribute("BBS201searchWord", BBS201searchWord);

		}

		// 기업 게시판 정보를 가져오기 기업 번호 설정
		pagingVO.setEntNo(entNo);

		// 현재 페이지 전달 후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);

		// 총 게시글 수 가져오기
		int totalRecord = entService.entBBS201Count(pagingVO);

		// 총 게시글 전달 후, 총 페이지 설정
		pagingVO.setTotalRecord(totalRecord);

		List<BoardVO> dataList = entService.entBBS201List(pagingVO);

		// 받아온 목록 데이터 설정
		pagingVO.setDataList(dataList);

		model.addAttribute("pagingVO", pagingVO);

		///////////////////////////////////////////////////////////////////////

		// 기업 리뷰 리스트 조회
		ReviewPaginationVO<EntScoreVO> reviewPagingVO = new ReviewPaginationVO<EntScoreVO>();
		
		if (StringUtils.isNotBlank(reviewJob)) {
			reviewPagingVO.setReviewJob(reviewJob);
			model.addAttribute("reviewJob", reviewJob);
		}
		if (StringUtils.isNotBlank(reviewWorkStts)) {
			reviewPagingVO.setReviewWorkStts(reviewWorkStts);
			model.addAttribute("reviewWorkStts", reviewWorkStts);
		}
		
		
		reviewPagingVO.setEntNo(entNo);
		
		reviewPagingVO.setCurrentPage(currentPage1);
		
		int totalReview = entService.entReviewCount(reviewPagingVO);
		
		reviewPagingVO.setTotalRecord(totalReview);
		
		List<EntScoreVO> reviewList = entService.entReviewList(reviewPagingVO);
		
		reviewPagingVO.setDataList(reviewList);
		
		log.info("기업리뷰 페이징 >>>>>>>>" + reviewPagingVO);
		
		model.addAttribute("reviewPagingVO", reviewPagingVO);
		
		// 기업 리뷰 평균 점수 조회
		EntScoreVO esVO = entService.entReviewAvg(entNo);
		
		int RcmY = entService.entScrRcmdYCount(entNo);
		int RcmN = entService.entScrRcmdNCount(entNo);
		int CeoGood = entService.entScrCeoGoodCount(entNo);
		int CeoBad = entService.entScrCeoBadCount(entNo);
		int FutureY = entService.entScrFutureYCount(entNo);
		int FutureN = entService.entScrFutureNCount(entNo);
		
		
		if(esVO != null) {
			esVO.setReviewCount(totalReview);
			esVO.setEntScrRcmdY(RcmY);
			esVO.setEntScrRcmdN(RcmN);
			esVO.setEntScrCeoGood(CeoGood);
			esVO.setEntScrCeoBad(CeoBad);
			esVO.setEntScrFutureY(FutureY);
			esVO.setEntScrFutureN(FutureN);
			model.addAttribute("esVO", esVO);
		}else {
			model.addAttribute("essVO", esVO);
		}
		
		/////////////////////////////////////////////////////
		
		// 면접 후기 조회
		InterviewPaginationVO<EntInterviewVO> interviewPagingVO = new InterviewPaginationVO<EntInterviewVO>();
		
		if(StringUtils.isNotBlank(interviewSearchType)) {
			interviewPagingVO.setSearchType(interviewSearchType);
			model.addAttribute("interviewSearchType", interviewSearchType);
		}
		
		interviewPagingVO.setEntNo(entNo);
		interviewPagingVO.setCurrentPage(currentPage2);
		
		int totalInterview = entService.entInterviewCount(interviewPagingVO);
		
		interviewPagingVO.setTotalRecord(totalInterview);
		
		List<EntInterviewVO> interviewList = entService.entInterviewList(interviewPagingVO);
		
		interviewPagingVO.setDataList(interviewList);
		
		log.info("면접후기 페이징 >>>>>> "+interviewPagingVO);
		
		model.addAttribute("interviewPagingVO", interviewPagingVO);
		
		EntInterviewVO eiVO = entService.entInterviewAvg(entNo);
		
		int PositiveCount = entService.entInterviewPositiveCount(entNo);
		int NormalCount = entService.entInterviewNormalCount(entNo);
		int NegativeCount = entService.entInterviewNegativeCount(entNo);

		int PassCount = entService.entInterviewPassCount(entNo);
		int WaitingCount = entService.entInterviewWaitingCount(entNo);
		int NotPassCount = entService.entInterviewNotPassCount(entNo);
		
		int OnlineCount = entService.entInterviewOnlineCount(entNo);
		int FriendCount = entService.entInterviewFriendCount(entNo);
		int HeadHunterCount = entService.entInterviewHeadHunterCount(entNo);
		int PublicCount = entService.entInterviewPublicCount(entNo);
		int SchoolCount = entService.entInterviewSchoolCount(entNo);
		int EtcCount = entService.entInterviewEtcCount(entNo);
		
		
		if(eiVO != null) {
			eiVO.setRvmCount(totalInterview);
			eiVO.setRvwExperiencePositiveCount(PositiveCount);
			eiVO.setRvwExperienceNormalCount(NormalCount);
			eiVO.setRvwExperienceNegativeCount(NegativeCount);
			eiVO.setRvwSttsPass(PassCount);
			eiVO.setRvwSttsWaiting(WaitingCount);
			eiVO.setRvwSttsNotPass(NotPassCount);
			eiVO.setRvwCourseOnline(OnlineCount);
			eiVO.setRvwCourseFriend(FriendCount);
			eiVO.setRvwCourseHeadHunter(HeadHunterCount);
			eiVO.setRvwCoursePublic(PublicCount);
			eiVO.setRvwCourseSchool(SchoolCount);
			eiVO.setRvwCourseEtc(EtcCount);
			model.addAttribute("eiVO", eiVO);
		}else {
			model.addAttribute("eiVO", eiVO);
		}
		
		
		///////////////////////////////////////////////////////
		// 채용리스트 
		
		// 채용통계를 위한 카운트 
		RecruitStatsVO rsVO = entService.entRecruitCount(entNo);
		
		model.addAttribute("rsVO", rsVO);
		
	
		
		// 기업에서 진행중인 간략한 채용정보 리스트
		
		int miniCount = entService.entRecruitMiniCount(entNo);
		
		RecruitPaginationVO<RecruitVO> recruitPagingVO = new RecruitPaginationVO<RecruitVO>();
		
		recruitPagingVO.setEntNo(entNo);
		
		recruitPagingVO.setCurrentPage(currentPage3);
		
		recruitPagingVO.setTotalRecord(miniCount);
		
		List<RecruitVO> recruitMiniList = entService.recruitMiniList(recruitPagingVO);
		
		recruitPagingVO.setDataList(recruitMiniList);
	
		model.addAttribute("recruitPagingVO", recruitPagingVO);


		// 기업에서 진행중인 전체 채용리스트

		RecruitListPaginationVO<RecruitVO> recruitListPagingVO = new RecruitListPaginationVO<RecruitVO>();
		
		if(principal != null) {
			recruitListPagingVO.setLoginId(principal.getName());
		}else {
			recruitListPagingVO.setLoginId("기본값");
		}
		
		recruitListPagingVO.setEntNo(entNo);
		
		int recruitTotalCount = entService.recruitTotalCount(entNo);
		
		model.addAttribute("recruitTotalCount", recruitTotalCount);
		
		recruitListPagingVO.setTotalRecord(recruitTotalCount);
		
		List<RecruitVO> recruitList = entService.recruitList(recruitListPagingVO);
		
		for (int i = 0; i < recruitList.size(); i++) {
		    
			// 타입이 null이면 빈 문자열을 생성해서 nullPoint 오류 막음
		    String[] hireType = recruitList.get(i).getHireCmmncdNm() != null ? recruitList.get(i).getHireCmmncdNm().split(",") : new String[0];
		    String[] esntlType = recruitList.get(i).getEsntlLangCmmncdNm() != null ? recruitList.get(i).getEsntlLangCmmncdNm().split(",") : new String[0];
		    String[] preferType = recruitList.get(i).getPreferLangCmmncdNm() != null ? recruitList.get(i).getPreferLangCmmncdNm().split(",") : new String[0];
		    
		    Map<String, String> hireMap = new HashMap<String, String>();
		    Map<String, String> esntlMap = new HashMap<String, String>();
		    Map<String, String> preferMap = new HashMap<String, String>();
		    
		    for (String hire : hireType) {
		        hireMap.put(hire, hire);
		        recruitList.get(i).setHireType(hireMap);
		    }
		    
		    for(String esntl : esntlType) {
		        esntlMap.put(esntl, esntl);
		        recruitList.get(i).setEsntlType(esntlMap);
		    }
		    
		    for(String prefer : preferType) {
		        preferMap.put(prefer, prefer);
		        recruitList.get(i).setPreferType(preferMap);
		    }
		}
		
		recruitListPagingVO.setDataList(recruitList);
		
		
		// 날짜 및 시간 형식 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

		// 오늘 날짜 및 시간
		LocalDateTime today = LocalDateTime.now();

		// 각 채용 공고의 마감일과 오늘 날짜 사이의 차이 계산하기
		for (RecruitVO recruit : recruitList) {
			String recruitEndDt = recruit.getRecruitEndDt(); // 문자열로 가져옴
			String recruitStrtDt = recruit.getRecruitStrtDt();
			
			LocalDateTime strtDt = LocalDateTime.parse(recruitStrtDt, formatter);
		    LocalDateTime endDt = LocalDateTime.parse(recruitEndDt, formatter); // LocalDateTime으로 변환

		    
		    if (strtDt.isAfter(today)) {
		        recruit.setStrtDt("공고예정");
		    } else {
		        // 날짜 차이 계산
		    	long MinutesBetween = ChronoUnit.MINUTES.between(today, endDt);
		        long hoursBetween = ChronoUnit.HOURS.between(today, endDt);
		        
		        System.out.println(hoursBetween);
		        
		        if (MinutesBetween <= 0) {
		            recruit.setEndDt("공고마감");
		        } else if (hoursBetween <= 24) {
		            recruit.setEndDt("D-day");
		        } else {
		            long daysBetween = ChronoUnit.DAYS.between(today, endDt);
		            recruit.setEndDt("D-" + daysBetween);
		        }
		    }
		}
		
		
		
		
		model.addAttribute("recruitListPagingVO", recruitListPagingVO);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return "ent/entDetail";
	}

	/** 기업 리뷰 폼
	 * @param entNo
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@RequestMapping(value = "/entReviewForm.do", method = RequestMethod.POST)
	public String entReviewForm(int entNo, Model model) {
		EnterpriseVO entVO = entService.selectEnt(entNo);
		model.addAttribute("entVO", entVO);

		return "ent/entReview";
	}

	/** 기업리뷰 인서트 메소드
	 * @param esVO
	 * @param req
	 * @param model
	 * @param ra
	 * @return
	 */
	@RequestMapping(value = "/entReviewInsert.do", method = RequestMethod.POST)
	public String entReviewInsert(EntScoreVO esVO, HttpServletRequest req, Model model, RedirectAttributes ra) {
		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();
		if (StringUtils.isBlank(esVO.getWorkStts())) {
			errors.put("workStts", "근무상태를 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getHireCmmncd())) {
			errors.put("hireCmmncd", "고용형태를 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getPstnCmmncd())) {
			errors.put("pstnCmmncd", "직무를 입력해주세요");
		}
		if (esVO.getEntScrTscr() == 0) {
			errors.put("entScrTscr", "평점을 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrEvl())) {
			errors.put("entScrEvl", "한줄평을 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrAdvantage())) {
			errors.put("entScrAdvantage", "장점을 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrWeakness())) {
			errors.put("entScrWeakness", "단점을 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrWish())) {
			errors.put("entScrWish", "바라는점을 입력해주세요");
		}
		if (esVO.getEntScrPromotion() == 0) {
			errors.put("entScrPromotion", "별점을 입력해주세요");
		}
		if (esVO.getEntScrWelfare() == 0) {
			errors.put("entScrWelfare", "별점을 입력해주세요");
		}
		if (esVO.getEntScrWnl() == 0) {
			errors.put("entScrWnl", "별점을 입력해주세요");
		}
		if (esVO.getEntScrCulture() == 0) {
			errors.put("entScrCulture", "별점을 입력해주세요");
		}
		if (esVO.getEntScrManagement() == 0) {
			errors.put("entScrManagement", "별점을 입력해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrCeoevl())) {
			errors.put("entScrCeoevl", "CEO에 대한 견해를 체크해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrFutureCmmncd())) {
			errors.put("entScrFutureCmmncd", "1년 후 기업에 대해 체크해주세요");
		}
		if (StringUtils.isBlank(esVO.getEntScrRcmdYn())) {
			errors.put("entScrRcmdYn", "추천을 체크해주세요");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("esVO", esVO);
			goPage = "ent/entReview";
		} else {
			// 나중에는 VO형태로
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();

			if (accountId != null) {
				// 나중에는 계정VO에서 꺼낸다.
				esVO.setAccountId(accountId);
				ServiceResult result = entService.entReviewInsert(esVO);
				if (result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "리뷰 등록이 완료되었습니다");
					goPage = "redirect:/ent/detail.do?entNo=" + esVO.getEntNo();
				} else { // 등록 실패
					model.addAttribute("message", "서버에러, 다시 시도해 주세요!");
					goPage = "ent/entReview";
				}
			} else { // 로그인을 하지 않았을때
				ra.addFlashAttribute("message", "로그인 후에 사용 가능합니다.");
				goPage = "redirect:/main/loginForm.do";
			}
		}
		return goPage;
	}
	
	/** 면접후기 폼
	 * @param entNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/entInterviewForm.do", method = RequestMethod.POST)
	public String entInterviewForm(int entNo , Model model) {
		
		EnterpriseVO entVO = entService.selectEnt(entNo);
		model.addAttribute("entVO", entVO);
		
		return "ent/entInterview";
	}
	
	
	/** 면접 후기 등록
	 * @param eiVO
	 * @return
	 */
	@RequestMapping(value = "/entInterviewInsert.do")
	public String entInterviewInsert(EntInterviewVO eiVO, Model model, HttpServletRequest req ,RedirectAttributes ra) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(eiVO.getRvwCourse())) {
			errors.put("errors", "면접 경로를 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwExperience())) {
			errors.put("errors", "면접 경험을 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwCrs())) {
			errors.put("errors", "면접 과정을 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwQue())) {
			errors.put("errors", "면접 질문을 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwAns())) {
			errors.put("errors", "면접 답변을 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwCmmncd())) {
			errors.put("errors", "직무를 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwIntYmd())) {
			errors.put("errors", "면접 일자를 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwAnnYmd())) {
			errors.put("errors", "발표 일자를 입력해주세요");
		}
		if(eiVO.getRvwLevel() == 0) {
			errors.put("errors", "면접 난이도를 입력해주세요");
		}
		if(StringUtils.isBlank(eiVO.getRvwStts())) {
			errors.put("errors", "합격 상태를 입력해주세요");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("eiVO", eiVO);
			goPage = "ent/entInterview";
		}else {
			
			
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();
			
			if(accountId != null) {
				eiVO.setAccountId(accountId);
				ServiceResult result = entService.entInterviewInsert(eiVO);
				log.info(result + " ><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "후기 등록이 완료 되었습니다");
					goPage = "redirect:/ent/detail.do?entNo=" + eiVO.getEntNo();
				}else {
					model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
				}
			}else {
				ra.addFlashAttribute("message", "로그인 후에 사용 가능합니다.");
				goPage = "redirect:/main/loginForm.do";
			}
		}
		return goPage; 
	}
	
	// 관심 공고 해제
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@ResponseBody
	@RequestMapping(value = "/likeRecruit.do" , method = RequestMethod.POST)
	public ResponseEntity<String> likeRecruit (@RequestBody Map<String,String> map ){
		
		//[스프링 시큐리티] 회원 ID를 스프링 시큐리티 UserDetails 정보에서 가져오기
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();
		
			String recruitNo = map.get("recruitNo");
			String pstnNm = map.get("pstnNm");
		
			ServiceResult result = entService.likeRecruit(accountId,recruitNo,pstnNm);

			String status = null;

			if (result.equals(ServiceResult.OK)) {
				status = "SUCCESS";
				return new ResponseEntity<String>(status, HttpStatus.OK);
			} else {
				status = "FAILED";
				return new ResponseEntity<String>(status, HttpStatus.FAILED_DEPENDENCY);
			}
	}
	
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@ResponseBody
	@RequestMapping(value = "/disLikeRecruit.do" , method = RequestMethod.POST)
	public ResponseEntity<String> disLikeRecruit(@RequestBody Map<String, String> map){
		
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String accountId = user.getAccount().getAccountId();
			
			String recruitNo = map.get("recruitNo");
			String pstnNm = map.get("pstnNm");
		
			ServiceResult result = entService.disLikeRecruit(accountId,recruitNo,pstnNm);
	
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
	@RequestMapping(value = "/entScrLike.do")
	public ResponseEntity<ServiceResult> likeScrPlus(@RequestParam("entScrNo") int entScrNo){
		
		ServiceResult result = entService.entScrLike(entScrNo);
		
		if(result.equals(ServiceResult.OK)) {
			return new ResponseEntity<ServiceResult> (result,HttpStatus.OK);
		}else {
			return new ResponseEntity<ServiceResult> (result,HttpStatus.FAILED_DEPENDENCY);
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/entRvwLike.do")
	public ResponseEntity<ServiceResult> likeRvwPlus(@RequestParam("entRvwNo") int entRvwNo){
		
		ServiceResult result = entService.entRvwLike(entRvwNo);
		
		if(result.equals(ServiceResult.OK)) {
			return new ResponseEntity<ServiceResult> (result,HttpStatus.OK);
		}else {
			return new ResponseEntity<ServiceResult> (result,HttpStatus.FAILED_DEPENDENCY);
		}
		
		
	}
	
	
}
