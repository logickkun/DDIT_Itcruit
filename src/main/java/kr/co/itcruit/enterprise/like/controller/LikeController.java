package kr.co.itcruit.enterprise.like.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.enterprise.like.service.ILikeService;
import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.resume.service.IResumeService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.ApplyProcessListVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EachProcessApplyPassVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.RecruitApplicantVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/like")
public class LikeController {
	
//	기업 / 채용 좋아요 눌렀을 경우 이놈이 일함
	
	@Inject
	private ILikeService likeService;
	
	@Inject
	private IResumeService resumeService;
	
	@Autowired
	private IMyEnterpriseService myEntService;
	//1. 관심기업추가
	//2. 관심채용추가
	
	// 관심기업 추가
	@RequestMapping(value = "/loveEnt.do", method = RequestMethod.POST)
	public ResponseEntity<EnterpriseVO> loveEnt(@RequestBody EnterpriseVO enterpriseVO,
			Model model) {
		
//		log.info(enterpriseVO.toString());
		CustomUser account = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO accountVO = account.getAccount();
		
		String accountId = accountVO.getAccountId();
		enterpriseVO.setLoginId(accountId);
		ServiceResult result = likeService.loveEnt(enterpriseVO);
		String yn = "";
		
		int num = likeService.countLikeEnt(enterpriseVO);
		
		if(result.equals(ServiceResult.OK)) {
			yn = "Y";
		}else {
			yn = "N";
		}
			
		enterpriseVO.setEntHit(num);
		enterpriseVO.setLikeEntYN(yn);
		return new ResponseEntity<EnterpriseVO>(enterpriseVO, HttpStatus.OK);
	}
	
