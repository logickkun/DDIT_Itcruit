package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MiniPaginationVO;

public interface IBoardMapper {

	public int entBoardCount(MiniPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> entBoardList(MiniPaginationVO<BoardVO> pagingVO);

	public int entBBS201Count(MiniPaginationVO<BoardVO> pagingVO);

	public List<BoardVO> entBBS201List(MiniPaginationVO<BoardVO> pagingVO);

	public BoardVO selectEnterpriseNotice(int entNo);

	public BoardVO selectEnterpriseFree(int entNo);

	public int selectEntNoticeComment(String noticeBbsNo);

	public int selectEntFreeComment(String freeBbsNo);
	
}
