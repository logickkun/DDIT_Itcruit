package kr.co.itcruit.main.service;

import java.util.List;

import kr.co.itcruit.vo.CalInfoListVO;
import kr.co.itcruit.vo.CalendarVO;
import kr.co.itcruit.vo.RecruitCardVO;
import kr.co.itcruit.vo.RecruitVO;

public interface IRecruitListService {

	public String getRecruitList(RecruitVO recruitVO);

	public List<RecruitVO> selectListByRecruitNo(String recruitNo);

	public CalInfoListVO getCalInfo();

	public List<String> getSpecLocalList(String cmmncdGrpCd);

	public RecruitCardVO getRecruitCard(RecruitCardVO rCardVO);

}
