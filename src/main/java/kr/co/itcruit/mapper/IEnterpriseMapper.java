package kr.co.itcruit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.EntInterviewVO;
import kr.co.itcruit.vo.EntScoreVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.InterviewPaginationVO;
import kr.co.itcruit.vo.ListPaginationVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitStatsVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.RecruitListPaginationVO;
import kr.co.itcruit.vo.ReviewPaginationVO;

public interface IEnterpriseMapper {

	public int selectEntCount(ListPaginationVO<EnterpriseVO> pagingVO);

	public List<EnterpriseVO> selectEntList(ListPaginationVO<EnterpriseVO> pagingVO);

	public int deleteLikeEnt(EnterpriseVO entVO);

	public int insertLikeEnt(EnterpriseVO entVO);

	public EnterpriseVO selectEnt(int entNo);


	public int entReviewInsert(EntScoreVO esVO);

	public int entReviewCount(ReviewPaginationVO<EntScoreVO> reviewPagingVO);

	public List<EntScoreVO> entReviewList(ReviewPaginationVO<EntScoreVO> reviewPagingVO);

	public EntScoreVO entReviewAvg(int entNo);

	public int insert(EnterpriseVO enterpriseVO);

	public int entInterviewInsert(EntInterviewVO eiVO);

	public int entInterviewCount(InterviewPaginationVO<EntInterviewVO> interviewPagingVO);

	public List<EntInterviewVO> entInterviewList(InterviewPaginationVO<EntInterviewVO> interviewPagingVO);

	public EntInterviewVO entInterviewAvg(int entNo);

	public int countLikeEnt(EnterpriseVO enterpriseVO);

	public int entInterviewPositiveCount(int entNo);

	public int entInterviewNormalCount(int entNo);

	public int entInterviewNegativeCount(int entNo);

	public int entInterviewPassCount(int entNo);

	public int entInterviewWaitingCount(int entNo);

	public int entInterviewNotPassCount(int entNo);

	public int entInterviewOnlineCount(int entNo);

	public int entInterviewFriendCount(int entNo);

	public int entInterviewHeadHunterCount(int entNo);

	public int entInterviewPublicCount(int entNo);

	public int entInterviewSchoolCount(int entNo);

	public int entInterviewEtcCount(int entNo);

	public int entScrRcmdYCount(int entNo);

	public int entScrRcmdNCount(int entNo);

	public int entScrCeoGoodCount(int entNo);

	public int entScrCeoBadCount(int entNo);

	public int entScrFutureYCount(int entNo);

	public int entScrFutureNCount(int entNo);
	
	public RecruitStatsVO entRecruitCount(int entNo);

	public List<RecruitVO> recruitMiniList(RecruitPaginationVO<RecruitVO> recruitPagingVO);

	public int recruitTotalCount(int entNo);

	public List<RecruitVO> recruitList(RecruitListPaginationVO<RecruitVO> recruitListPagingVO);

	public int likeRecruit(@Param("accountId")String accountId, @Param("recruitNo")String recruitNo,@Param("pstnNm") String pstnNm);

	public int disLikeRecruit(@Param("accountId")String accountId, @Param("recruitNo")String recruitNo,@Param("pstnNm") String pstnNm);

	public List<EnterpriseVO> logodisplay(int entNo);

	public EnterpriseVO entBrnoCheck(String brno);

	public int entScrLike(int entScrNo);

	public int entRvwLike(int entRvwNo);

	public int entRecruitMiniCount(int entNo);






}
