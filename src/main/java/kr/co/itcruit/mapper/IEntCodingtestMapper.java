package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.EachProcessApplyPassVO;
import kr.co.itcruit.vo.EntCodingtestVO;

public interface IEntCodingtestMapper {

	public EntCodingtestVO getEntCodingtestByNo(int entCodingtestNo);

	public String checkNormalTester(EachProcessApplyPassVO eapVO);

	public void insertEntCodingtest(EntCodingtestVO entCodingtestVO);
	
	public void updateEntCodingtest(EntCodingtestVO entCodingtestVO);

	public int checkSubmitEntCodingtest(EntCodingtestVO entCodingtestVO);

}
