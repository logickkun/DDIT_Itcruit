package kr.co.itcruit.common;

import java.util.List;

import kr.co.itcruit.vo.CommoncodeVO;

public interface CommoncodeService {

	public List<CommoncodeVO> commoncodeList(String cmmncode, String pstnCmmncdNm);



}
