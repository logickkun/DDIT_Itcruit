package kr.co.itcruit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AlarmVO;
import kr.co.itcruit.vo.CalendarVO;
import kr.co.itcruit.vo.EntIntroQSTNANSRVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.HireSttsVO;
import kr.co.itcruit.vo.InterestNoticesVO;
import kr.co.itcruit.vo.MemberProcessCheckVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.RecruitApplicantVO;
import kr.co.itcruit.vo.RecruitCardVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;

public interface IRecruitMapper {


//	public List<RecruitVO> getRecruitList();

	public RecruitVO applyCheck(RecruitVO recruitVO);

	public List<RecruitVO> selectInitRecruitList(PaginationInfoVO<RecruitVO> pagingVO);

	public RecruitVO recruitDetail(@Param("recruitNo") String recruitNo, @Param("pstnCmmncdNm") String pstnCmmncdNm);

	public List<String> hireCmmnd(String recruitNo);

	public EnterpriseVO selectLikeEnt(EnterpriseVO enterpriseVO);

	public int hateRecruit(RecruitVO recruitVO);

	public int loveRecruit(RecruitVO recruitVO);

	public RecruitVO selectLikeRecruit(RecruitVO recruitVO);
	

	
	public List<CalendarVO> getRecruitEndList(RecruitVO recruitVO);

	public List<CalendarVO> getRecruitStartList(RecruitVO recruitVO);

	public void insertApplicant(RecruitApplicantVO recruitApplicantVO);

	public List<RecruitApplicantVO> applicantCheck(RecruitVO recruitVO);

	public void incrementEntApply(RecruitVO recruitVO);

	public List<RecruitApplicantVO> checkApplyNo(RecruitVO recruitVO);

	public List<RecruitApplicantVO> selectApplyNo(RecruitVO recruitVO);

	public List<ResumeVO> selectListApplicant(@Param("accountId") String accountId, @Param("recruitNo") String recruitNo, @Param("pstnCmmncdNm") String pstnCmmncdNm);

	public List<RecruitVO> selectListByRecruitNo(String recruitNo);

	public List<InterestNoticesVO> checkRecruit(String accountId);

	
	
	public List<String> getPstnList();

	public List<String> getLangList();

	public List<String> getGrpList();

//	public List<RecruitVO> getRecruitInfoByNo(String rNo);

	public void incrementRecruitHit(@Param("recruitNo") String recruitNo, @Param("pstnCmmncdNm") String pstnCmmncdNm);

	public RecruitVO selectRecruit(@Param("recruitNo") String recruitNo, @Param("pstnCmmncdNm") String pstnCmmncdNm);

	public List<String> getSpecLocalList(String cmmncdGrpCd);

	public void saveAnswer(EntIntroQSTNANSRVO ansrVO);

	public EntIntroQSTNANSRVO selectQstnAnsr(EntIntroQSTNANSRVO ansrVO);

	public void updateAnswer(EntIntroQSTNANSRVO ansrVO);

	public EntIntroQSTNANSRVO setQstnAnsr(EntIntroQSTNANSRVO ansrVO);

	public List<HireSttsVO> recruitHire(@Param("recruitNo") String recruitNo, @Param("pstnCmmncdNm") String pstnCmmncdNm);

	public List<RecruitVO> selectrecommendRecruitList(PaginationInfoVO<RecruitVO> pagingVO);

	public RecruitCardVO getRecruitCard(RecruitCardVO rCardVO);

	
	
	
	
	
	
	
	
	
	
	public List<MemberProcessCheckVO> getProcessListById(String loginUser);

	//기업으로부터 온 인재제안 가져오기
	public List<AlarmVO> getTalentList(String loginUser);
	

	
}
