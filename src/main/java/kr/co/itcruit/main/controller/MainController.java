package kr.co.itcruit.main.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.account.service.IMemberAccountService;
import kr.co.itcruit.atch.service.IAtchFileService;
import kr.co.itcruit.board.service.IEnterpriseNoticeBoardService;
import kr.co.itcruit.enterprise.info.service.IEnterpriseInfoService;
import kr.co.itcruit.enterprise.like.service.ILikeService;
import kr.co.itcruit.main.service.IRecruitListService;
import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.recruit.service.IRecruitService;
import kr.co.itcruit.resume.service.IResumeService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.ApplyProcessListVO;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EntIntroQSTNDSNCTVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.EsntlLangVO;
import kr.co.itcruit.vo.HireSttsVO;
import kr.co.itcruit.vo.InterestNoticesVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.PositionVO;
import kr.co.itcruit.vo.PreferLangVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainController {
	//메인페이지에서 배보여질 배너와 채용정보카드 리스트들 
	//해당 카드를 눌렀을 때 창 띄우기
	//로그인버튼 눌렀을 때 로그인 페이지로 이동
	//배너 눌렀을 때 또한 카드 눌렀을 때 처럼 이벤트(해당 기업 채용정보페이지 띄우기 같은)
	//카드나 배너 3~5회 클릭 이벤트 발생 후 로그인페이지 유도
	//비회원일 경우 회원가입 유도
	//헤더에 있는 버튼 클릭시 이동할 페이지 설정 -기능구현x(페이지 주소나 매핑 주소만)
	//특정이벤트의 경우 반드시 권한이 필요하기 때문에 권한 체크후 이벤트 발생
	
	@Inject
	private IRecruitListService recruitService;
	
	@Inject
	private IRecruitService recruitSer;
	
	@Inject
	private IEnterpriseInfoService enterpriseService;
	
	@Inject
	private ILikeService likeService;
	
	@Inject
	private IAtchFileService atchFileService;
	
	@Inject
	private IEnterpriseNoticeBoardService enterpriseNoticeService;
	
	@Autowired
	private IMyEnterpriseService myEntService;
	
	@Inject
	private IMemberAccountService memAccountService;
	
	@Inject
	private IResumeService resumeService;
	
	
	
//	@PreAuthorize("hasAnyRole('AUTH102', 'AUTH103')")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model, RecruitVO recruitVO, HttpServletRequest req,
			RedirectAttributes ra
			) {
		
		// 메인화면 채용공고 20개씩 페이징처리해서 무한스크롤 하려고함
		PaginationInfoVO<RecruitVO> pagingVO = new PaginationInfoVO<RecruitVO>(20,5);
		pagingVO.setCurrentPage(1);
		
		List<RecruitVO> initRecruitList = recruitSer.selectInitRecruitList(pagingVO);
//		log.info("initRecruitList = {}", initRecruitList);
		
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		
		// 각 채용 공고의 마감일과 오늘 날짜 사이의 차이 계산하기
		for (RecruitVO recruit : initRecruitList) {
		    String recruitStrtDt = recruit.getRecruitStrtDt(); // 채용 공고의 시작일을 가져옴
		    LocalDate strtDt = LocalDate.parse(recruitStrtDt, formatter); // 시작일을 LocalDate로 변환
		    
		    String recruitEndDt = recruit.getRecruitEndDt(); // 채용 공고의 마감일을 가져옴
		    LocalDate endDt = LocalDate.parse(recruitEndDt, formatter); // 마감일을 LocalDate로 변환
		    
		    // 시작일이 오늘 이후인 경우
		    if (strtDt.isAfter(today)) {
		        long dday = ChronoUnit.DAYS.between(today, strtDt); // 오늘과 시작일 사이의 차이 계산
		        
		        if (dday < 0) {
		            recruit.setRecruitEndDt("공고마감");
		        } else {
		            recruit.setRecruitEndDt(dday + "일전");
		        }
		    } 
		    // 시작일이 오늘 이전인 경우
		    else {
		        long dday = ChronoUnit.DAYS.between(today, endDt); // 마감일과 오늘 날짜 사이의 차이 계산
		        
		        if (dday < 0) {
		            recruit.setRecruitEndDt("공고마감");
		        } else {
		            recruit.setRecruitEndDt("D-" + dday);
		        }
		    }
		}
		
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    AccountVO accountVO = null;
	    
	    if (authentication != null && authentication.getPrincipal() instanceof CustomUser) {
	        CustomUser user = (CustomUser) authentication.getPrincipal();
	        accountVO = user.getAccount();
	    }
//		log.info("account홈!!!! {} ", accountVO);
		
		if(accountVO != null) {
			model.addAttribute("account", accountVO);
			String accountId = accountVO.getAccountId();

			List<ResumeVO> resumeList = resumeService.selectAllResume(accountId);
//			System.out.println("resumeListresumeList   == " + resumeList);
			List<RecruitVO> allRecommendRecruitList = new ArrayList<>();
			List<String> uniquePstnCmmncdNm = new ArrayList<>();
			
			PaginationInfoVO<RecruitVO> paging = new PaginationInfoVO<RecruitVO>(4,1);
			paging.setCurrentPage(1);
			
			if (!resumeList.isEmpty()) {
				for (ResumeVO resume : resumeList) {
	//				System.out.println("resumeresume   == " + resume);
					for (PositionVO position : resume.getRsmPositionVO()) {
						
	//					System.out.println("positionposition : " + position);
						if (position.getPstnCmmncdNm() != null && !uniquePstnCmmncdNm.contains(position.getPstnCmmncdNm())) {
							
							uniquePstnCmmncdNm.add(position.getPstnCmmncdNm());
							
	//						System.out.println("uniquePstnCmmncdNm : " + uniquePstnCmmncdNm);
							
					    }
						
					}
				}
			}
			paging.setWords(uniquePstnCmmncdNm);
//			System.out.println("getWords = " + paging.getWords());
			
			List<RecruitVO> recommendRecruitList = recruitSer.selectrecommendRecruitList(paging);
//	        System.out.println("recommendRecruitList: " + recommendRecruitList);
	            
	        for (RecruitVO recruit : recommendRecruitList) {
			    String recruitStrtDt = recruit.getRecruitStrtDt(); // 채용 공고의 시작일을 가져옴
			    LocalDate strtDt = LocalDate.parse(recruitStrtDt, formatter); // 시작일을 LocalDate로 변환
			    
			    String recruitEndDt = recruit.getRecruitEndDt(); // 채용 공고의 마감일을 가져옴
			    LocalDate endDt = LocalDate.parse(recruitEndDt, formatter); // 마감일을 LocalDate로 변환
			    
			    // 시작일이 오늘 이후인 경우
			    if (strtDt.isAfter(today)) {
			        long dday = ChronoUnit.DAYS.between(today, strtDt); // 오늘과 시작일 사이의 차이 계산
			        
			        if (dday < 0) {
			            recruit.setRecruitEndDt("공고마감");
			        } else {
			            recruit.setRecruitEndDt(dday + "일전");
			        }
			    } 
			    // 시작일이 오늘 이전인 경우
			    else {
			        long dday = ChronoUnit.DAYS.between(today, endDt); // 마감일과 오늘 날짜 사이의 차이 계산
			        
			        if (dday < 0) {
			            recruit.setRecruitEndDt("공고마감");
			        } else {
			            recruit.setRecruitEndDt("D-" + dday);
			        }
			    }
			}
	        
	        allRecommendRecruitList.addAll(recommendRecruitList);
			
			for (RecruitVO recruit : initRecruitList) {
				recruit.setAccountId(accountId);
			}
			for (RecruitVO recruit : allRecommendRecruitList) {
			    recruit.setAccountId(accountId);
			}
//			System.out.println("!!!!! " + allRecommendRecruitList);
			model.addAttribute("recommendRecruitList", allRecommendRecruitList);
		}else {
			Cookie[] cookies = req.getCookies();
		    String userCookie = "";
	        if (cookies != null) {
	            // 쿠키 배열을 순회하며 JSESSIONID 쿠키를 찾음
	            for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("JSESSIONID")) {
	                    userCookie = cookie.getValue();
	                    // JSESSIONID를 사용하여 원하는 작업 수행
//	                    log.info("JSESSIONID: " + userCookie);
	                    // 필요한 경우 JSESSIONID를 사용하여 추가 작업 수행
	                    model.addAttribute("userCookie", userCookie);
	                }
	            }
	        }
	        
		}
		
