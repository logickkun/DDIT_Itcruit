package kr.co.itcruit.recruit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.recruit.service.IRecruitService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;
import kr.co.itcruit.vo.EntIntroQSTNANSRVO;
import kr.co.itcruit.vo.EntIntroQSTNDSNCTVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitController {

	//여기 컨트롤러는
	//채용 리스트를 입력, 수정, 삭제하는 곳
	
	@Inject
	private IRecruitService recruitService;
	
	@RequestMapping(value="/info", method = RequestMethod.POST)
	public ResponseEntity<List<RecruitVO>> getRecruitInfo(
			@RequestBody Map<String, String> recruitNo
			) {
		
		String rNo = recruitNo.get("recruitNo");
		List<RecruitVO> recruitInfo = recruitService.getRecruitInfoByNo(rNo);
		log.info("getRecruitInfo>>>>>>>" + recruitInfo);
		return new ResponseEntity<List<RecruitVO>>(recruitInfo , HttpStatus.OK); 
	}
	
	@RequestMapping(value = "/paginationInfo", method = RequestMethod.POST)
	public ResponseEntity<List<EntIntroQSTNDSNCTVO>> getPaginationInfo(EntIntroQSTNANSRVO ansrVO) {
		System.out.println("!!!!!  == " + ansrVO);
		return null;
	} 
	
	@RequestMapping(value = "/insertAnswer.do", method = RequestMethod.POST)
	public ResponseEntity<String> insertAnswer(@RequestBody List<EntIntroQSTNANSRVO> ansrVOList) {
//	    System.out.println("!!!!!  == " + ansrVOList);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("채용user {} ", user);
		
		AccountVO accountVO = user.getAccount();
		log.info("채용accountVO {} ", accountVO);
		log.info("dddddddd" + accountVO.getApplyNo());
		
	    String yn = "Y";
	    
	    try {
	        for (EntIntroQSTNANSRVO ansrVO : ansrVOList) {
	        	ansrVO.setAccountId(accountVO.getAccountId());
	        	
	        	EntIntroQSTNANSRVO entIntroQSTNANSRVO = recruitService.selectQstnAnsr(ansrVO);
	        	if(entIntroQSTNANSRVO != null) {
	        		recruitService.updateAnswer(ansrVO);
	        	}else {
	        		recruitService.saveAnswer(ansrVO);
	        	}
	            
	        }
	        
	    } catch (Exception e) {
	        yn = "N";
	    }
	    
	    return new ResponseEntity<String>(yn, HttpStatus.OK);
	} 
	
	
	
	@RequestMapping(value = "/submitAnswer.do", method = RequestMethod.POST)
	public ResponseEntity<String> submitAnswer(@RequestBody List<EntIntroQSTNANSRVO> ansrVOList) {
//	    System.out.println("!!!!!  == " + ansrVOList);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("채용user {} ", user);
		
		AccountVO accountVO = user.getAccount();
		log.info("채용accountVO {} ", accountVO);
		
	    String yn = "Y";
	    
	    try {
	        for (EntIntroQSTNANSRVO ansrVO : ansrVOList) {
	        	ansrVO.setAccountId(accountVO.getAccountId());
	        	
	        	EntIntroQSTNANSRVO entIntroQSTNANSRVO = recruitService.selectQstnAnsr(ansrVO);
	        	if(entIntroQSTNANSRVO != null) {
	        		recruitService.updateAnswer(ansrVO);
	        	}else {
	        		recruitService.saveAnswer(ansrVO);
	        	}
	            
	        }
	        
	    } catch (Exception e) {
	        yn = "N";
	    }
	    
	    return new ResponseEntity<String>(yn, HttpStatus.OK);
	} 
	
	@RequestMapping(value = "/settingAnsr.do", method = RequestMethod.POST)
	public ResponseEntity<List<EntIntroQSTNANSRVO>> settingAnsr(@RequestBody List<EntIntroQSTNANSRVO> ansrVOList) {
//	    System.out.println("ㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲ  == " + ansrVOList);
	    
	    List<EntIntroQSTNANSRVO> answerList = new ArrayList<EntIntroQSTNANSRVO>();
	    
        for (EntIntroQSTNANSRVO ansrVO : ansrVOList) {
        	
        	EntIntroQSTNANSRVO answerVO = recruitService.setQstnAnsr(ansrVO);
        	if(answerVO != null) {
        		answerList.add(answerVO);
        	}
        }
	        
	    
	    return new ResponseEntity<List<EntIntroQSTNANSRVO>>(answerList, HttpStatus.OK);
	} 
}
