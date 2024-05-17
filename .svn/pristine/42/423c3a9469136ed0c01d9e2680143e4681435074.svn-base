package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MidPaginationVO;

public interface IEnterpriseBoardMapper {

	// ? 목록
//	BoardVO list(int entNo);
	
	// 목록
	EnterpriseVO selectEnt(int entNo);
	
	int selectEntBoardCount(MidPaginationVO<BoardVO> pagingVO);

	List<BoardVO> selectEntBoardList(MidPaginationVO<BoardVO> pagingVO);

	List<BoardVO> selectEntFreeBoardList(MidPaginationVO<BoardVO> pagingVO);
	
	// 등록
	int insert(BoardVO boardVO);

	void insertFile(AtchVO atchVO);

	// 조회수 증사
	void incrementHit(BoardVO bvo);

	// 상세 보기
	BoardVO detail(BoardVO bvo);

	// 수정
	int update(BoardVO boardVO);

	// 파일
	AtchVO selectBoardFile(Integer integer);

	// 수정 폼에서 파일 삭제
	void deleteBoardFileList(Integer integer);

	
	// 삭제
	void deleteBoardFile(BoardVO bvo);

	int delete(BoardVO bvo);

	


}
