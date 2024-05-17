package kr.co.itcruit.account.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.account.service.IEnterpriseAccountService;
import kr.co.itcruit.enterprise.info.service.IEnterpriseInfoService;
import kr.co.itcruit.mapper.IEnterpriseMapper;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EntAccountVO;
import kr.co.itcruit.vo.EnterpriseVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/account/enterprise")
@Slf4j
public class EnterpriseAccountController {

	@Inject
	private IEnterpriseAccountService entAccountService;
	
	@Inject
	private IEnterpriseInfoService entService;
	
	// 회원가입
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String memberSignup(HttpServletRequest req, Model model, 
			AccountVO accountVo, EnterpriseVO enterpriseVO, RedirectAttributes ra, 
			@RequestParam("entLogoImg") MultipartFile entLogoImg) {
		
		
		
		log.info("##########" + enterpriseVO.getBrnoFile());
//		log.info("##########" + enterpriseVO);
//		log.info("##########" + entLogoImg);
		
		
		try {
			byte[] castFile = entLogoImg.getBytes();
			
			enterpriseVO.setEntImg(castFile);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		log.info("##########" + enterpriseVO);
		
		
		
//		System.out.println("!!!!!!!!!!!!!!!" + accountVo);
//		System.out.println("!!!!!!!!!!!!!!!" + enterpriseVO);
		accountVo.setAccountId(enterpriseVO.getLoginId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountVO", accountVo);
		map.put("enterpriseVO", enterpriseVO);
		
		
		
		System.out.println("AccountVOAccountVOAccountVO " + map.get("accountVO"));
		System.out.println("EnterpriseVOEnterpriseVOEnterpriseVO " + map.get("enterpriseVO"));
		
		String entNm = (String) map.get(enterpriseVO.getEntNm());
		String accountId = (String) map.get(accountVo.getAccountId());
		
		
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isNotBlank(entNm)) {
			errors.put("entNm", "회사명 입력");
		}
		if(StringUtils.isNotBlank(accountId)) {
			errors.put("accuntId", "아이디 입력");
		}
		
		// 에러발생
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("map", map);
//			System.out.println("dpfdpdpfpdpdfjdj");
			goPage = "conn/registerForm";
		}else {
			// 정상데이터
			ServiceResult result = entAccountService.signup(req, map);
			if(result.equals(ServiceResult.OK)) { // 가입 성공
				log.info("!!!!!!!!!!!!!!    " + accountVo);
				ra.addFlashAttribute("message", "회원가입 완료");
				goPage = "redirect:/main/loginForm.do";
			}else {	// 가입하기 실패
				model.addAttribute("message", "서버에러, 재시도!");
				model.addAttribute("map", map);
				goPage = "conn/registerForm";
			}
		}
		
		return goPage;
		
	}

	// 로그인 
	@RequestMapping(value = "/signin.do")
	public String memberSignin(HttpSession session, AccountVO accountVO,
			Model model, RedirectAttributes ra) {
		
		String goPage = "";
//		Map<String, String> errors = new HashMap<String, String>();
//		if(StringUtils.isBlank(accountVO.getAccountId())) {
//			errors.put("accuntNm", "아이디 입력");
//		}
//		if(StringUtils.isBlank(accountVO.getAccountPswd())) {
//			errors.put("accuntPswd", "비밀번호 입력");
//		}
//		
//		if(errors.size() > 0) {
//			log.info("에얼에러에러");
//			model.addAttribute("errors", errors);
//			model.addAttribute("account", accountVO);
//			goPage = "conn/loginForm";
//		}else {
			
			////ra.flashRedirect("msg", 기업으로 로그인하세요)
//			AccountVO account = entAccountService.enterpriseSignin(accountVO);
		
		// accountVO entNo 추가에서 
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			log.info("기업user {} ", user);
			
			AccountVO account = user.getAccount();
//			log.info("기업account {} ", account);
			
			
			if(account != null) {
				String auth = account.getAuthCmmncd();
				if(auth.equals("AUTH103")) {
					log.info("성공성공ㄱ");
//					EntAccountVO entAccountVO =  entAccountService.searchEntNo(account.getAccountId());
//					log.info("entAccountVO {} ", entAccountVO);
					
//					account.setEntNo(entAccountVO.getEntNo());
					
//					log.info("account {} ", account);

					session.setAttribute("SessionInfo", account);
					goPage = "redirect:/myPage/enterprise/entInfo";
				}else {
					model.addAttribute("message", "기업회원로그인창입니다.");
					goPage = "conn/loginForm";
				}
			}else {
				log.info("시랲밋맬피ㅐ시래");
				model.addAttribute("message", "로그인 실패, 재입력");
				model.addAttribute("account", account);
				goPage = "conn/loginForm";
			}
			
//		}
		
		return goPage;
	}

