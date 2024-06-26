package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.EntSttsPaginationVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitVO;

public interface IAdminMapper {

	public List<AtchVO> entSttsList(EntSttsPaginationVO<AtchVO> atchPagingVO);

	public int entApproval(AccountVO av);

	public int reportCount();

	public List<BoardReportVO> reportList(RecruitPaginationVO<BoardReportVO> reportPagingVO);

	public int handlingYn(BoardReportVO brVO);

	public int stopAccount(AccountVO av);

	public int entSttsCount();

	public int selectEntCount(PaginationInfoVO<EnterpriseVO> pagingVO);

	public List<EnterpriseVO> selectEntList(PaginationInfoVO<EnterpriseVO> pagingVO);

	public List<RecruitVO> mainChart(RecruitVO recruitVO);

	public int accountNum();

	public int entNum(EnterpriseVO enterpriseVO);

	public int monthNum(AccountVO accountVO);

	public List<RecruitVO> horizontalChartChart(RecruitVO recruitVO);

	public List<RecruitVO> pieChart(RecruitVO recruitVO);

}
