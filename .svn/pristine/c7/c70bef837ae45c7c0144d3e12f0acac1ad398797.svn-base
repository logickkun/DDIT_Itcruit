package kr.co.itcruit.main.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.itcruit.main.service.IRecruitListService;
import kr.co.itcruit.vo.CalInfoListVO;
import kr.co.itcruit.vo.CalendarVO;
import kr.co.itcruit.vo.RecruitCardVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitListController {
	
	@Inject
	private IRecruitListService recruitService;

//	@Inject
//	private IEnterpriseInfoService entInfoService;
//	좌측에 확인한 공고 목록 따라다니게
//	2~3개 기업 비교해주는 페이지로 이동

	/**
	 * 전체 채용리스트 달력 초기화
	 * @param model
	 * @return 
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String recruitList(
			Model model
			) {
		
//		RecruitVO rvo = new RecruitVO();
		
		//직무, 언어, 지역만 가져오기
		//지역 상세는 ajax로 그리기
		//private List<String> esntlLangCmmncdNms;
		//private List<String> preferLangCmmncdNms;	
		
		CalInfoListVO calInfoVO = new CalInfoListVO();
		
		calInfoVO = recruitService.getCalInfo();
		
		
		log.info(">>>>>>>>>>\n" + calInfoVO);
		
		model.addAttribute("calInfoVO", calInfoVO);
		
		return "main/recruit";
	
	}
	
	
	/**
	 * 달력을 새로 그리기 위한 컨트롤러
	 * @param date
	 * @return
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> recruitListChange(
			@RequestBody RecruitVO recruitVO
		) {
		
 		log.info("시간: >>>>>>>>>>>>>>>>>>" + recruitVO.getTime());
		log.info("검색어: >>>>>>>>>>>>>>>>>>" + recruitVO.getEntNm());
		log.info("직무: >>>>>>>>>>>>>>>>>>" + recruitVO.getPstnCmmncdNm());
		log.info("언어: >>>>>>>>>>>>>>>>>>" + recruitVO.getLang());
		log.info("지역: >>>>>>>>>>>>>>>>>>" + recruitVO.getCmmncdGrpCd());
		log.info(">>>>>>>>>>>>>>>>>>" + recruitVO.getCmmncdNm1());
		
		log.info(">>>>>>>>>>>>>>>>>>" + recruitVO);
		
		String recruitJson = recruitService.getRecruitList(recruitVO);
		
		
		log.info(">>>>>>>>>>>>>>>" + recruitJson);
		return new ResponseEntity<String>(recruitJson, HttpStatus.OK);
	}

	
	
	@RequestMapping(value="/getModal.do", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<RecruitVO>> modal(
			@RequestBody  Map<String, Object> dataMap
			) {
		
		log.info("modal >>>>>>>>>>>>>>>>>>>>>>>>>오긴 하나>??????????????" + dataMap);
		
		String recruitNo = (String) dataMap.get("recruitNo");
		
		List<RecruitVO> result = recruitService.selectListByRecruitNo(recruitNo);
				
		log.info(">>>>>>>>>>>>" + result);
        return new ResponseEntity<List<RecruitVO>>(result, HttpStatus.OK);
    }
	
	///recruit/locallist.do
	@RequestMapping(value="locallist.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<String>> specLocalList(
			@RequestBody  Map<String, Object> dataMap
			) {
		
		log.info("specLocalList >>>>>>>>>>>>>>>>>>>>>>>>>오긴 하나>??????????????" + dataMap);
		String cmmncdGrpCd = (String) dataMap.get("cmmncdGrpNm");
		
		List<String> result = recruitService.getSpecLocalList(cmmncdGrpCd);
				
        return new ResponseEntity<List<String>>(result, HttpStatus.OK);
    }
	
	
	// /recruit/logoutUserCart.do
	@RequestMapping(value = "/logoutUserCart.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public ResponseEntity<RecruitCardVO> getCardLogoutUser(
			@RequestBody RecruitCardVO rCardVO) {
		
		log.info(">>>>>>>>>>>>>>>>> 왔나?>?" + rCardVO);
		
		//recruit_no와 ent_no 날려서
		rCardVO = recruitService.getRecruitCard(rCardVO);
		
		return new ResponseEntity<RecruitCardVO>(rCardVO, HttpStatus.OK);
	}
	
	
	
	
	
	
}
