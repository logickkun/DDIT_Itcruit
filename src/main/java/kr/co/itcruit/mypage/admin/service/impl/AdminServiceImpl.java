package kr.co.itcruit.mypage.admin.service.impl;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.mapper.IAdminMapper;
import kr.co.itcruit.mapper.IEnterpriseMapper;
import kr.co.itcruit.mapper.IFreeBoardMapper;
import kr.co.itcruit.mypage.admin.service.IAdminService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EntSttsPaginationVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MidPaginationVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements IAdminService {

	
	@Inject
	private IFreeBoardMapper freeBoardMapper;
	
	@Inject
	private IAdminMapper adminMapper;
	
	
	
	@Override
	public ServiceResult faqInsert(BoardVO boardVO) {
		ServiceResult result = null;
		
		int status = freeBoardMapper.insert(boardVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<BoardVO> selectFreeBoardList(MidPaginationVO<BoardVO> pagingVO) {
		log.info("" + pagingVO);
		log.info(freeBoardMapper.selectFreeBoardList(pagingVO).toString());
		return freeBoardMapper.selectFreeBoardList(pagingVO);
	}

	@Override
	public List<AtchVO> entSttsList(EntSttsPaginationVO<AtchVO> atchPagingVO) {

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 서비스");
		
		List<AtchVO> list = adminMapper.entSttsList(atchPagingVO);
		
		return list;
		
	}

	@Override
	public ServiceResult entApproval(AccountVO av) {
		
		ServiceResult result = null;
		int status = 0;
		
		if(av.getAccountIds() != null && !av.getAccountIds().isEmpty()  ) {
			for (int i = 0; i < av.getAccountIds().size(); i++) {
				av.setAccountId(av.getAccountIds().get(i));
				status = adminMapper.entApproval(av);
			}
		}else if(!av.getAccountId().isEmpty()) {
			status = adminMapper.entApproval(av);
		}
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		
		return result;
	}

	@Override
	public int reportCount() {

		return adminMapper.reportCount();
	}

	@Override
	public List<BoardReportVO> reportList(RecruitPaginationVO<BoardReportVO> reportPagingVO) {
		return adminMapper.reportList(reportPagingVO);
	}

	@Override
	public ServiceResult handlingYn(BoardReportVO brVO) {
		
		ServiceResult result = null;
		
		int status = adminMapper.handlingYn(brVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult stopAccount(AccountVO av) {

		ServiceResult result = null;
		
		int status = adminMapper.stopAccount(av);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int entSttsCount() {

		return adminMapper.entSttsCount();
	}


	@Override
	public int selectEntCount(PaginationInfoVO<EnterpriseVO> pagingVO) {
		return adminMapper.selectEntCount(pagingVO);
//		return 0;
	}

	@Override
	public List<EnterpriseVO> selectEntList(PaginationInfoVO<EnterpriseVO> pagingVO) {
		return adminMapper.selectEntList(pagingVO);
//		return null;
	}

	@Override
	public List<RecruitVO> mainChart(RecruitVO recruitVO) {
		return adminMapper.mainChart(recruitVO);

	}

	@Override
	public int accountNum(AccountVO accountVO) {
		return adminMapper.accountNum();
		
	}

	@Override
	public int entNum(EnterpriseVO enterpriseVO) {
		return adminMapper.entNum(enterpriseVO);
	}

	@Override
	public int monthNum(AccountVO accountVO) {
		return adminMapper.monthNum(accountVO);
	}

	@Override
	public List<RecruitVO> horizontalChartChart(RecruitVO recruitVO) {
		return adminMapper.horizontalChartChart(recruitVO);
	}

	@Override
	public List<RecruitVO> pieChart(RecruitVO recruitVO) {
		return adminMapper.pieChart(recruitVO);
	}


}
