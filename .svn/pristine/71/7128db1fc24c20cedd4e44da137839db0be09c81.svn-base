package kr.co.itcruit.board;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.Assert;
import kr.co.itcruit.mapper.IBoardMapper;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MiniPaginationVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
		"/kr/or/ddit/config/test-context.xml"
})
public class IBoardMapperJUnit {
	private static Logger log = LoggerFactory.getLogger(IBoardMapperJUnit.class);
	
	@Inject
	private IBoardMapper boardMapper;
	
	@Test
	public void testSelectBoardList() {
		
		MiniPaginationVO<BoardVO> pagingVO = new MiniPaginationVO<BoardVO>();
		pagingVO.setStartRow(0);
		pagingVO.setEndRow(10);
		
		List<BoardVO> list = boardMapper.entBoardList(pagingVO);
		
		Assert.assertTrue(list.size()>0);
		
		for(BoardVO boardVO:list) {
			log.info(boardVO.toString());
		}
	}
}
