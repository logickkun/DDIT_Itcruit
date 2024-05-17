 package kr.co.itcruit.mypage.enterprise.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("myPage/enterprise")
@Slf4j
public class EnterpriseInsertController {
	
	@Autowired
	private IMyEnterpriseService myEntService;
	
	@RequestMapping(value = "/recruitInsertProcess", method = RequestMethod.POST)
	public String hireInsertProcess(RecruitVO recruitVO, HttpServletRequest req, Model model) throws UnsupportedEncodingException {
			
		log.info("########## recruitVO : " + recruitVO);
		
		String goPage = "";
		
		ServiceResult result = 	myEntService.recruitRegisterInsert(recruitVO, req);
		
		if(result.equals(ServiceResult.OK)) {
			
			String recruitNo = URLEncoder.encode(recruitVO.getRecruitNo(), StandardCharsets.UTF_8.toString());
            String pstnCmmncdNm = URLEncoder.encode(recruitVO.getPstnCmmncdNm(), StandardCharsets.UTF_8.toString());
            String recruitTtl = URLEncoder.encode(recruitVO.getRecruitTtl(), StandardCharsets.UTF_8.toString());
			
			goPage = "redirect:/myPage/enterprise/processDetail?recruitNo="+recruitNo+"&pstnCmmncdNm="+pstnCmmncdNm+"&recruitTtl="+recruitTtl;
			
			
		}else {
			
			goPage = "";
			
		}
		
		return goPage;
//		return null;
		
	}

	
	@RequestMapping(value = "/noticeInsert.do" , method = RequestMethod.POST)
	public String noticeInsert(
			HttpServletRequest req,
			BoardVO bv, Model model,
			RedirectAttributes ra
			) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(bv.getBbsTtl())) {
			errors.put("bbsTtl", "제목을 입력해주세요");
		}
		if(StringUtils.isBlank(bv.getBbsCn())) {
			errors.put("bbsCn", "내용을 입력해주세요");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("boardVO", bv);
			goPage = "myPage/enterprise/entNoticeForm.do";
		}else {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			AccountVO av = user.getAccount();
			
			if(av != null) {
				bv.setBbsWriter(av.getAccountNm());
				bv.setEntNo(av.getEntNo());
				ServiceResult result = myEntService.noticeInsert(req, bv );
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "공지사항 등록이 완료되었습니다");
					goPage = "redirect:/board/ent/detail.do?entNo="+bv.getEntNo()+"&bbsNo="+bv.getBbsNo();
				}else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요");
					goPage ="myPage/enterprise/entNoticeForm.do";
				}
			}else {
				ra.addFlashAttribute("message", "기업 로그인후 등록이 가능합니다");
				goPage = "redirect:/main/loginForm.do";
			}
		}
		return goPage;
	}
	
	@RequestMapping(value = "/signUp.do" , method = RequestMethod.POST)
	public String signUp(HttpServletRequest req, RedirectAttributes ra, Model model, @RequestParam("accountId") String memId , @RequestParam("accountPswd") String memPw, @RequestParam("accountNm") String memNm ) {
		
		String goPage = "";
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		

		
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(memId)) {
			errors.put("accountId", "아이디를 입력해주세요");
		}
		if(StringUtils.isBlank(memPw)) {
			errors.put("accountPw", "비밀번호를 입력해주세요");
		}
		if(StringUtils.isBlank(memNm)) {
			errors.put("accountNm", "이름을 입력해주세요");
		}
		
		if(errors.size() > 0)	{
			model.addAttribute("errors", errors);
			goPage = "/myPage/enterprise/entAccountApplication";
		}else {
			av.setAccountId(memId);
			av.setAccountPswd(memPw);
			av.setAccountNm(memNm);
			
			ServiceResult result = myEntService.signUp(av);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "계정등록이 완료되었습니다");
				goPage = "redirect:/myPage/enterprise/entAccountApplication";
			}else {
				model.addAttribute("errors", "서버에러, 다시 시도해주세요");
				model.addAttribute("accountVO", av);
				goPage = "/myPage/enterprise/entAccountApplication";
			}
		}
		return goPage;
	}
	
	
	
	
	
	
	
}
