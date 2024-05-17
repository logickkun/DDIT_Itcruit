package kr.co.itcruit.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MidPaginationVO;

@Service
public interface IEnterpriseFreeBoardService {

//	BoardVO list(int entNo);
	
	EnterpriseVO selectEnt(int entNo);
	
	int selectEntBoardCount(MidPaginationVO<BoardVO> pagingVO);

	List<BoardVO> selectEntBoardList(MidPaginationVO<BoardVO> pagingVO);

	List<BoardVO> selectEntFreeBoardList(MidPaginationVO<BoardVO> pagingVO);
	
	ServiceResult insert(HttpServletRequest req, BoardVO boardVO);

	BoardVO detail(BoardVO bvo);

	ServiceResult update(HttpServletRequest req, BoardVO boardVO);

	ServiceResult delete(HttpServletRequest req, BoardVO bvo);







	
	
}
