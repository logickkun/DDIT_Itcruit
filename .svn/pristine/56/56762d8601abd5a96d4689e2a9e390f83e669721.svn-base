package kr.co.itcruit.mapper;

import java.util.List;


import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MidPaginationVO;


public interface IFreeBoardMapper {

	public List<BoardVO> list();

	// 글 등록
	public int insert(BoardVO boardVO);
	
	public void insertFile(AtchVO atchVO);

	// 게시글 조회수 증가
	public void incrementHit(BoardVO bvo);

	// 상세정보
	public BoardVO detail(BoardVO bvo);

	// 수정
	public int update(BoardVO boardVO);

	// 목록
	public int selectFreeBoardCount(MidPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> selectFreeBoardList(MidPaginationVO<BoardVO> pagingVO);

	public AtchVO selectBoardFile(Integer integer);


	// 수정 시 파일 삭제
	public void deleteBoardFileList(Integer integer);

	
	
	// 삭제
	public void deleteBoardFile(BoardVO bvo);

	public int delete(BoardVO bvo);
	
	// 다운
	public AtchVO download(int fileNo);

	
	
	
	// 인기
	public List<BoardVO> bestList();

	
	
	// 댓글
	public void insertComment(BoardCommentVO boardCommentVO);
	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO);
	public int deleteComment(BoardCommentVO boardCommentVO);
	public int updateComment(BoardCommentVO boardCommentVO);

	
	//관리자 문의 답변상태 업데이트
	public void inquiryAnswerUpdate(BoardVO boardVO, BoardCommentVO boardCommentVO);

	
	// 신고 등록
	public int insertReport(BoardReportVO boardReportVO);

	
	// 관리자 자유게시판 신고 목록 
	public List<BoardReportVO> adminfreeBoardReport(MidPaginationVO<BoardReportVO> pagingVO);
	// 관리자 자유게시판 신고 댓글 목록 
	public List<BoardReportVO> adminfreeBoardCommentReport(MidPaginationVO<BoardReportVO> pagingVO);
	
	// 관리자 신고 처리시 게시글 '삭제'로 만듬
	public void updatereportBbsNo(BoardReportVO boardReportVO);

	// 관리자 신고 처리시 댓글 번호 0 으로 만듬
	public void updatereportcmmtNo(BoardReportVO boardReportVO);

	// 관리자 신고 처리시 댓글 삭제
	public int adminDeleteComment(BoardReportVO boardReportVO);

	
	// 관리자 신고  - 게시글 목록 갯수 
	public int selectFreeBoardReportCount(MidPaginationVO<BoardReportVO> pagingVO);

	// 관리자 신고  - 게시글 댓글 갯수 
	public int selectFreeBoardCommentReportCount(MidPaginationVO<BoardReportVO> pagingVO);


	
	


	

}
