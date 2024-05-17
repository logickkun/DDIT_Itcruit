package kr.co.itcruit.enterprise.info.service;

import java.util.List;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EntInterviewVO;
import kr.co.itcruit.vo.EntScoreVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.InterviewPaginationVO;
import kr.co.itcruit.vo.ListPaginationVO;
import kr.co.itcruit.vo.MiniPaginationVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitStatsVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.RecruitListPaginationVO;
import kr.co.itcruit.vo.ReviewPaginationVO;

public interface IEnterpriseInfoService {

	public int selectEntCount(ListPaginationVO<EnterpriseVO> pagingVO);

	public List<EnterpriseVO> selectEntList(ListPaginationVO<EnterpriseVO> pagingVO);

	public ServiceResult likeEnt(EnterpriseVO entVO);

	public ServiceResult disLikeEnt(EnterpriseVO entVO);

	public EnterpriseVO selectEnt(int entNo);

	public int entBoardCount(MiniPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> entBoardList(MiniPaginationVO<BoardVO> pagingVO);

	public int entBBS201Count(MiniPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> entBBS201List(MiniPaginationVO<BoardVO> pagingVO);

	public ServiceResult entReviewInsert(EntScoreVO esVO);

	public int entReviewCount(ReviewPaginationVO<EntScoreVO> reviewPagingVO);

	public List<EntScoreVO> entReviewList(ReviewPaginationVO<EntScoreVO> reviewPagingVO);

	public EntScoreVO entReviewAvg(int entNo);

	public ServiceResult entInterviewInsert(EntInterviewVO eiVO);

	public int entInterviewCount(InterviewPaginationVO<EntInterviewVO> interviewPagingVO);

	public List<EntInterviewVO> entInterviewList(InterviewPaginationVO<EntInterviewVO> interviewPagingVO);

	public EntInterviewVO entInterviewAvg(int entNo);

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

	public List<RecruitVO> recruitList(RecruitListPaginationVO<RecruitVO> recruitListPagingVO);

	public int recruitTotalCount(int entNo);

	public ServiceResult likeRecruit(String accountId, String recruitNo, String pstnNm);

	public ServiceResult disLikeRecruit(String accountId, String recruitNo, String pstnNm);

	public List<EnterpriseVO> logodisplay(int entNo);

	public ServiceResult entScrLike(int entScrNo);

	public ServiceResult entRvwLike(int entRvwNo);

	public int entRecruitMiniCount(int entNo);

}
