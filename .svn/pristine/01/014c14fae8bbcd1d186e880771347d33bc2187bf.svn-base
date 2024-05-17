package kr.co.itcruit.resume.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.atch.controller.MediaUtils;
import kr.co.itcruit.atch.controller.UploadFileUtils;
import kr.co.itcruit.resume.service.IResumeService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.AvailLangListVO;
import kr.co.itcruit.vo.CareerVO;
import kr.co.itcruit.vo.CertificateVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EducationVO;
import kr.co.itcruit.vo.ExperienceVO;
import kr.co.itcruit.vo.PortfolioFileVO;
import kr.co.itcruit.vo.PortfolioVO;
import kr.co.itcruit.vo.PositionVO;
import kr.co.itcruit.vo.ProjectCareerVO;
import kr.co.itcruit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/resume")
public class ResumeController {

	@Inject
	private IResumeService resumeService;
	
	//이력서 등록, 삭제, 수정, 조회
	
	@Resource(name="uploadPath")
	private String resourcePath;
		
	
	/**
	 * 이력서 등록 폼 view
	 * @param session
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@RequestMapping(value = "/registerView")
	public String resumeRegister(HttpSession session, Model model) {
		
		String goPage = "";
		
		//[스프링 시큐리티] 회원 ID를 스프링 시큐리티 UserDetails 정보에서 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO member = resumeService.selectMember(user.getAccount().getAccountId());
		AccountVO account = user.getAccount();
		
//		AccountVO accountVO = user.getAccount();
//		System.out.println(">>>>>>>>>"+accountVO);
		
		if(member != null) {
			log.info(member.getAccountId());
			log.info(member.getAccountNm());
			log.info(member.getAccountMail());
			log.info(member.getAccountTell());
			log.info(member.getBirthY());
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String todayDate = sdf.format(date);
			
			session.setAttribute("SessionInfo", account);
			model.addAttribute("member", member);
			model.addAttribute("todayDate", todayDate);
			goPage = "resume/resumeRegister";
		}
		
		return goPage;
	}
	
	/**
	 * 이력서에서 포트폴리오 항목 on 후 파일등록했을 때
	 * @param portnamefile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadPortFileAjax", method=RequestMethod.POST,
					produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadPortFileAjax(MultipartFile portnamefile) throws Exception{
		
//		String savedName = null;
//		
//		for (MultipartFile file : files) {
//	        log.info("originalFileName : " + file.getOriginalFilename());
//	        // 파일 처리 로직 추가
//	        // UploadFileUtils 클래스를 사용하여 파일 저장 등의 작업 수행
//	        savedName = UploadFileUtils.uploadFile(resourcePath, file.getOriginalFilename(), file.getBytes());
//	    }
		
		log.info("originalFileName : " + portnamefile.getOriginalFilename());
		
		//savedName은 /2024/03/06/UUID_원본파일명(오늘날짜/UUID_원본파일명) 을 리턴
		//resourcePath : 업로드까지의 폴더 경로
		//getOriginalFilename : 업로드한 파일 이름
		//getBytes : 업로드한 파일을 컴퓨터가 다시 읽을 수 있는 데이터로. 꼭 필요
		// UploadFileUtils 클래스를 만들어서 uploadFile 메서드를 만든다
		String savedName = UploadFileUtils.uploadPortFile(resourcePath, portnamefile.getOriginalFilename(), portnamefile.getBytes());
		//1. UUID 붙여서 /2024/03/06/ UUID_원본 파일명을 가진 파일 생성
		//2. 그 파일로 썸네일 이미지 만들기 위해 100X100으로 리사이징하고 s_ 붙여서 썸네일 생성
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	/**
	 * 이력서에서 사진 항목 on 후 사진등록했을 때
	 * @param rsmPhoto
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST,
			produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile rsmPhoto) throws Exception{
		
		log.info("originalFileName : " + rsmPhoto.getOriginalFilename());
		
		//savedName은 /2024/03/06/UUID_원본파일명(오늘날짜/UUID_원본파일명) 을 리턴
		//resourcePath : 업로드까지의 폴더 경로
		//getOriginalFilename : 업로드한 파일 이름
		//getBytes : 업로드한 파일을 컴퓨터가 다시 읽을 수 있는 데이터로. 꼭 필요
		// UploadFileUtils 클래스를 만들어서 uploadFile 메서드를 만든다
		String savedName = UploadFileUtils.uploadFile(resourcePath, rsmPhoto.getOriginalFilename(), rsmPhoto.getBytes());
		//1. UUID 붙여서 /2024/03/06/ UUID_원본 파일명을 가진 파일 생성
		//2. 그 파일로 썸네일 이미지 만들기 위해 100X100으로 리사이징하고 s_ 붙여서 썸네일 생성
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	/**
	 * 이력서에서 등록한 사진 썸네일 보여주기
	 * @param fileName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName){
		
		//파일데이터를 바이트 배열로 써야해서 만들어놓고
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("fileName(displayFile) : " + fileName);
		
		//확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		//미디어 타입 명시해야하니까
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		//이 정보를 헤더에 담아서 알려줘야하니까 선언해주고
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			//파일 입력하려고 FileInputStream에 담는다(폴더경로+파일이름)
			in = new FileInputStream(resourcePath + fileName);
			
			
			if(mType != null) { //mType이 이미지면
				headers.setContentType(mType);
			}else { //mType이 이미지가 아니면
				
				//fileName.indexOf("_") uuid 다음의 언더바 이후의 '파일이름.확장자'를 가져옴
				fileName = fileName.substring(fileName.indexOf("_")+1);
				
				//APPLICATION_OCTET_STREAM : 기본 미디어타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				
				//이미지가 아닐 때 정해져 있는 방식 -> 다운로드 해준다
				headers.add("Content-Disposition", "attachment; filename=\""
						+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); 
			}
			
			//toByteArray : 바이트배열로 만들어준다
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers, HttpStatus.CREATED);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			
		} finally {
			try {
				//FileInputStream 닫아준다
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return entity;
	}
	
	/**
	 * 기술스택(사용언어) 검색어 자동완성
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value="/langListAutoComplete")
	public @ResponseBody Map<String, Object> resumeLangAutoComplete(@RequestParam Map<String, Object> paramMap){
		
		List<Map<String, Object>> langList = resumeService.langList(paramMap);
		paramMap.put("langList", langList);
		
		return paramMap;
	}
	
	/**
	 * 이력서 입력받은 값 db에 넣기
	 * @param rsmPhoto
	 * @param portFile
	 * @param positionVO
	 * @param availLangListVO
	 * @param portUrlVOList
	 * @param portFileVO
	 * @param educationVO
	 * @param careerVOList
	 * @param projectVOList
	 * @param certVOList
	 * @param expVOList
	 * @param req
	 * @param resumeVO
	 * @param model
	 * @param ra
	 * @return
	 */
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ResponseEntity<String> resumeInsert(
			
			@RequestPart(name = "rsmPhoto", required = false) MultipartFile rsmPhoto
			,@RequestPart(name = "portFile", required = false) MultipartFile portFile[]
			,@RequestPart(name = "positionVO", required = false) PositionVO positionVO
			,@RequestPart("availLangVO") AvailLangListVO availLangListVO
			,@RequestPart(name = "portUrlVO", required = false) List<PortfolioVO> portUrlVOList
			,@RequestPart(name = "portFileVO", required = false) PortfolioFileVO portFileVO
			,@RequestPart(name = "eduVO", required = false) EducationVO educationVO
			,@RequestPart(name = "careerVO", required = false) List<CareerVO> careerVOList
			,@RequestPart(name = "projectVO", required = false) List<ProjectCareerVO> projectVOList
			,@RequestPart(name = "certificate", required = false) List<CertificateVO> certVOList
			,@RequestPart(name = "etcHistories", required = false) List<ExperienceVO> expVOList
			,HttpServletRequest req, ResumeVO resumeVO, Model model
			
			) {
		ResponseEntity<String> goPage = null; //이동할 페이지 정보
		
		System.out.println(">>>>>>>>>>>>>>>>>"+ resumeVO);
		log.info("positionVO {}", positionVO);
		log.info("availLangListVO {}", availLangListVO);
		log.info("portUrlVOList {}", portUrlVOList);
		log.info("portFileVOList {}", portFileVO);
		log.info("educationVO {}", educationVO);
		log.info("careerVOList {}", careerVOList);
		log.info("projectVOList {}", projectVOList);
		log.info("certVOList {}", certVOList);
		log.info("expVOList {}", expVOList);
		log.info("portFile {}", portFile);
		
		if(resumeVO.getRsmTtl() == null || resumeVO.getRsmTtl() == ""
			|| resumeVO.getRsmNewCareer() == null || resumeVO.getRsmNewCareer() == ""
			|| resumeVO.getRsmRlsYn() == null || resumeVO.getRsmRlsYn() == ""
			|| availLangListVO.getLangArr() == null || availLangListVO.getLangArr().length == 0) {
			
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = new ResponseEntity<>("resume/registerView", HttpStatus.NOT_FOUND);
			
		} else {
			
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			AccountVO member = resumeService.selectMember(user.getAccount().getAccountId());
			
			if(member != null) {
				log.info(member.getAccountId());
				log.info(member.getAccountNm());
				log.info(member.getGender());
				
				if(rsmPhoto != null) {
					try {
						byte[] rsmPhotoFile = rsmPhoto.getBytes();
						resumeVO.setRsmPhotoByte(rsmPhotoFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				resumeVO.setAccountId(member.getAccountId());
				resumeVO.setRsmGender(member.getGender());
				
				ServiceResult resumeResult = resumeService.insertResume(
						req, resumeVO, availLangListVO, positionVO
						, portUrlVOList, portFileVO, educationVO, careerVOList
						, projectVOList, certVOList, expVOList, portFile);
				
				if(resumeResult.equals(ServiceResult.OK)) {//등록 성공
					goPage = new ResponseEntity<String>("/myPage/member/resumeManage", HttpStatus.OK);
				}else {	//등록 실패
					goPage = new ResponseEntity<>("/resume/registerView", HttpStatus.NOT_FOUND);
				}
			}
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@RequestMapping(value = "/updateView", method=RequestMethod.GET)
	public String resumeUpdateForm(@RequestParam String rsmNo, Model model, HttpSession session) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO member = resumeService.selectMember(user.getAccount().getAccountId());
		AccountVO account = user.getAccount();
		
		if(member != null) {
			log.info(member.getAccountId());
			log.info(member.getAccountNm());
			log.info(member.getAccountMail());
			log.info(member.getAccountTell());
			log.info(member.getBirthY());
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String todayDate = sdf.format(date);
			
			session.setAttribute("SessionInfo", account);
			model.addAttribute("member", member);
			model.addAttribute("todayDate", todayDate);
			System.out.println("rsmnoooooooo");
			System.out.println(rsmNo);
			
			Map<String, Object> selectRsmMap = new HashMap<String, Object>();
			//Map(resume/lang/posi/career/proj/portUrl/portFile/cert/exp, 해당 VO들의 value)
			
			List<ResumeVO> resumeVOList = resumeService.selectExistingResume(rsmNo);
			List<ResumeVO> positionList = resumeService.selectPositionResume(rsmNo);
			List<CareerVO> careerList = resumeService.selectCareerProject(rsmNo);
			List<PortfolioVO> portUrlList = resumeService.selectPortUrl(rsmNo);
			List<AtchFileVO> portFileList = resumeService.selectPortFile(rsmNo);
			List<CertificateVO> certList = resumeService.selectCert(rsmNo);
			List<ExperienceVO> expList = resumeService.selectExp(rsmNo);
			
			for(ResumeVO rsmVO : resumeVOList) {
				if(rsmVO.getRsmPhotoByte() != null) {
					byte[] rsmPhotobyte = rsmVO.getRsmPhotoByte();
					String rsmPhoto = Base64.getEncoder().encodeToString(rsmPhotobyte);
					model.addAttribute("resumePhoto", rsmPhoto);
				}
			}
			
			if(positionList != null || positionList.size()>0) {
				model.addAttribute("positionList",positionList);
			}
			if(careerList != null || careerList.size() > 0) {
				model.addAttribute("careerList", careerList);
			}
			if(portUrlList != null || portUrlList.size() > 0) {
				model.addAttribute("portUrlList", portUrlList);
			}
			if(portFileList != null || portFileList.size() > 0) {
				model.addAttribute("portFileList", portFileList);
			}
			if(certList != null || certList.size() > 0) {
				model.addAttribute("certList", certList);
			}
			if(expList != null || expList.size() > 0) {
				model.addAttribute("expList", expList);
			}
			
			System.out.println("uuuuuuuuV");
			System.out.println(resumeVOList);
			System.out.println(positionList);
			System.out.println(careerList);
			System.out.println(portUrlList);
			System.out.println(portFileList);
			System.out.println(certList);
			System.out.println(expList);
			
			model.addAttribute("resumeVOList", resumeVOList);
			model.addAttribute("status", "u");
			
		}
		return "resume/resumeForm";
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ResponseEntity<String> resumeUpdate(
			
			@RequestPart(name = "rsmPhoto", required = false) MultipartFile rsmPhoto
			,@RequestPart(name = "portFile", required = false) MultipartFile portFile[]
			,@RequestPart(name = "positionVO", required = false) PositionVO positionVO
			,@RequestPart("availLangVO") AvailLangListVO availLangListVO
			,@RequestPart(name = "portUrlVO", required = false) List<PortfolioVO> portUrlVOList
			,@RequestPart(name = "portFileVO", required = false) PortfolioFileVO portFileVO
			,@RequestPart(name = "eduVO", required = false) EducationVO educationVO
			,@RequestPart(name = "careerVO", required = false) List<CareerVO> careerVOList
			,@RequestPart(name = "certificate", required = false) List<CertificateVO> certVOList
			,@RequestPart(name = "etcHistories", required = false) List<ExperienceVO> expVOList
			, HttpServletRequest req, ResumeVO resumeVO, Model model, RedirectAttributes ra
			
			) {
		
		ResponseEntity<String> goPage = null;
		
		System.out.println(">>>>>>"+ resumeVO);
		log.info("positionVO {}", positionVO);
		log.info("availLangListVO {}", availLangListVO);
		log.info("portUrlVOList {}", portUrlVOList);
		log.info("portFileVOList {}", portFileVO);
		log.info("educationVO {}", educationVO);
		log.info("careerVOList {}", careerVOList);
		log.info("certVOList {}", certVOList);
		log.info("expVOList {}", expVOList);
		log.info("portFile {}", portFile);
		
		if(resumeVO.getRsmTtl() == null || resumeVO.getRsmTtl() == ""
			|| resumeVO.getRsmNewCareer() == null || resumeVO.getRsmNewCareer() == ""
			|| resumeVO.getRsmRlsYn() == null || resumeVO.getRsmRlsYn() == ""
			|| availLangListVO.getLangArr() == null || availLangListVO.getLangArr().length == 0) {
			
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = new ResponseEntity<String>("resume/updateView?rsmNo="+resumeVO.getRsmNo(), HttpStatus.NOT_FOUND);
			
		} else {
			
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			AccountVO member = resumeService.selectMember(user.getAccount().getAccountId());
			
			if(member != null) {
				log.info(member.getAccountId());
				log.info(member.getAccountNm());
				log.info(member.getGender());
				
				if(rsmPhoto != null) {
					try {
						byte[] rsmPhotoFile = rsmPhoto.getBytes();
						resumeVO.setRsmPhotoByte(rsmPhotoFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				resumeVO.setAccountId(member.getAccountId());
				resumeVO.setRsmGender(member.getGender());
				
				ServiceResult resumeResult = resumeService.updateResume(
						req, resumeVO, availLangListVO, positionVO
						, portUrlVOList, portFileVO, educationVO, careerVOList
						, certVOList, expVOList, portFile);
				
				if(resumeResult.equals(ServiceResult.OK)) {//수정 성공
					goPage = new ResponseEntity<String>("/myPage/member/resumeManage", HttpStatus.OK);
				}else {	//수정 실패
					goPage = new ResponseEntity<String>("/resume/updateView?rsmNo="+resumeVO.getRsmNo(), HttpStatus.NOT_FOUND);
				}
			}
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_AUTH102')")
	@RequestMapping(value = "/delete.do")
	public String resumeDelete(@RequestParam String rsmNo, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		//지울 resume select
		ResumeVO resumeVO = resumeService.selectDeleteRsm(rsmNo);
		if(resumeVO != null) {
			//resume 항목들 delete
			ServiceResult result = resumeService.deleteResume(resumeVO);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "이력서 삭제가 완료되었습니다");
				goPage = "redirect:/myPage/member/resumeManage";
			} else {
				model.addAttribute("message", "서버에러! 다시 시도해주세요!");
				goPage = "myPage/member/resumeManage";
			}
		}else {
			model.addAttribute("message", "서버에러! 다시 시도해주세요!");
			goPage = "myPage/member/resumeManage";
		}
		
		return goPage;
	}
	
	
}
