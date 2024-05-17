package kr.co.itcruit.enterprise.info.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.enterprise.info.service.IEnterpriseInfoService;
import kr.co.itcruit.mapper.IBoardMapper;
import kr.co.itcruit.mapper.IEnterpriseMapper;
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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EnterpriseInfoServiceImpl implements IEnterpriseInfoService{

	@Inject
	private IEnterpriseMapper enterpriseMapper;
	
	@Inject
	private IBoardMapper boardMapper;
	
	/**
	 * 기업정보목록
	 */
	@Override
	public int selectEntCount(ListPaginationVO<EnterpriseVO> pagingVO) {
		return enterpriseMapper.selectEntCount(pagingVO);
	}

	/**
	 * 기업정보목록
	 */
	@Override
	public List<EnterpriseVO> selectEntList(ListPaginationVO<EnterpriseVO> pagingVO) {
		return enterpriseMapper.selectEntList(pagingVO);
	}

	@Override
	public ServiceResult likeEnt(EnterpriseVO entVO) {
		
		ServiceResult result = null;
		
		int status = enterpriseMapper.deleteLikeEnt(entVO);
		
		if(status > 0) { // 삭제 성공
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult disLikeEnt(EnterpriseVO entVO) {
		ServiceResult result = null;
		
		int status = enterpriseMapper.insertLikeEnt(entVO);
		
		if(status > 0) { // 삭제 성공
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public EnterpriseVO selectEnt(int entNo) {
			

		EnterpriseVO entVO = enterpriseMapper.selectEnt(entNo);

		return entVO;
	}

	@Override
	public int entBoardCount(MiniPaginationVO<BoardVO> pagingVO) {
		return boardMapper.entBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> entBoardList(MiniPaginationVO<BoardVO> pagingVO) {
		return boardMapper.entBoardList(pagingVO);
	}

	@Override
	public int entBBS201Count(MiniPaginationVO<BoardVO> pagingVO) {
		return boardMapper.entBBS201Count(pagingVO);
	}

	@Override
	public List<BoardVO> entBBS201List(MiniPaginationVO<BoardVO> pagingVO) {
		return boardMapper.entBBS201List(pagingVO);
	}

	@Override
	public ServiceResult entReviewInsert(EntScoreVO esVO) {
		ServiceResult result = null;
		int status = enterpriseMapper.entReviewInsert(esVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int entReviewCount(ReviewPaginationVO<EntScoreVO> reviewPagingVO) {
		return enterpriseMapper.entReviewCount(reviewPagingVO);
	}

	@Override
	public List<EntScoreVO> entReviewList(ReviewPaginationVO<EntScoreVO> reviewPagingVO) {
		return enterpriseMapper.entReviewList(reviewPagingVO);
	}

	@Override
	public EntScoreVO entReviewAvg(int entNo) {
		return enterpriseMapper.entReviewAvg(entNo);
	}

	@Override
	public ServiceResult entInterviewInsert(EntInterviewVO eiVO) {

		ServiceResult result = null; 
				
		int status = enterpriseMapper.entInterviewInsert(eiVO);;
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int entInterviewCount(InterviewPaginationVO<EntInterviewVO> interviewPagingVO) {
		return enterpriseMapper.entInterviewCount(interviewPagingVO);
	}

	@Override
	public List<EntInterviewVO> entInterviewList(InterviewPaginationVO<EntInterviewVO> interviewPagingVO) {
		return enterpriseMapper.entInterviewList(interviewPagingVO);
	}

	@Override
	public EntInterviewVO entInterviewAvg(int entNo) {
		
		
		return enterpriseMapper.entInterviewAvg(entNo);
	}

	@Override
	public int entInterviewPositiveCount(int entNo) {
		return enterpriseMapper.entInterviewPositiveCount(entNo);
	}

	@Override
	public int entInterviewNormalCount(int entNo) {
		return enterpriseMapper.entInterviewNormalCount(entNo);
	}

	@Override
	public int entInterviewNegativeCount(int entNo) {
		return enterpriseMapper.entInterviewNegativeCount(entNo);
	}

	@Override
	public int entInterviewPassCount(int entNo) {
		return enterpriseMapper.entInterviewPassCount(entNo);
	}

	@Override
	public int entInterviewWaitingCount(int entNo) {
		return enterpriseMapper.entInterviewWaitingCount(entNo);
	}

	@Override
	public int entInterviewNotPassCount(int entNo) {
		return enterpriseMapper.entInterviewNotPassCount(entNo);
	}

	@Override
	public int entInterviewOnlineCount(int entNo) {
		return enterpriseMapper.entInterviewOnlineCount(entNo);
	}

	@Override
	public int entInterviewFriendCount(int entNo) {
		return enterpriseMapper.entInterviewFriendCount(entNo);
	}

	@Override
	public int entInterviewHeadHunterCount(int entNo) {
		return enterpriseMapper.entInterviewHeadHunterCount(entNo);
	}

	@Override
	public int entInterviewPublicCount(int entNo) {
		return enterpriseMapper.entInterviewPublicCount(entNo);
	}

	@Override
	public int entInterviewSchoolCount(int entNo) {
		return enterpriseMapper.entInterviewSchoolCount(entNo);
	}

	@Override
	public int entInterviewEtcCount(int entNo) {
		return enterpriseMapper.entInterviewEtcCount(entNo);
	}

	@Override
	public int entScrRcmdYCount(int entNo) {
		return enterpriseMapper.entScrRcmdYCount(entNo);
	}

	@Override
	public int entScrRcmdNCount(int entNo) {
		return enterpriseMapper.entScrRcmdNCount(entNo);
	}

	@Override
	public int entScrCeoGoodCount(int entNo) {
		return enterpriseMapper.entScrCeoGoodCount(entNo);
	}

	@Override
	public int entScrCeoBadCount(int entNo) {
		return enterpriseMapper.entScrCeoBadCount(entNo);
	}

	@Override
	public int entScrFutureYCount(int entNo) {
		return enterpriseMapper.entScrFutureYCount(entNo);
	}

	@Override
	public int entScrFutureNCount(int entNo) {
		return enterpriseMapper.entScrFutureNCount(entNo);
	}

	@Override
	public RecruitStatsVO entRecruitCount(int entNo) {
		
		return enterpriseMapper.entRecruitCount(entNo);
	}

	@Override
	public List<RecruitVO> recruitMiniList(RecruitPaginationVO<RecruitVO> recruitPagingVO) {
		return enterpriseMapper.recruitMiniList(recruitPagingVO);
	}

	@Override
	public int recruitTotalCount(int entNo) {
		return enterpriseMapper.recruitTotalCount(entNo);
	}

	@Override
	public List<RecruitVO> recruitList(RecruitListPaginationVO<RecruitVO> recruitListPagingVO) {

		
		return enterpriseMapper.recruitList(recruitListPagingVO);
	}

	@Override
	public ServiceResult likeRecruit(String accountId, String recruitNo, String pstnNm) {

		ServiceResult result = null;
		
		int status = enterpriseMapper.likeRecruit(accountId,recruitNo,pstnNm);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult disLikeRecruit(String accountId, String recruitNo, String pstnNm) {

		ServiceResult result = null;
		
		int status = enterpriseMapper.disLikeRecruit(accountId,recruitNo,pstnNm);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<EnterpriseVO> logodisplay(int entNo) {
		return enterpriseMapper.logodisplay(entNo);
	}

	@Override
	public ServiceResult entScrLike(int entScrNo) {

		ServiceResult result = null;
		
		int status = enterpriseMapper.entScrLike(entScrNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult entRvwLike(int entRvwNo) {

		ServiceResult result = null;
		
		int status = enterpriseMapper.entRvwLike(entRvwNo);

		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int entRecruitMiniCount(int entNo) {
		return enterpriseMapper.entRecruitMiniCount(entNo);
	}


	
}
