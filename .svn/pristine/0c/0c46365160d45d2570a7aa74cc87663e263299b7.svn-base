package kr.co.itcruit.board;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//import kr.co.ddit.groupware.mapper.board.IBoardMapper;
//import kr.or.ddit.groupware.vo.BoardVO;
//import kr.or.ddit.groupware.vo.PaginationInfoVO;

import kr.co.itcruit.mapper.IBoardMapper;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MiniPaginationVO;


public class IBoardMapperTest {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] {"kr/co/itcruit/config/test-context.xml"});
		

		
		IBoardMapper iBoardMapper = (IBoardMapper) context.getBean("IBoardMapper");
		System.out.println(iBoardMapper);
		
		MiniPaginationVO<BoardVO> pagingVO = new MiniPaginationVO<BoardVO>();
		pagingVO.setStartRow(0);
		pagingVO.setEndRow(10);
		
		List<BoardVO> list = iBoardMapper.entBoardList(pagingVO);
		
		for(BoardVO boardVO:list) {
			System.out.println(boardVO);
		}
	}
}