//		System.out.println("!!!!! " + initRecruitList);
		model.addAttribute("initRecruitList", initRecruitList);
		
		return "main/main";
	}
	
	
	// 로그인 폼
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm() {
		return "conn/loginForm";
	}
	
	// 기업로그인 폼
	@RequestMapping(value = "/entLoginForm.do", method = RequestMethod.GET)
	public String entLoginForm() {
		return "conn/entLoginForm";
	}
	
	// 회원가입 폼
	@RequestMapping(value = "/registerForm.do")
	public String registerForm(Model model, @RequestParam(required = false) String act) {
//		System.out.println("!!!!" + act);
		model.addAttribute("act", act);
		return "conn/registerForm";
	}
	
	// 아이디/비밀번호찾기 폼
	@RequestMapping(value = "/idpwfindForm.do", method = RequestMethod.GET)
	public String idpwfindForm() {
		return "conn/idpwFind";
	}
	
	// 관리자로그인 폼
	@RequestMapping(value = "/adminLoginForm.do", method = RequestMethod.GET)
	public String adminLoginForm() {
		return "conn/adminLoginForm";
	}
	
	// 채용정보 상세페이지
	@RequestMapping(value = "/recruitInfo.do", method = RequestMethod.GET)
	public String recruitInfo() {
		return "conn/recruitInfo";
	}
	
	// 자소서 폼(채용공고 신청했을때)
	@RequestMapping(value = "/introForm.do", method = RequestMethod.GET)
	public String introForm(Model model, String recruitNo, String pstnCmmncdNm) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		log.info("user {} ", user);
		
		AccountVO accountVO = user.getAccount();
