package kr.co.itcruit.board.comment.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.comment.service.IBoardCommentService;
import kr.co.itcruit.mapper.IFreeBoardMapper;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;

@Service
public class BoardCommentServiceImpl implements IBoardCommentService{

	@Inject
	private IFreeBoardMapper freeBoardMapper;
	
	@Override
	public void insertComment(BoardCommentVO boardCommentVO) {
		freeBoardMapper.insertComment(boardCommentVO);
	}

	@Override
	public ServiceResult deleteComment(BoardCommentVO boardCommentVO) {
		ServiceResult result = null;
		
		int status = freeBoardMapper.deleteComment(boardCommentVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateComment(BoardCommentVO boardCommentVO) {
		ServiceResult result = null;
		int status = freeBoardMapper.updateComment(boardCommentVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public void inquiryAnswerUpdate(BoardVO boardVO, BoardCommentVO boardCommentVO) {
		freeBoardMapper.inquiryAnswerUpdate(boardVO, boardCommentVO);
	}

//	@Override
//	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO) {
//		return freeBoardMapper.commentList(boardCommentVO);
//	}

	
}
