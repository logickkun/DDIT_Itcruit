package kr.co.itcruit.recruit.service;

import java.util.List;
import java.util.Map;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AlarmVO;
import kr.co.itcruit.vo.EntIntroQSTNANSRVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.HireSttsVO;
import kr.co.itcruit.vo.InterestNoticesVO;
import kr.co.itcruit.vo.MemberProcessCheckVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.RecruitApplicantVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;

public interface IRecruitService {

	public List<RecruitVO> selectInitRecruitList(PaginationInfoVO<RecruitVO> pagingVO);

	public RecruitVO recruitDetail(String recruitNo, String pstnCmmncdNm);

	public List<String> hireCmmnd(String recruitNo);

	public EnterpriseVO selectLikeEnt(EnterpriseVO enterpriseVO);

	public RecruitVO selectLikeRecruit(RecruitVO recruitVO);

	public List<ResumeVO> selectListApplicant(String accountId, String recruitNo, String pstnCmmncdNm);

	public List<InterestNoticesVO> checkRecruit(String accountId);

	
	public List<RecruitVO> getRecruitInfoByNo(String rNo);

	public RecruitVO selectRecruit(String recruitNo, String pstnCmmncdNm);

	public void saveAnswer(EntIntroQSTNANSRVO ansrVO);

	public EntIntroQSTNANSRVO selectQstnAnsr(EntIntroQSTNANSRVO ansrVO);

	public void updateAnswer(EntIntroQSTNANSRVO ansrVO);

	public EntIntroQSTNANSRVO setQstnAnsr(EntIntroQSTNANSRVO ansrVO);

	public List<HireSttsVO> recruitHire(String recruitNo, String pstnCmmncdNm);

	public List<RecruitVO> selectrecommendRecruitList(PaginationInfoVO<RecruitVO> pagingVO);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<MemberProcessCheckVO> getProcessListById(String loginUser);

	//기업으로부터 온 인재제안 가져오기
	public List<AlarmVO> getTalentList(String loginUser);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
