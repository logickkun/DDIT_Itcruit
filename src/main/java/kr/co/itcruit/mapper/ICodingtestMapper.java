package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.CodepowerVO;
import kr.co.itcruit.vo.CodingtestBoardVO;
import kr.co.itcruit.vo.CodingtestVO;

public interface ICodingtestMapper {

	public List<CodingtestVO> selectList(CodingtestVO codeVO);

	public CodingtestVO selectQstnByNo(int qstnNo);

	public CodingtestVO doTest(CodingtestVO codingtestVO);

	public CodingtestVO doSubmit(CodingtestVO codingtestVO);

	public List<String> getGrdList();

	public List<String> getSubjectList();

	public List<String> getCtgryList();

	public AccountVO getNickAndScore(String accountId);

	public List<CodepowerVO> getCodePower(String accountId);

	public List<CodingtestBoardVO> getCodeBoardByQstnNo(int qstnNo);

	public String checkSolveByVO(CodingtestVO vo);

	public void updateSolveByVO(CodingtestVO vo);

	public void insertSolve(CodingtestVO vo);

	public void updateCode(CodingtestVO vo);

	public void getScore(CodingtestVO vo);

	public CodingtestVO getInfo(int qstnNo);

	public List<CodingtestVO> entSelectList(CodingtestVO codeVO);

	public CodingtestVO getTestDetail(int qstnNo);

	
}
