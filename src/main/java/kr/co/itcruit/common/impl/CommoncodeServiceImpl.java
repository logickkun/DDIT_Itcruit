package kr.co.itcruit.common.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcruit.common.CommoncodeService;
import kr.co.itcruit.mapper.CommoncodeMapper;
import kr.co.itcruit.vo.CommoncodeVO;

@Service
public class CommoncodeServiceImpl implements CommoncodeService{
	
	@Autowired
	private CommoncodeMapper ccMapper;

	@Override
	public List<CommoncodeVO> commoncodeList(String cmmncode, String pstnCmmncdNm) {
		
		List<CommoncodeVO> esntlLangList = ccMapper.commoncodeList(cmmncode, pstnCmmncdNm);
		
		return esntlLangList;
	}

}