//		log.info("accountVO {} ", accountVO);
//		log.info("recruitNo {} ", recruitNo);
//		log.info("pstnCmmncdNm {} ", pstnCmmncdNm);
		
		// 기업이름,채용공고 이름
		RecruitVO recruitVO = recruitSer.selectRecruit(recruitNo, pstnCmmncdNm);
		recruitVO.setAccountId(accountVO.getAccountId());
		model.addAttribute("recruit", recruitVO);

//		log.info("recruitVO!!!! {} ", recruitVO);
//		System.out.println("%%%%%% " + recruitVO);
//		log.info("pstnCmmncdNm {} ", pstnCmmncdNm);
		
//		recruitNo = "240424_777777";
//		pstnCmmncdNm = "웹백엔드";
		
		// 문제 가져오기
		List<EntIntroQSTNDSNCTVO> dsnctList = myEntService.selectDsnct(recruitNo, pstnCmmncdNm);
//		System.out.println("%%%%%% " + dsnctList);
		
		model.addAttribute("dsnctList", dsnctList);
		
		return "conn/introForm";
	}
	
	
	// 채용상세
//	@PreAuthorize("hasAnyRole('ROLE_AUTH102', 'ROLE_AUTH103')")
	@GetMapping("/recruitDetail.do")
	public String recruitDetail(String recruitNo, String pstnCmmncdNm, Model model, 
			HttpSession session, HttpServletRequest req) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    AccountVO accountVO = null;
	    
	    if (authentication != null && authentication.getPrincipal() instanceof CustomUser) {
	        CustomUser user = (CustomUser) authentication.getPrincipal();
	        accountVO = user.getAccount();
	    }
	    
