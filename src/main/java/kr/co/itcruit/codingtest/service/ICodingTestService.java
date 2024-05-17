package kr.co.itcruit.codingtest.service;

import java.util.List;

import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.CodingtestBoardVO;
import kr.co.itcruit.vo.CodingtestVO;
import kr.co.itcruit.vo.EachProcessApplyPassVO;
import kr.co.itcruit.vo.EntCodingtestVO;

public interface ICodingTestService {

	public List<CodingtestVO> selectList(CodingtestVO codeVO);

	/**
	 * 문제 번호로 상세페이지 가져오기
	 * @param qstnNo
	 * @return
	 */
	public CodingtestVO getQstnByNo(int qstnNo);

	public String doCompile(CodingtestVO codingtestVO);

	public CodingtestVO getOptionInfo();

	public AccountVO getMyCodePower(String accountId);

	public List<CodingtestBoardVO> getCodeBoardByQstnNo(int qstnNo);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public EntCodingtestVO getEntCodingtestByNo(int entCodingtestNo);

	public String checkNormalTester(EachProcessApplyPassVO eapVO);

	public void submitEntCodingtest(EntCodingtestVO entCodingtestVO);

	
	
	
	
	
	
	
	public CodingtestVO getInfo(int qstnNo);

	public List<CodingtestVO> entSelectList(CodingtestVO codeVO);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public CodingtestVO getTestDetail(int qstnNo);

}