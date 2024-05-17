package kr.co.itcruit.mypage.enterprise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.vo.EsntlLangVO;
import kr.co.itcruit.vo.HireSttsVO;
import kr.co.itcruit.vo.PreferLangVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("myPage/enterprise")
@Slf4j
public class EnterpriseDetailController {
	
	
	@Autowired
	private IMyEnterpriseService myEntService;
	

	@RequestMapping(value ="/recruitDetail", method = RequestMethod.GET)
	public String recruitDetailForm(String recruitNo,String pstnCmmncdNm,Model model) {
		
//		log.info(recruitNo);
		
		List<RecruitVO> recruitInfoVO = myEntService.recruitSelectInfo(recruitNo, pstnCmmncdNm);
		Map<String, String> esntlMap = new HashMap<String, String>(); // 루프 밖에서 초기화
		Map<String, String> hireMap = new HashMap<String, String>(); // 루프 밖에서 초기화
		Map<String, String> preferMap = new HashMap<String, String>(); // 루프 밖에서 초기화
		
		for (RecruitVO rv : recruitInfoVO) {
			
			for(EsntlLangVO elVO : rv.getEsntlLangList()) {
				
				esntlMap.put(elVO.getEsntlLangCmmncdNm(), elVO.getEsntlLangCmmncdNm());
			}
			
			for(HireSttsVO hsVO : rv.getHireSttsList()) {
				
				hireMap.put(hsVO.getHireCmmndNm(), hsVO.getHireCmmndNm());
			}
			
			for(PreferLangVO plVO : rv.getPreferLangList()) {
				
				preferMap.put(plVO.getPreferLangCmmncdNm(), plVO.getPreferLangCmmncdNm());
			}
			
		}
		
		
		
//		log.info("######### recruitInfoVO : " + recruitInfoVO);
//		log.info("######### esntlMap : " + esntlMap);
//		log.info("######### hireMap : " + hireMap);
//		log.info("######### preferMap : " + preferMap);
		
	
		model.addAttribute("recruitVO", recruitInfoVO);
		model.addAttribute("esntlMap", esntlMap);
		model.addAttribute("hireMap", hireMap);
		model.addAttribute("preferMap", preferMap);
		
		return "entmypage/recruitProcessQuestionDetail";
	}


}