//	    log.info("정보 : {}", accountVO);
//	    log.info("정보 : {}", recruitNo);
//	    log.info("정보 : {}", pstnCmmncdNm);
	    
	    String goPage = null; // 기본 페이지 설정
	    
	    // 현명이 코드 가져다씀
	    List<RecruitVO> recruitInfoVO = myEntService.recruitSelectInfo(recruitNo, pstnCmmncdNm);
	    Map<String, String> esntlMap = new HashMap<String, String>(); // 루프 밖에서 초기화
	    Map<String, String> preferMap = new HashMap<String, String>(); // 루프 밖에서 초기화
	    
		for(RecruitVO rv : recruitInfoVO) {
					
			for(EsntlLangVO elVO : rv.getEsntlLangList()) {
				if(elVO != null && elVO.getEsntlLangCmmncdNm() != null) {
					esntlMap.put(elVO.getEsntlLangCmmncdNm(), elVO.getEsntlLangCmmncdNm());
				}
			}
			
			for(PreferLangVO plVO : rv.getPreferLangList()) {
				if(plVO != null && plVO.getPreferLangCmmncdNm() != null) {
					preferMap.put(plVO.getPreferLangCmmncdNm(), plVO.getPreferLangCmmncdNm());
				}
			}
			
		}
	    
		model.addAttribute("preferMap", preferMap);
		model.addAttribute("esntlMap", esntlMap);
	    
	    
	    
	    
	    
	    RecruitVO recruitVO = recruitSer.recruitDetail(recruitNo, pstnCmmncdNm);
	    List<HireSttsVO> hireSttsList = recruitSer.recruitHire(recruitNo,pstnCmmncdNm);
	    
	    log.info("hireSttsList정보 : {}", hireSttsList);
	    model.addAttribute("hireSttsList", hireSttsList);
	    
	    int entNo = recruitVO.getEntNo();
	    String accountId = (accountVO != null) ? accountVO.getAccountId() : null;
	    