	// 아이디찾기
	@RequestMapping(value = "/searchId.do", method = RequestMethod.POST)
	public ResponseEntity<AccountVO> memberSearchId(@RequestBody AccountVO accountVO,
			Model model) {
		
		AccountVO account = entAccountService.searchId(accountVO);
		log.info("!!!!  " + account);
		
		return new ResponseEntity<AccountVO>(account, HttpStatus.OK);
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/searchPw.do", method = RequestMethod.POST)
	public ResponseEntity<AccountVO> memberSearchPw(@RequestBody AccountVO accountVO,
			Model model) {
		
		AccountVO account = entAccountService.searchPw(accountVO);
		log.info("!!!!  " + account);
		
		return new ResponseEntity<AccountVO>(account, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/entBrnoCheck.do", method = RequestMethod.POST)
	public ResponseEntity<String> entBrnoCheck(@RequestBody EnterpriseVO enterpriseVO) {
		log.info("!!!!  " + enterpriseVO);
		String brno = enterpriseVO.getBrno();
		log.info("!!!!brno  " + brno);
		String yn = "N";
		EnterpriseVO eVO = entAccountService.entBrnoCheck(brno);
		log.info("!!!!  " + eVO);
		
		if (eVO == null) {
			yn = "Y";
	    }
		
		 return new ResponseEntity<String>(yn, HttpStatus.OK);
	}
	
	
	// 기업명으로 기본정보 가져오기
	@RequestMapping(value = "/entNmCheck.do", method = RequestMethod.POST)
	public ResponseEntity<List<Map<String, String>>> entNmCheck(@RequestBody EnterpriseVO enterpriseVO) throws IOException{
		
		String apiUrl = "https://apis.data.go.kr/1160100/service/GetCorpBasicInfoService_V2/getCorpOutline_V2";
        String serviceKey = "pDeipzjZdVRVsAKgrMXHajaGmUyR8zssMRCTd2%2BbvDrEkA7pzVBNtDMfV34QdrPU6rWjoOKAzBGkXw6MVf81Og%3D%3D";
        String pageNo = "1";
        String numOfRows = "10";
        String resultType = "json";
        String corpNm = enterpriseVO.getEntNm();
//        System.out.println("!!! " + corpNm);

        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("resultType", "UTF-8") + "=" + URLEncoder.encode(resultType, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("corpNm", "UTF-8") + "=" + corpNm);

        System.out.println("url = " + urlBuilder.toString());
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        int responseCode = conn.getResponseCode();
//        System.out.println("Response code: " + responseCode);

        BufferedReader in;
        StringBuilder response = new StringBuilder();
        if (responseCode >= 200 && responseCode <= 300) {
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close(); 
		
	     // JSON 문자열 파싱하여 필요한 데이터 추출
	        JSONObject jsonResponse = new JSONObject(response.toString());
	        System.out.println("jsonResponse = " + jsonResponse);
	        JSONObject responseBody = jsonResponse.getJSONObject("response").getJSONObject("body");
	        JSONObject items = responseBody.getJSONObject("items");
	        JSONArray itemArray = items.getJSONArray("item");
	        
	        
	        
	        List<Map<String, String>> resultList = new ArrayList<>();
	        
	        for (int i = 0; i < itemArray.length(); i++) {
	            JSONObject item = itemArray.getJSONObject(i);
	            
//	        	System.out.println("item = " + item);
	            String bzno = item.getString("bzno");
	            String crno = item.getString("crno");
//	            String entNm = item.getString("corpNm");
	            String enpRprFnm = item.getString("enpRprFnm");
	            String enpOzpno = item.getString("enpOzpno");
	            String enpBsadr = item.getString("enpBsadr");
	            String enpDtadr = item.getString("enpDtadr");
	            String enpHmpgUrl = item.getString("enpHmpgUrl");
	            String enpTlno = item.getString("enpTlno");
	            
	            String entNm = item.getString("corpNm");
		        // 결과를 Map에 담아서 반환
	            if (!containsEntNm(resultList, entNm)) {
	            	Map<String, String> resultMap = new HashMap<>();
                    resultMap.put("brno", bzno);
                    resultMap.put("crno", crno);
                    resultMap.put("enpRprFnm", enpRprFnm);
                    resultMap.put("enpOzpno", enpOzpno);
                    resultMap.put("enpBsadr", enpBsadr);
                    resultMap.put("enpDtadr", enpDtadr);
                    resultMap.put("enpHmpgUrl", enpHmpgUrl);
                    resultMap.put("enpTlno", enpTlno);
                    resultMap.put("corpNm", entNm);
                    
                    System.out.println("resultMap  = " + resultMap);
                    resultList.add(resultMap);
                }
	        }
	        
	        
	        System.out.println("넘어가는값  = " + resultList);
	        return new ResponseEntity<>(resultList, HttpStatus.OK);
		}else {
			// 결과가 없을 때 에러 메시지를 반환
			List<Map<String, String>> resultList = new ArrayList<>();
            Map<String, String> resultMap = new HashMap<>();
            resultMap.put("fail", "No data found");
            resultList.add(resultMap);
	        return new ResponseEntity<>(resultList, HttpStatus.NOT_FOUND);
		}
	}
	// 중복 기업명을 확인하는 메서드
	private boolean containsEntNm(List<Map<String, String>> resultList, String entNm) {
	    for (Map<String, String> resultMap : resultList) {
	        if (resultMap.containsKey("corpNm") && resultMap.get("corpNm").equals(entNm)) {
	            return true;
	        }
	    }
	    return false;
	}
	// 법인등록번호로 정보조회
	@RequestMapping(value = "/entInfo.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> entInfo(@RequestBody String crno) throws IOException{
//		System.out.println("!!!!!!! " + crno);
		String jurirno = new JSONObject(crno).getString("crno");
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1130000/affiliationCompSttusList/affiliationCompSttusListApi"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=pDeipzjZdVRVsAKgrMXHajaGmUyR8zssMRCTd2%2BbvDrEkA7pzVBNtDMfV34QdrPU6rWjoOKAzBGkXw6MVf81Og%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("presentnYear","UTF-8") + "=" + URLEncoder.encode("202105", "UTF-8")); /*기업집단 지정년월*/
//        urlBuilder.append("&" + URLEncoder.encode("unityGrupCode","UTF-8") + "=" + URLEncoder.encode("K1000032", "UTF-8")); /*기업집단코드*/
        urlBuilder.append("&" + URLEncoder.encode("jurirno","UTF-8") + "=" + URLEncoder.encode(jurirno, "UTF-8")); /*법인등록번호*/
        
//        System.out.println("!!!!!!! " + urlBuilder.toString());
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
//        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        StringBuilder response = new StringBuilder();
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                response.append(line);
            }
            rd.close();
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                response.append(line);
            }
            rd.close();
        }
        conn.disconnect();

        // XML 데이터를 JSON으로 변환하여 클라이언트로 전송
        String xmlData = response.toString();
        JSONObject jsonObject = XML.toJSONObject(xmlData);
        String jsonResponse = jsonObject.toString();
        System.out.println("jsonResponse  = " + jsonResponse);
        
        return new ResponseEntity<>(jsonResponse, HttpStatus.OK);
	}
	
	
	// 법인등록번호로 재무조회
	@RequestMapping(value = "/entFinancial.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> entFinancial(@RequestBody String crno) throws IOException{
//		System.out.println("!!!!!!! " + crno);
		String jurirno = new JSONObject(crno).getString("crno");
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1130000/financeCompSttusList/financeCompSttusListApi"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=pDeipzjZdVRVsAKgrMXHajaGmUyR8zssMRCTd2%2BbvDrEkA7pzVBNtDMfV34QdrPU6rWjoOKAzBGkXw6MVf81Og%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("presentnYear","UTF-8") + "=" + URLEncoder.encode("202105", "UTF-8")); /*기업집단 지정년월*/
//        urlBuilder.append("&" + URLEncoder.encode("unityGrupCode","UTF-8") + "=" + URLEncoder.encode("K1000032", "UTF-8")); /*기업집단코드*/
        urlBuilder.append("&" + URLEncoder.encode("jurirno","UTF-8") + "=" + URLEncoder.encode(jurirno, "UTF-8")); /*법인등록번호*/
        
//        System.out.println("@@@@@ " + urlBuilder.toString());
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
//        System.out.println("Response code: " + conn.getResponseCode());
        
        
        BufferedReader rd;
        StringBuilder response = new StringBuilder();
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                response.append(line);
            }
            rd.close();
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                response.append(line);
            }
            rd.close();
        }
        conn.disconnect();

        // XML 데이터를 JSON으로 변환하여 클라이언트로 전송
        String xmlData = response.toString();
        JSONObject jsonObject = XML.toJSONObject(xmlData);
        String jsonResponse = jsonObject.toString();
        System.out.println("jsonResponse  = " + jsonResponse);
        
        return new ResponseEntity<>(jsonResponse, HttpStatus.OK);
	}
	
	
	

}
