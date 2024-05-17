package kr.co.itcruit.board.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.board.service.IEnterpriseNoticeBoardService;
import kr.co.itcruit.mapper.IBoardMapper;
import kr.co.itcruit.vo.BoardVO;


@Service
public class EnterpriseNoticeBoardImpl implements IEnterpriseNoticeBoardService{

	@Inject
	private IBoardMapper boardMapper;
	
	@Override
	public BoardVO selectEnterpriseNotice(int entNo) {
		return boardMapper.selectEnterpriseNotice(entNo);
	}

	@Override
	public BoardVO selectEnterpriseFree(int entNo) {
		return boardMapper.selectEnterpriseFree(entNo);
	}

	@Override
	public int selectEntNoticeComment(String noticeBbsNo) {
		return boardMapper.selectEntNoticeComment(noticeBbsNo);
	}

	@Override
	public int selectEntFreeComment(String freeBbsNo) {
		return boardMapper.selectEntFreeComment(freeBbsNo);
	}




}