//	    log.info("recruitVO : {}", recruitVO);
	    
	    EnterpriseVO enterprise = enterpriseService.selectEnt(entNo);
	    if(enterprise != null) {
	    	
//	    	log.info("enterprise : {}", enterprise);
	    	if (accountId != null) {
	    		enterprise.setLoginId(accountId);
	    		recruitVO.setAccountId(accountId);
	    		
	    		// 좋아요 여부 확인 및 추가 작업 수행
	    		EnterpriseVO likeEnt = recruitSer.selectLikeEnt(enterprise);
	    		if (likeEnt != null) {
	    			model.addAttribute("likeEnt", "y");
	    		}
	    		RecruitVO likeRecruit = recruitSer.selectLikeRecruit(recruitVO);
	    		if (likeRecruit != null) {
	    			model.addAttribute("likeRecruit", "y");
	    		}
	    		int num = likeService.countLikeEnt(enterprise);
	    		enterprise.setEntHit(num);
	    	}
	    	
	    	// 통계데이터(학교,학과,성별)
	    	List<ResumeVO> dataList = recruitSer.selectListApplicant(accountId, recruitNo, pstnCmmncdNm);
	    	System.out.println("dataListdataList  :  " + dataList);
//	    	model.addAttribute("dataList", dataList);
	    	// 고등학교는 빼고 저장
	    	List<ResumeVO> filterList = new ArrayList<>();
	    	for (ResumeVO rVO : dataList) {
	    		String eduNm = rVO.getEduAcdmcr();
	    	    if (eduNm != null && !eduNm.equals("고등학교")) {
	    	    	filterList.add(rVO);
	    	    }
	    	}
	    	System.out.println("filterListfilterList  :  " + filterList);
	    	
	    	
	    	List<String> schoolList = new ArrayList<>();
	    	List<String> departmentList = new ArrayList<>();
	    	List<String> genderList = new ArrayList<>();
	    	for (ResumeVO resume : filterList) {
	    		schoolList.add(resume.getEduNm());
	    		departmentList.add(resume.getRsmMjrNm());
	    		genderList.add(resume.getRsmGender());
	    	}
	    	
	    	model.addAttribute("schoolList", schoolList);
	    	model.addAttribute("departmentList", departmentList);
	    	model.addAttribute("genderList", genderList);
//		    System.out.println(schoolList);
//		    System.out.println(departmentList);
//		    System.out.println(genderList);
	    	
	    	// 공지기업게시판 추가
	    	BoardVO boardVO = enterpriseNoticeService.selectEnterpriseNotice(entNo);
	    	log.info("공지기업게시판 1개 {} ", boardVO);
	    	
	    	if(boardVO != null) {
	    		
//	    		// 공지기업게시판 댓글 조회수
	    		String noticeBbsNo = boardVO.getBbsNo();
	    		int noticeHit = enterpriseNoticeService.selectEntNoticeComment(noticeBbsNo);
	    		log.info("공지기업게시판 조회수 {} ", boardVO);
	    		boardVO.setNoticeEntCommentHit(noticeHit);
//	    		
	    		model.addAttribute("boardNotice", boardVO);
	    	}
	    	
	    	// 자유기업게시판 추가
	    	BoardVO bVO = enterpriseNoticeService.selectEnterpriseFree(entNo);
	    	log.info("자유기업게시판 1개 {} ", bVO);
	    	
	    	if(bVO != null) {
	    		
	    		// 자유기업게시판 댓글 조회수
	    		String freeBbsNo = bVO.getBbsNo();
	    		int freeHit = enterpriseNoticeService.selectEntNoticeComment(freeBbsNo);
	    		bVO.setFreeEntCommentHit(freeHit);
	    		
	    		model.addAttribute("boardFree", bVO);
	    	}
	    	
	    	model.addAttribute("recruit", recruitVO);
	    	model.addAttribute("enterprise", enterprise);
	    	
	    	log.info("#@" , recruitVO.toString());
	    	
	    	goPage = "conn/recruitInfo";
	    	
	    }else {
	    	goPage = "redirect:/main/index";
	    }
	    
	    return goPage;
	    
	}
	
	@RequestMapping(value = "/logodisplay", method = RequestMethod.GET)
	public ResponseEntity<byte[]> imgdisplay(int entNo) {
//		log.info("로고 entNo : " + entNo);
//		System.out.println("로고 entNo : " + entNo);
		
		byte[] image = null;
		
		List<EnterpriseVO> entList = enterpriseService.logodisplay(entNo);
		
		if(!entList.isEmpty()) {
			
			EnterpriseVO entierpriseVO = entList.get(0);
			
			image = entierpriseVO.getEntImg();
		}
		
		byte[] logo = image;
		
//		log.info("로고 logo : " + logo);
//		System.out.println("로고 logo : " + logo);
		
		return new ResponseEntity<byte[]>(logo, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/fileDisplay", method = RequestMethod.GET)
	public ResponseEntity<byte[]> fileDisplay(@RequestParam("recruitNo") String recruitNo, @RequestParam("pstnCmmncdNm") String pstnCmmncdNm) {
		log.info("#####################recruitNo : " + recruitNo);
		log.info("#####################pstnCmmncdNm : " + pstnCmmncdNm);
		String fileSrcNo = recruitNo + "_" + pstnCmmncdNm;
		log.info("#####################fileSrcNo : " + fileSrcNo);
		String orgnCmmncd = "채용공고"; // 상세요강
		
		AtchFileVO atchFileVO = atchFileService.selectFile(fileSrcNo, orgnCmmncd); 
		
		byte[] brnoFile = null;
		
		if(atchFileVO != null) {
			
//			log.info("#####################enterpriseVO : " + atchFileVO);
			String filePath = atchFileVO.getFilePath();
			
			File file = new File(filePath);
			
			try {
				brnoFile = Files.readAllBytes(file.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
//		log.info("#####################brnoFile : " + brnoFile);
		
		return new ResponseEntity<byte[]>(brnoFile, HttpStatus.OK);
		
	}
	
	
	// 무한스크롤 페이지 추가
	@RequestMapping(value = "/paginationInfo", method = RequestMethod.POST)
	public ResponseEntity<List<RecruitVO>> getPaginationInfo(int currentPage) {
		
	    PaginationInfoVO<RecruitVO> pagingVO = new PaginationInfoVO<RecruitVO>(20, 5);
	    pagingVO.setCurrentPage(currentPage);
//	    PaginationInfoVO<RecruitVO> pagingVO = new PaginationInfoVO<RecruitVO>(1, 1);
//	    pagingVO.setCurrentPage(currentPage);
	    
	    List<RecruitVO> initRecruitList = recruitSer.selectInitRecruitList(pagingVO);
//		log.info("initRecruitList무한시작 = {}", initRecruitList);
	    
	    
	    LocalDate today = LocalDate.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		// 각 채용 공고의 마감일과 오늘 날짜 사이의 차이 계산하기
//		for (RecruitVO recruit : initRecruitList) {
//		    String recruitEndDt = recruit.getRecruitEndDt(); // 문자열로 가져옴
////		    System.out.println("recruitEndDt = " + recruitEndDt);
//		    LocalDate EndDt = LocalDate.parse(recruitEndDt, formatter); // LocalDate로 변환
////		    System.out.println("EndDt = " + EndDt);
//		    long dday = ChronoUnit.DAYS.between(today, EndDt); // 날짜 차이 계산
////		    System.out.println("recruitEndDt - today = " + dday);
//		    if(dday < 0) {
//		    	recruit.setRecruitEndDt(String.valueOf("-1"));
//		    }else {
//		    	recruit.setRecruitEndDt(String.valueOf(dday));
//		    }
//		}
		
		for (RecruitVO recruit : initRecruitList) {
		    String recruitStrtDt = recruit.getRecruitStrtDt(); // 채용 공고의 시작일을 가져옴
		    LocalDate strtDt = LocalDate.parse(recruitStrtDt, formatter); // 시작일을 LocalDate로 변환
		    
		    String recruitEndDt = recruit.getRecruitEndDt(); // 채용 공고의 마감일을 가져옴
		    LocalDate endDt = LocalDate.parse(recruitEndDt, formatter); // 마감일을 LocalDate로 변환
		    
		    // 시작일이 오늘 이후인 경우
		    if (strtDt.isAfter(today)) {
		        long dday = ChronoUnit.DAYS.between(today, strtDt); // 오늘과 시작일 사이의 차이 계산
		        
		        if (dday < 0) {
		            recruit.setRecruitEndDt("공고마감");
		        } else {
		            recruit.setRecruitEndDt(dday + "일전");
		        }
		    } 
		    // 시작일이 오늘 이전인 경우
		    else {
		        long dday = ChronoUnit.DAYS.between(today, endDt); // 마감일과 오늘 날짜 사이의 차이 계산
		        
		        if (dday < 0) {
		            recruit.setRecruitEndDt("공고마감");
		        } else {
		            recruit.setRecruitEndDt("D-" + dday);
		        }
		    }
		}
		
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    AccountVO accountVO = null;
	    
	    if (authentication != null && authentication.getPrincipal() instanceof CustomUser) {
	        CustomUser user = (CustomUser) authentication.getPrincipal();
	        accountVO = user.getAccount();
	    }
		
		if(accountVO != null) {
			String accountId = accountVO.getAccountId();
			
			for (RecruitVO recruit : initRecruitList) {
			       recruit.setAccountId(accountId);
			   }
		}
		
		log.info("initRecruitList = {}", initRecruitList);
	    return new ResponseEntity<List<RecruitVO>>(initRecruitList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/interestList.do", method = RequestMethod.GET)
	public ResponseEntity<List<InterestNoticesVO>> interestList(String accountId){
//		String accountId = accountVO.getAccountId();
		List<InterestNoticesVO> interestList = recruitSer.checkRecruit(accountId);
//		System.out.println("interestListinterestList :: " + interestList);
//		model.addAttribute("interestList", interestList);
		return new ResponseEntity<List<InterestNoticesVO>>(interestList, HttpStatus.OK);
	}
	
	// 정지된 계정 모달출력
	@RequestMapping(value = "/selectAccount.do", method = RequestMethod.GET)
	public ResponseEntity<AccountVO> selectAccount(String accountId){
		AccountVO accountVO = new AccountVO();
		accountVO.setAccountId(accountId);
		
		AccountVO avo = memAccountService.selectAccount(accountVO);
//		System.out.println("!!!!!  =  " + avo);
//		System.out.println(avo);
		
		return new ResponseEntity<AccountVO>(avo, HttpStatus.OK);
	}
	
	// 이력서 확인 모달출력
	@RequestMapping(value = "/checkResume.do", method = RequestMethod.GET)
	public ResponseEntity<List<ResumeVO>> checkResume(String accountId){
		
		List<ResumeVO> resumeList = resumeService.checkResume(accountId);
//		System.out.println("!!!!!  =  " + resumeList);
//		System.out.println(resumeList);
		
		return new ResponseEntity<List<ResumeVO>>(resumeList, HttpStatus.OK);
	}
	

}
