package kr.co.itcruit.mypage.member.service;

import java.util.List;
import java.util.Map;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AddScheduleVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MemberPageResumePaginationInfoVO;
import kr.co.itcruit.vo.MidPaginationVO;
import kr.co.itcruit.vo.MyScheduleVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;

public interface IMemberService {

	public List<ResumeVO> selectResume(ResumeVO resumeVO);

	public int selectResumeCount(MemberPageResumePaginationInfoVO<ResumeVO> rsmManagePagingVO);

	public List<ResumeVO> selectResumeList(MemberPageResumePaginationInfoVO<ResumeVO> rsmManagePagingVO);

	public int likeEntCount(RecruitPaginationVO<EnterpriseVO> likeEntPagingVO);

	public List<EnterpriseVO> likeEntList(RecruitPaginationVO<EnterpriseVO> likeEntPagingVO);

	public ServiceResult deleteEnt(String accountId, String entNo);

	public int selectCount(MidPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(MidPaginationVO<BoardVO> pagingVO);

	public String getMyScheduleById(String accountId);

	public void addScheduleByVO(AddScheduleVO addScheduleVO);

	public List<RecruitVO> likeEntRecruit(int entNo);

	public void deleteSchedule(Map<String, Object> deleteData);

	public void updateSchedule(AddScheduleVO addScheduleVO);


}
