package kr.co.itcruit.enterprise.like.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.enterprise.like.service.ILikeService;
import kr.co.itcruit.mapper.IEnterpriseMapper;
import kr.co.itcruit.mapper.IRecruitMapper;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.RecruitApplicantVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LikeServiceImpl implements ILikeService{

	@Inject
	private IEnterpriseMapper enterpriseMapper;
	
	@Inject
	private IRecruitMapper recruitMapper;
	
	
	@Override
	public ServiceResult loveEnt(EnterpriseVO enterpriseVO) {
		ServiceResult result = null;
		
		int staus = enterpriseMapper.insertLikeEnt(enterpriseVO);
		
		if(staus > 0) {
			result = ServiceResult.OK;
					
		}else {
			result = ServiceResult.FAILED;
			
		}
		
		return result;
	}

	@Override
	public ServiceResult hateEnt(EnterpriseVO enterpriseVO) {
		
		ServiceResult result = null;
		
		int staus = enterpriseMapper.deleteLikeEnt(enterpriseVO);
		
		if(staus > 0) {
			result = ServiceResult.OK;
					
		}else {
			result = ServiceResult.FAILED;
			
		}
		
		return result;
	}

	@Override
	public RecruitVO applyCheck(RecruitVO recruitVO) {
		
		return recruitMapper.applyCheck(recruitVO);
	}

	@Override
	public ServiceResult hateRecruit(RecruitVO recruitVO) {
		
		ServiceResult result = null;
		
		int staus = recruitMapper.hateRecruit(recruitVO);
		
		if(staus > 0) {
			result = ServiceResult.OK;
					
		}else {
			result = ServiceResult.FAILED;
			
		}
		
		return result;
	}

	@Override
	public ServiceResult loveRecruit(RecruitVO recruitVO) {
		ServiceResult result = null;
		
		int staus = recruitMapper.loveRecruit(recruitVO);
		
		if(staus > 0) {
			result = ServiceResult.OK;
					
		}else {
			result = ServiceResult.FAILED;
			
		}
		
		return result;
	}

	@Override
	public int countLikeEnt(EnterpriseVO enterpriseVO) {
		return enterpriseMapper.countLikeEnt(enterpriseVO);
	}

	@Override
	public RecruitApplicantVO insertApplicant(RecruitVO recruitVO) {
	    String newApplyNo = "";
	    String recruitNo = recruitVO.getRecruitNo();
	    String pstnCmmncdNm = recruitVO.getPstnCmmncdNm();
	    log.info("accountId : {} ", recruitVO.getAccountId());
	    log.info("recruitNo : {} ", recruitVO.getRecruitNo());
	    log.info("pstnCmmncdNm : {} ", pstnCmmncdNm);
	    log.info("서비스VO : {} ", recruitVO);
	    

	    List<RecruitApplicantVO> applyNoList = recruitMapper.selectApplyNo(recruitVO);
	    log.info("applicantList : {} ", applyNoList);
	    
	    int maxNumber = 100000; // ID가 다른 경우에는 100000부터 시작하도록 설정

	    boolean foundMatchingPosition = false; // 동일한 직무명을 가진 지원자가 있는지 여부를 나타내는 변수
	    
	    RecruitApplicantVO recruitApplicantVO = new RecruitApplicantVO();

	    if (applyNoList != null && !applyNoList.isEmpty()) {
	        // 해당 공고에 대한 지원 내역이 있는 경우
	        for (RecruitApplicantVO applicant : applyNoList) {
	        	
	            System.out.println("applicant  " + applicant);
	            String applyNo = applicant.getApplyNo();
	            String[] parts = applyNo.split("_");
	            // System.out.println("parts  " + parts);
	            if (parts[2].equals(pstnCmmncdNm)) {
	                // 같은 직무의 지원번호가 이미 존재하는 경우
	                int number = Integer.parseInt(parts[3]);
	                if (number >= maxNumber) {
	                    maxNumber = number + 1;
	                }
	                foundMatchingPosition = true; // 동일한 직무명을 가진 지원자가 존재함을 표시
	                
	                if (applicant.getApplyDt() != null) {
	                    recruitApplicantVO.setApplyDt(applicant.getApplyDt());
	                }
	            }
	        }
	    }

	    if (!foundMatchingPosition) {
	        // 동일한 직무명을 가진 지원자가 없는 경우, 새로운 지원번호 생성
	        newApplyNo = recruitNo + "_" + pstnCmmncdNm + "_" + maxNumber;
	        log.info("newApplyNo : {} ", newApplyNo);
	    }

	    
	    recruitApplicantVO.setAccountId(recruitVO.getAccountId());
	    recruitApplicantVO.setRecruitNo(recruitNo);
	    recruitApplicantVO.setRsmNo(recruitVO.getRsmNo());
	    recruitApplicantVO.setPstnCmmncdNm(pstnCmmncdNm);
	    
	    // 수정된 부분: 지원번호 설정
	    if (foundMatchingPosition) {
	        recruitApplicantVO.setApplyNo(recruitNo + "_" + pstnCmmncdNm + "_" + maxNumber);
	    } else {
	        recruitApplicantVO.setApplyNo(newApplyNo);
	    }

	    log.info("recruitApplicantVO : {} ", recruitApplicantVO);

	    // 채용 지원자수 증가
	    recruitMapper.incrementEntApply(recruitVO);

	    // 변경된 recruitVO를 사용하여 지원자를 등록합니다.
	    recruitMapper.insertApplicant(recruitApplicantVO);
	    log.info("recruitApplicantVO!!!!!!! : {} ", recruitApplicantVO);
		return recruitApplicantVO;
	} 
	
	

	@Override
	public int applicantCheck(RecruitVO recruitVO) {
		
//	    String recruitNo = recruitVO.getRecruitNo();
	    String pstnCmmncdNm = recruitVO.getPstnCmmncdNm();
	    int status = 0; // 초기 상태 설정
	    
	    // 채용지원자 목록 조회
	    List<RecruitApplicantVO> applicantList = recruitMapper.checkApplyNo(recruitVO);
	    System.out.println("applicantList");
	    System.out.println(applicantList);
	    
	    if (applicantList == null || applicantList.isEmpty()) {
	        // 해당 공고에 대한 지원 내역이 없는 경우
	        status = 1; // 새로운 지원자
	    } 
//	    else {
//	        // 해당 공고에 대한 지원 내역이 있는 경우
//	        boolean matched = false; // 같은 직무의 지원자가 있는지 여부를 나타내는 변수
//	        for (RecruitApplicantVO applicant : applicantList) {
//	            // 이미 존재하는 지원 내역에서 직무와 일치하는 경우
//	            String applyNo = applicant.getApplyNo();
//	            String[] parts = applyNo.split("_");
//	            if (parts[2].equals(pstnCmmncdNm)) {
//	                status = 0; // 같은 직무의 지원자가 이미 존재
//	                matched = true; // 같은 직무의 지원자가 존재함을 표시
//	                break; // 더 이상 확인할 필요 없음
//	            }
//	        }
//	        if (!matched) {
//	            status = 1; // 같은 직무의 지원자가 존재하지 않음
//	        }
//	    }
	    
	    return status; // 상태 반환
	}

}
