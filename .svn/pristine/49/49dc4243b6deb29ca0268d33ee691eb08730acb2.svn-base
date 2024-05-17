package kr.co.itcruit.main.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.itcruit.main.service.IRecruitListService;
import kr.co.itcruit.mapper.IRecruitMapper;
import kr.co.itcruit.vo.CalInfoListVO;
import kr.co.itcruit.vo.CalendarVO;
import kr.co.itcruit.vo.RecruitCardVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RecruitListServiceImpl implements IRecruitListService {

	@Inject
	private IRecruitMapper recruitMapper;

	// 이곳은 (일반회원이) 채용정보를 조회하는 곳
	@Override
	public String getRecruitList(RecruitVO recruitVO) {
//		color: '#808080',
//      color: '#CC77FF',

		String recruitJson = "";

		List<CalendarVO> recruitList = new ArrayList<>();

		// 시간 설정
//		LocalDate now = LocalDate.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
//        String time = now.format(formatter);
//        time = time+"%";

		List<CalendarVO> startList = recruitMapper.getRecruitStartList(recruitVO);
		List<CalendarVO> endList = recruitMapper.getRecruitEndList(recruitVO);

		for (CalendarVO rv : startList) {
			rv.setTitle("(시)"+rv.getTitle());
//			rv.setColor("#fff");
			rv.setColor("#CC77FF");
		}

		for (CalendarVO rv : endList) {
			rv.setTitle("(끝)"+rv.getTitle());
//			rv.setColor("#fff");
			rv.setColor("#808080");
		}

		recruitList.addAll(startList);
		recruitList.addAll(endList);

		ObjectMapper objectMapper = new ObjectMapper();
		try {
			recruitJson = objectMapper.writeValueAsString(recruitList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return recruitJson;
	}

	@Override
	public List<RecruitVO> selectListByRecruitNo(String recruitNo) {
		// TODO Auto-generated method stub
		return recruitMapper.selectListByRecruitNo(recruitNo);
	}

	@Override
	public CalInfoListVO getCalInfo() {
		// TODO Auto-generated method stub
		CalInfoListVO cvo = new CalInfoListVO();
		cvo.setPstnCmmncdNm(recruitMapper.getPstnList());
		cvo.setLang(recruitMapper.getLangList());
		cvo.setCmmncdGrpCd(recruitMapper.getGrpList());

		log.info(">>>>>>>>>>\n" + cvo);

		return cvo;
	}

	// cmmncdGrpCd
	@Override
	public List<String> getSpecLocalList(String cmmncdGrpCd) {
		return recruitMapper.getSpecLocalList(cmmncdGrpCd);
	}

	@Override
	public RecruitCardVO getRecruitCard(RecruitCardVO rCardVO) {
		
		return recruitMapper.getRecruitCard(rCardVO);
	}

}
