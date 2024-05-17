package kr.co.itcruit.mypage.member.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.mapper.IMyMemberMapper;
import kr.co.itcruit.mypage.member.service.IMemberService;
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
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	private IMyMemberMapper myMemberMapper;

	@Override
	public List<ResumeVO> selectResume(ResumeVO resumeVO) {
		return myMemberMapper.selectResume(resumeVO);
	}

	@Override
	public int selectResumeCount(MemberPageResumePaginationInfoVO<ResumeVO> rsmManagePagingVO) {
		return myMemberMapper.selectResumeCount(rsmManagePagingVO);
	}

	@Override
	public List<ResumeVO> selectResumeList(MemberPageResumePaginationInfoVO<ResumeVO> rsmManagePagingVO) {
		return myMemberMapper.selectResumeList(rsmManagePagingVO);
	}

	@Override
	public int likeEntCount(RecruitPaginationVO<EnterpriseVO> likeEntPagingVO) {
		return myMemberMapper.likeEntCount(likeEntPagingVO);
	}

	@Override
	public List<EnterpriseVO> likeEntList(RecruitPaginationVO<EnterpriseVO> likeEntPagingVO) {
		return myMemberMapper.likeEntList(likeEntPagingVO);
	}

	@Override
	public ServiceResult deleteEnt(String accountId , String entNo) {

		ServiceResult result = null;
		
		int status = myMemberMapper.deleteEnt(accountId , entNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int selectCount(MidPaginationVO<BoardVO> pagingVO) {
		return myMemberMapper.selectCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(MidPaginationVO<BoardVO> pagingVO) {
		return myMemberMapper.selectBoardList(pagingVO);
	}

	@Override
	public String getMyScheduleById(String accountId) {
		
//		String scheduleJson = "";
//		String strtJson = "";
//		String entJson = "";
		
		String allScheduleJson = "";
		
		List<MyScheduleVO> schedulList = myMemberMapper.getMyScheduleById(accountId);
		List<CalendarVO> recruitStrtLikeList = myMemberMapper.getRecruitLikeStrtListById(accountId);
		List<CalendarVO> recruitEndLikeList = myMemberMapper.getRecruitLikeEndListById(accountId);
	
		
		for (CalendarVO rv : recruitStrtLikeList) {
			rv.setTitle("(시)"+rv.getTitle());
//			rv.setColor("#fff");
			rv.setColor("#CC77FF");
		}

		for (CalendarVO rv : recruitEndLikeList) {
			rv.setTitle("(끝)"+rv.getTitle());
//			rv.setColor("#fff");
			rv.setColor("#808080");
		}
		
			
		List<Object> combinedList = new ArrayList<>(); // 세 리스트를 합칠 리스트 생성
	    combinedList.addAll(schedulList); // 첫 번째 리스트 추가
	    combinedList.addAll(recruitStrtLikeList); // 두 번째 리스트 추가
	    combinedList.addAll(recruitEndLikeList); // 세 번째 리스트 추가
		
		ObjectMapper objectMapper = new ObjectMapper();
	    ArrayNode jsonArray = objectMapper.createArrayNode();
	    
		try {
			allScheduleJson = objectMapper.writeValueAsString(combinedList);				        
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		log.info("MymemberImpl.getMyScheduleById>>>>" + allScheduleJson);
		
		return allScheduleJson;
	}

	@Override
	public void addScheduleByVO(AddScheduleVO scheduleVO) {
		myMemberMapper.addScheduleByVO(scheduleVO);
	}

	@Override
	public List<RecruitVO> likeEntRecruit(int entNo) {
		return myMemberMapper.likeEntRecruit(entNo);
	}

	@Override
	public void deleteSchedule(Map<String, Object> deleteData) {

//		myMemberMapper.
		if((boolean) deleteData.get("flag")) {
			//참이면 내 스케줄 삭제
			AddScheduleVO scheduleVO = new AddScheduleVO();
			int skedNo = Integer.parseInt((String)deleteData.get("skedNo"));
			scheduleVO.setSkedNo(skedNo);
			scheduleVO.setAccountId((String) deleteData.get("accountId"));
			myMemberMapper.deleteMySchedule(scheduleVO);
		} else {
			//거짓이면 즐찾채용 삭제 -> 이거 이미 있지않나?
			RecruitVO recruitVO = new RecruitVO();
			recruitVO.setAccountId((String) deleteData.get("accountId"));
			recruitVO.setRecruitNo((String) deleteData.get("recruitNo"));
			myMemberMapper.deleteLikeRecruit(recruitVO);
		}
	}

	@Override
	public void updateSchedule(AddScheduleVO addScheduleVO) {
		myMemberMapper.updateSchedule(addScheduleVO);
	}


	


}
