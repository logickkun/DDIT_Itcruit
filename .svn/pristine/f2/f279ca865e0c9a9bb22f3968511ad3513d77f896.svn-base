package kr.co.itcruit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.itcruit.vo.AddScheduleVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CalendarVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MemberPageResumePaginationInfoVO;
import kr.co.itcruit.vo.MidPaginationVO;
import kr.co.itcruit.vo.MyScheduleVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;

public interface IMyMemberMapper {

	public List<ResumeVO> selectResume(ResumeVO resumeVO);

	public int selectResumeCount(MemberPageResumePaginationInfoVO<ResumeVO> rsmManagePagingVO);

	public List<ResumeVO> selectResumeList(MemberPageResumePaginationInfoVO<ResumeVO> rsmManagePagingVO);

	public int likeEntCount(RecruitPaginationVO<EnterpriseVO> likeEntPagingVO);

	public List<EnterpriseVO> likeEntList(RecruitPaginationVO<EnterpriseVO> likeEntPagingVO);

	public int deleteEnt(@Param("accountId") String accountId, @Param("entNo") String entNo);

	public int selectCount(MidPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(MidPaginationVO<BoardVO> pagingVO);

	public List<MyScheduleVO> getMyScheduleById(String accountId);

//	public List<CalendarVO> getRecruitLikeListById(String accountId);

	public List<CalendarVO> getRecruitLikeEndListById(String accountId);

	public List<CalendarVO> getRecruitLikeStrtListById(String accountId);

	public void addScheduleByVO(AddScheduleVO scheduleVO);

	public List<RecruitVO> likeEntRecruit(int entNo);

	public void deleteMySchedule(AddScheduleVO scheduleVO);

	public void deleteLikeRecruit(RecruitVO recruitVO);

	public void updateSchedule(AddScheduleVO addScheduleVO);


}
