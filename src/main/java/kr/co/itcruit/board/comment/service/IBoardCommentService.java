package kr.co.itcruit.board.comment.service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;

public interface IBoardCommentService {

	public void insertComment(BoardCommentVO boardCommentVO);

//	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO);

	public ServiceResult deleteComment(BoardCommentVO boardCommentVO);

	public ServiceResult updateComment(BoardCommentVO boardCommentVO);

	//관리자 문의 답변상태 업데이트
	public void inquiryAnswerUpdate(BoardVO boardVO, BoardCommentVO boardCommentVO);

}