	// 관심기업 삭제
	@RequestMapping(value = "/hateEnt.do", method = RequestMethod.POST)
	public ResponseEntity<EnterpriseVO> hateEnt(@RequestBody EnterpriseVO enterpriseVO,
			Model model) {
		
//		log.info(enterpriseVO.toString());
		CustomUser account = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO accountVO = account.getAccount();
		
		String accountId = accountVO.getAccountId();
		enterpriseVO.setLoginId(accountId);
		ServiceResult result = likeService.hateEnt(enterpriseVO);
		String yn = "";
		
		int num = likeService.countLikeEnt(enterpriseVO);
		
		if(result.equals(ServiceResult.OK)) {
			yn = "Y";
		}else {
			yn = "N";
		}
		
		enterpriseVO.setEntHit(num);
		enterpriseVO.setLikeEntYN(yn);
			
		return new ResponseEntity<EnterpriseVO>(enterpriseVO, HttpStatus.OK);
	}
	
	
	// 지원버튼
	@RequestMapping(value = "/apply.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> applyCheck(@RequestBody RecruitVO recruitVO,
			Model model, HttpSession session) {
		
//		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		AccountVO account = user.getAccount();
//		log.info("&&&&&&&&&&&   ", account);
//		log.info("&&&&&&&&&&&   ", recruitVO);
		
		log.info("recruitVO 지원버튼 클릭 : {} ", recruitVO);
		
		String accountId = recruitVO.getAccountId();
		String recruitNo = recruitVO.getRecruitNo();
//		String pstnCmmncdNm = recruitVO.getPsmtnCmncdNm;
//		log.info("accountIdaccountId : {} ", accountId);
		// 지원내역 확인
		int raVO = likeService.applicantCheck(recruitVO);
		log.info("raVO : {} ", raVO);
		
		// 이력서 여부 조회
		List<ResumeVO> resumeList = resumeService.selectResume(accountId);
//		log.info("resumeList : {} ", resumeList);
		
		RecruitVO recruit = likeService.applyCheck(recruitVO);
//		log.info("recruit : {} ",  recruit);
		
		
		
		// 채용지원 없을떄
		if(raVO == 1) {
			recruit.setApplicantCheck("N");
			// 이력서 없을떄
			if(resumeList == null || resumeList.isEmpty()) {
				
				recruit.setResumeCheck("N");
			}else { // 이력서 있을떄
				recruit.setResumeCheck("Y");
				
				
				// 프로세스 이용했을떄
				if(recruit.getProcessYn().equals("Y")) {
					// 채용지원자 등록
//					RecruitApplicantVO recruitApplicantVO = likeService.insertApplicant(recruitVO);
//					System.out.println("!!!!!  " + recruitApplicantVO);
//					String applyNo = recruitApplicantVO.getApplyNo();
//					
//					
//					recruitNo = "240425_777777";
//					pstnCmmncdNm = "인공지능/머신러닝";
//					
//					List<ApplyProcessListVO> selectApplyProcessList = myEntService.selectApplyProcessList(recruitNo, pstnCmmncdNm);
//					
//					ApplyProcessListVO selectedApplyProcess = null;
//					
//					if(selectApplyProcessList != null) {
//						
//						System.out.println(selectApplyProcessList);
//						for (ApplyProcessListVO applyProcessListVO : selectApplyProcessList) {
//							if (applyProcessListVO.getApplyProcessOrder() == 1) {
//								selectedApplyProcess = applyProcessListVO;
//								break; // 조건을 만족하는 요소를 찾으면 반복문 종료
//							}
//							
//						}
//					}
//					
//					EachProcessApplyPassVO eachProcessApplyPassVO = new EachProcessApplyPassVO();
//					
//					String eachProcessNo = ""; // 기본값 설정
//
//					// 최근 값이 있는지 확인
//					String recentEachProcessNo = myEntService.selectEachProcessNo(eachProcessApplyPassVO);
//					if (recentEachProcessNo != null && !recentEachProcessNo.isEmpty()) {
//					    int recentValue = Integer.parseInt(recentEachProcessNo); // 최근 값 변환
//					    recentValue++; // 최근 값에 1 추가
//					    eachProcessNo = Integer.toString(recentValue); // 문자열로 변환
//					} else {
//					    eachProcessNo = "9000000"; // 값이 없으면 기본값 설정
//					}
//
//					
//					eachProcessApplyPassVO.setEachProcessNo(eachProcessNo);
//					eachProcessApplyPassVO.setApplyNo(applyNo);
//					if(selectedApplyProcess != null) {
//						eachProcessApplyPassVO.setProcessSeq(selectedApplyProcess.getProcessSeq());
//						eachProcessApplyPassVO.setRecruitNo(selectedApplyProcess.getRecruitNo());
//						eachProcessApplyPassVO.setPstnCmmncdNm(selectedApplyProcess.getPstnCmmncdNm());
//						eachProcessApplyPassVO.setClsNm(selectedApplyProcess.getClsNm());
//						eachProcessApplyPassVO.setEachOrder(selectedApplyProcess.getApplyProcessOrder());
//						log.info("eachProcessApplyPassVO : {} ",  eachProcessApplyPassVO);
//						int status = myEntService.insetEachProcess(eachProcessApplyPassVO);
//						
//						if(status > 0) {
//							model.addAttribute("message", "성공");
//						}
//					}
					
					
					
				}else { // 이용하지 않았을떄
					model.addAttribute("recruit", recruit);
				}
			}
		}else { // 채용지원 있을떄
			recruit.setApplicantCheck("Y");
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resumeList", resumeList);
		resultMap.put("recruit", recruit);
		
		model.addAttribute("recruit", recruit);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		
	}
	
	
	
	@RequestMapping(value = "/applyInsert.do", method = RequestMethod.POST)
	public ResponseEntity<RecruitVO> applyInsert(@RequestBody RecruitVO recruitVO,
			Model model, HttpSession session) {
		
		
		log.info("recruitVO 지원버튼 클릭 : {} ", recruitVO);
		
		String accountId = recruitVO.getAccountId();
		String recruitNo = recruitVO.getRecruitNo();
		String pstnCmmncdNm = recruitVO.getPstnCmmncdNm();
		String rsmNo = recruitVO.getRsmNo();
		
		// 프로세스 확인
		RecruitVO recruit = likeService.applyCheck(recruitVO);
//		log.info("recruit : {} ",  recruit);
		
		
		
		// 프로세스 이용했을떄
		if(recruit.getProcessYn().equals("Y")) {
			
			// 채용지원자 등록
			RecruitApplicantVO recruitApplicantVO = likeService.insertApplicant(recruitVO);
			System.out.println("!!!!!  " + recruitApplicantVO);
			String applyNo = recruitApplicantVO.getApplyNo();
			
			
//			recruitNo = "240425_777777";
//			pstnCmmncdNm = "인공지능/머신러닝";
			System.out.println("!!!!!  " + recruitNo);
			System.out.println("!!!!!  " + pstnCmmncdNm);
			
			List<ApplyProcessListVO> selectApplyProcessList = myEntService.selectApplyProcessList(recruitNo, pstnCmmncdNm);
			
			ApplyProcessListVO selectedApplyProcess = null;
			
			if(selectApplyProcessList != null) {
				
				System.out.println(selectApplyProcessList);
				for (ApplyProcessListVO applyProcessListVO : selectApplyProcessList) {
					if (applyProcessListVO.getApplyProcessOrder() == 1) {
						selectedApplyProcess = applyProcessListVO;
						break; // 조건을 만족하는 요소를 찾으면 반복문 종료
					}
					
				}
			}
			System.out.println("!!!!!  " + selectedApplyProcess);
			EachProcessApplyPassVO eachProcessApplyPassVO = new EachProcessApplyPassVO();
			
			String eachProcessNo = ""; // 기본값 설정

			// 최근 값이 있는지 확인
			String recentEachProcessNo = myEntService.selectEachProcessNo(eachProcessApplyPassVO);
			if (recentEachProcessNo != null && !recentEachProcessNo.isEmpty()) {
			    int recentValue = Integer.parseInt(recentEachProcessNo); // 최근 값 변환
			    recentValue++; // 최근 값에 1 추가
			    eachProcessNo = Integer.toString(recentValue); // 문자열로 변환
			} else {
			    eachProcessNo = "9000000"; // 값이 없으면 기본값 설정
			}

			log.info("eachProcessApplyPassVO전 : {} ",  eachProcessApplyPassVO);
			eachProcessApplyPassVO.setEachProcessNo(eachProcessNo);
			eachProcessApplyPassVO.setApplyNo(applyNo);
			
			if(selectedApplyProcess != null) {
				eachProcessApplyPassVO.setProcessSeq(selectedApplyProcess.getProcessSeq());
				eachProcessApplyPassVO.setRecruitNo(selectedApplyProcess.getRecruitNo());
				eachProcessApplyPassVO.setPstnCmmncdNm(selectedApplyProcess.getPstnCmmncdNm());
				eachProcessApplyPassVO.setClsNm(selectedApplyProcess.getClsNm());
				eachProcessApplyPassVO.setEachOrder(selectedApplyProcess.getApplyProcessOrder());
				eachProcessApplyPassVO.setRsmNo(rsmNo);
				
				log.info("eachProcessApplyPassVO후 : {} ",  eachProcessApplyPassVO);
				
				
				int status = myEntService.insetEachProcess(eachProcessApplyPassVO);
				
				if(status > 0) {
					model.addAttribute("message", "성공");
				}
			}
			
			
			
		}
		
		
		return new ResponseEntity<RecruitVO>(recruit, HttpStatus.OK);
		
	}
	
	
	// 관심공고 삭제
	@RequestMapping(value = "hateRecruit.do", method = RequestMethod.POST)
	public ResponseEntity<String> hateRecruit(@RequestBody RecruitVO recruitVO,
			Model model) {
		
//		log.info("recruitVOrecruitVO : {} ", recruitVO);
		ServiceResult result = likeService.hateRecruit(recruitVO);
		String yn = "";
		
		if(result.equals(ServiceResult.OK)) {
			yn = "Y";
		}else {
			yn = "N";
		}
			
		return new ResponseEntity<String>(yn, HttpStatus.OK);
	}
	
	// 관심공고 추가
	@RequestMapping(value = "/loveRecruit.do", method = RequestMethod.POST)
	public ResponseEntity<String> loveRecruit(@RequestBody RecruitVO recruitVO,
			Model model) {
		
//		log.info("recruitVOrecruitVO : {} ", recruitVO);
		ServiceResult result = likeService.loveRecruit(recruitVO);
		String yn = "";
		
		if(result.equals(ServiceResult.OK)) {
			yn = "Y";
		}else {
			yn = "N";
		}
			
		return new ResponseEntity<String>(yn, HttpStatus.OK);
	}
	
	
	// 관심공고 추가
	@RequestMapping(value = "/count.do", method = RequestMethod.GET)
	public ResponseEntity<Integer> count(@RequestBody EnterpriseVO enterpriseVO,
			Model model) {
		
		int result = likeService.countLikeEnt(enterpriseVO);
//		log.info("@@@@@@@@@@@@@@@@@    " + String.valueOf(result));
		
		int num = 0;
		
		if(result > 0) {
			num = result;
		}else {
			num = result;
		}
			
		return new ResponseEntity<Integer>(num, HttpStatus.OK);
	}
	
	
	
	
	@RequestMapping(value = "/kakaoPay.do")
	public String kakaoPAy() {
		
		return "conn/kakaoPay";
		
	}
	
	
	
	
}
