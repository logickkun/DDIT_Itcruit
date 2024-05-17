package kr.co.itcruit.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MidPaginationVO;

public interface IFreeBoardService {

//	public List<BoardVO> list();

	public ServiceResult insert(HttpServletRequest req, BoardVO boardVO);

	public BoardVO detail(BoardVO bvo);

	public ServiceResult update(HttpServletRequest req, BoardVO boardVO);

	public int selectFreeBoardCount(MidPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> selectFreeBoardList(MidPaginationVO<BoardVO> pagingVO);

	public ServiceResult delete(HttpServletRequest req, BoardVO bvo);

	public AtchVO download(int fileNo);

	public List<BoardVO> bestList();

	
	
	
	
	
	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO);

	
	public ServiceResult insertReport(BoardReportVO boardReportVO);

	
	public List<BoardReportVO> adminfreeBoardReport(MidPaginationVO<BoardReportVO> pagingVO);

	public List<BoardReportVO> adminfreeBoardCommentReport(MidPaginationVO<BoardReportVO> pagingVO);
	
	public ServiceResult adminFreeBoarddelete(HttpServletRequest req, BoardVO bvo, BoardReportVO boardReportVO);

	public ServiceResult adminFreeBoardCommentDelete(BoardReportVO boardReportVO);

	
	
	
	public int selectFreeBoardReportCount(MidPaginationVO<BoardReportVO> pagingVO);

	public int selectFreeBoardCommentReportCount(MidPaginationVO<BoardReportVO> pagingVO);






}
