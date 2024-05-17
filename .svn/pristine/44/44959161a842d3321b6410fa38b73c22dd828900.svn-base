package kr.co.itcruit.mypage.enterprise.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.atch.service.IAtchFileService;
import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.EsntlLangVO;
import kr.co.itcruit.vo.HireSttsVO;
import kr.co.itcruit.vo.PreferLangVO;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("myPage/enterprise")
@Slf4j
public class EnterpriseModifyController {
		
	@Autowired
	private IMyEnterpriseService myEntService;
	
	@Autowired
	private IAtchFileService atchFileService;
	
	@RequestMapping(value = "/recruitEdit", method = RequestMethod.GET)
	public String recruitUpdateForm(@RequestParam("recruitNo") String recruitNo,@RequestParam("pstnCmmncdNm")String pstnCmmncdNm, Model model) {
		
		List<RecruitVO> recruitInfoVO = myEntService.recruitSelectInfo(recruitNo, pstnCmmncdNm);
		Map<String, String> esntlMap = new HashMap<String, String>(); 
		Map<String, String> hireMap = new HashMap<String, String>(); 
		Map<String, String> preferMap = new HashMap<String, String>();
		
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
		
		String orgnCmmncd = "채용공고";
		AtchFileVO atchFileVO = atchFileService.getFileInfo(recruitNo, orgnCmmncd);
		
		model.addAttribute("atchFileVO", atchFileVO);
		model.addAttribute("recruitVO", recruitInfoVO);
		model.addAttribute("esntlMap", esntlMap);
		model.addAttribute("hireMap", hireMap);
		model.addAttribute("preferMap", preferMap);
		model.addAttribute("status", "edit");
		
		String[] pstnCmmncdNms = new String[0];
		Gson gson = new Gson();
		String json = gson.toJson(pstnCmmncdNms);
		
		model.addAttribute("pstnCmmncdNms", json);
		
		List<Map<String, String>> preferCmmncdNms = myEntService.getPreferCmmncdNm();
		log.info("####### preferCmmncdNms : " + preferCmmncdNms);
		model.addAttribute("preferCmmncdNms", preferCmmncdNms);
		
		return "entmypage/recruitRegister";
	}
	
	
	@RequestMapping(value = "/recruitEdit", method = RequestMethod.POST)
	public String recruitUpdate(RecruitVO recruitVO, HttpServletRequest req) throws UnsupportedEncodingException {
		
		log.info("########################### rv : "+ recruitVO);
		
		String goPage = "";
		
		//업데이트 기능
		ServiceResult result = myEntService.recruitRegisterEdit(recruitVO, req);
		
		
		if(result.equals(ServiceResult.OK)) {
			
			String recruitNo = URLEncoder.encode(recruitVO.getRecruitNo(), StandardCharsets.UTF_8.toString());
            String pstnCmmncdNm = URLEncoder.encode(recruitVO.getPstnCmmncdNm(), StandardCharsets.UTF_8.toString());
			
			goPage = "redirect:/myPage/enterprise/recruitDetail?recruitNo="+recruitNo+"&pstnCmmncdNm="+pstnCmmncdNm;
			
			
		}else {
			
			goPage = "";
			
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/recruitDel", method = RequestMethod.GET)
	public String recruitDelete(@RequestParam("recruitNo") String recruitNo,@RequestParam("pstnCmmncdNm")String pstnCmmncdNm, HttpServletRequest req) {
		//applyProcessList
		log.info("########## recruitNo : " + recruitNo);
		log.info("########## pstnCmmncdNm : " + pstnCmmncdNm);
		
		RecruitVO recruitVO = new RecruitVO();
		recruitVO.setRecruitNo(recruitNo);
		recruitVO.setPstnCmmncdNm(pstnCmmncdNm);
		
		String goPage = "";
		
		ServiceResult result = myEntService.recruitRegisterRemove(recruitVO, req);
		
		if(result.equals(ServiceResult.OK)) {
			
			goPage =  "redirect:/myPage/enterprise/recruitProcessQuestion";
			
		}else {
			
			goPage = "";
			
		}
		
		return goPage;
	}

}
