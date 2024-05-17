package kr.co.itcruit.mypage.enterprise.service.impl;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.mapper.ISearchTalentMapper;
import kr.co.itcruit.mypage.enterprise.service.ISearchTalentService;
import kr.co.itcruit.vo.SearchTalentVO;

@Service
public class SearchTalentServiceImpl implements ISearchTalentService{

	@Inject
	private ISearchTalentMapper searchTalentMapper;
	
	@Override
	public SearchTalentVO getOptionInfo() {
		SearchTalentVO svo = new SearchTalentVO();
		svo.setLangList(searchTalentMapper.getLangList());
		svo.setPstnList(searchTalentMapper.getPstnList());
		svo.setLocalList(searchTalentMapper.getLocalList());
		return svo;
	}

	@Override
	public List<SearchTalentVO> getTalentList(SearchTalentVO searchTalentVO) {
		// TODO Auto-generated method stub
		return searchTalentMapper.getTalentList(searchTalentVO);
	}

}
