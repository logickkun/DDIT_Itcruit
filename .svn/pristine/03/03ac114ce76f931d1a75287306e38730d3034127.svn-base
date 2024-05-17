package kr.co.itcruit.atch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcruit.atch.service.IAtchFileService;
import kr.co.itcruit.mapper.IAtchFileMapper;
import kr.co.itcruit.vo.AtchFileVO;

@Service
public class AtchFileServiceImpl implements IAtchFileService {
	
	@Autowired
	private IAtchFileMapper atchFileMapper;

	@Override
	public AtchFileVO getFileInfo(String fileSrcNo, String orgnCmmncd) {
		
		AtchFileVO afv = atchFileMapper.getFileInfo(fileSrcNo, orgnCmmncd);
		
		return afv;
	}
	
	@Override
	public AtchFileVO selectFile(String fileSrcNo, String orgnCmmncd) {
		return atchFileMapper.selectFile(fileSrcNo, orgnCmmncd);
	}
	
}
