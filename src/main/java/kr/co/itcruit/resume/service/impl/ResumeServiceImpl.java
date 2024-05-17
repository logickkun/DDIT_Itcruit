package kr.co.itcruit.resume.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.mapper.IAtchFileMapper;
import kr.co.itcruit.mapper.IResumeMapper;
import kr.co.itcruit.resume.service.IResumeService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.AvailLangListVO;
import kr.co.itcruit.vo.CareerVO;
import kr.co.itcruit.vo.CertificateVO;
import kr.co.itcruit.vo.EducationVO;
import kr.co.itcruit.vo.ExperienceVO;
import kr.co.itcruit.vo.PortfolioFileVO;
import kr.co.itcruit.vo.PortfolioVO;
import kr.co.itcruit.vo.PositionVO;
import kr.co.itcruit.vo.ProjectCareerVO;
import kr.co.itcruit.vo.ResumeVO;

@Service
public class ResumeServiceImpl implements IResumeService{
	
	@Inject
	private IResumeMapper resumeMapper;
	
	@Autowired
	private IAtchFileMapper fileMapper;
	
	//resume 등록하려는 회원정보 가져오기
	@Override
	public AccountVO selectMember(String accountId) {
		return resumeMapper.selectMember(accountId);
	}
	
	//resume 기술스택(사용언어) dropdown list 가져오기
	@Override
	public List<Map<String, Object>> langList(Map<String, Object> paramMap) {
		return resumeMapper.langList(paramMap);
	}

	@Override
	public List<ResumeVO> selectResume(String accountId) {
		return resumeMapper.selectResume(accountId);
	}

	//resume등록할 때 이력서번호, 회원id, 성별, 이력서제목, 신입경력여부, 연차, 이력서공개여부 작성한거 insert
	@Override
	public ServiceResult insertResume(HttpServletRequest req, ResumeVO resumeVO, AvailLangListVO availLangListVO
			, PositionVO positionVO, List<PortfolioVO> portUrlVOList, PortfolioFileVO portFileVO
			, EducationVO educationVO, List<CareerVO> careerVOList
			, List<ProjectCareerVO> projectVOList, List<CertificateVO> certificateVOList, List<ExperienceVO> experienceVOList
			, MultipartFile[] portFile) {
		
		ServiceResult result = null;
		
		int status = resumeMapper.insertResume(resumeVO);
		
		if(status > 0) { //기본정보 insert됐으면
			
			//기술스택(사용언어)
			String[] langArr = availLangListVO.getLangArr();
			
			for(String lang : langArr) {
				availLangListVO.setRsmNo(resumeVO.getRsmNo()); //이력서 번호 설정
				
				//resume등록할 때 필수로 받는 기술스택(사용언어)의 공통코드 가져오기
//				String availLangCmmncd = resumeMapper.selectCommncdLang(lang);
//				System.out.println("commncdLang!!!!!" + availLangCmmncd);
//				availLangListVO.setAvailLangCmmncd(availLangCmmncd); //현재 해당하는 사용언어에 대한 공통코드 설정
				
				//resume등록할 때 필수로 받는 기술스택(사용언어) insert
				availLangListVO.setAvailLangCmmncdNm(lang);
				int langStatus = resumeMapper.insertResumeLang(availLangListVO);
				if(langStatus > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
			
			if(resumeVO.getRsmPhotoByte() != null && resumeVO.getRsmPhotoByte().length > 0) {
				int resumePhotoStatus = insertResumePhoto(resumeVO);
				if(resumePhotoStatus > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
			
			if(resumeVO.getRsmIntroduction() != null && resumeVO.getRsmIntroduction().length() > 0) {
				int introStatus = insertResumeIntro(resumeVO);
				if(introStatus > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
			
			if(positionVO != null && !positionVO.equals("")) {
				int positionStatus = insertResumePosition(positionVO, resumeVO.getRsmNo());
				if(positionStatus > 0 ) {
					result = ServiceResult.OK;  //0이면 falied로
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
			
			if(portUrlVOList != null) {
				if(portUrlVOList.size() > 0) {
					int portStatus = insertResumePortfolio(portUrlVOList, resumeVO.getRsmNo());
					if(portStatus > 0 ) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
			
			if(portFile != null) {
				int portFileStatus = insertResumePortfolioFile(portFileVO, resumeVO.getRsmNo(), portFile, req);
				if(portFileStatus > 0 ) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
			
			if(educationVO != null && !educationVO.equals("")) {
				int eduStatus = insertResumeEducation(educationVO, resumeVO);
				if(eduStatus > 0 ) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
			
			if(careerVOList != null) {
				if(careerVOList.size() > 0) {
					int careerStatus = insertResumeCareer(careerVOList, resumeVO);
					if(careerStatus > 0 ) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
			
			if(certificateVOList != null) {
				if(certificateVOList.size() > 0) {
					int certStatus = insertResumeCertificate(certificateVOList, resumeVO.getRsmNo());
					if(certStatus > 0 ) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
			
			if(experienceVOList != null) {
				if(experienceVOList.size() > 0) {
					int expStatus = insertResumeExperience(experienceVOList, resumeVO.getRsmNo());
					if(expStatus > 0 ) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
			
		}else {
			result = ServiceResult.FAILED;
			return result;
		}
		
		return result;
	}


	//이력서 등록할 때 경험 데이터가 있으면
	private int insertResumeExperience(List<ExperienceVO> experienceVOList, String rsmNo) {
		
		int expStatus = 0;
		
		for (ExperienceVO expVO : experienceVOList) {
			
			expVO.setRsmNo(rsmNo); //이력서 번호 설정
			
			//resume등록할 때 입력한 경험 insert
			expStatus = resumeMapper.insertResumeExp(expVO);
		}
		return expStatus;
	}

	//이력서 등록할 때 자격증 데이터가 있으면
	private int insertResumeCertificate(List<CertificateVO> certificateVOList, String rsmNo) {
		
		int certStatus = 0;
		
		for (CertificateVO certVO : certificateVOList) {
			
			certVO.setRsmNo(rsmNo); //이력서 번호 설정
			
			//resume등록할 때 입력한 자격증 insert
			certStatus = resumeMapper.insertResumeCert(certVO);
		}
		return certStatus;
	}

	//이력서 등록할 때 경력-프로젝트 데이터가 있으면
	private int insertResumeProject(ProjectCareerVO projectVO) {
		
		int projectStatus = 0;
		
		projectVO.setCareerNo(projectVO.getCareerNo()); //경력 번호 설정
		
		//resume 등록할 때 입력한 경력-프로젝트 insert
		projectStatus = resumeMapper.insertResumeCareerProject(projectVO);
		
		return projectStatus;
	}

	//이력서 등록할 때 경력을 선택했고, 경력 데이터가 있으면, 경력 하나 당 프로젝트 데이터는 필수니까
	private int insertResumeCareer(List<CareerVO> careerVOList, ResumeVO resumeVO) {
		
		int careerStatus = 0;
		
		if(resumeVO.getRsmNewCareer() == "신입") {
			return careerStatus;
		} else {
			for(CareerVO careerVO : careerVOList) {
				
				careerVO.setRsmNo(resumeVO.getRsmNo());
				
				//resume등록할 때 경력 insert하기 전에 이미 insert된 경력인지 확인
//				int existingCareerNo = resumeMapper.checkCareerDuplicate(careerVO);
				
				//없는 careerNo면 데이터베이스에 저장
//				if (existingCareerNo == 0) {
					resumeMapper.insertResumeCareer(careerVO);
					
					//경력 입력 할 때 무조건 프로젝트 한 개는 필수
					if(careerVO.getProjectData() != null) {
						
						List<ProjectCareerVO> projectVOList = careerVO.getProjectData();
						
						for(ProjectCareerVO projectVO : projectVOList) {
							
							projectVO.setCareerNo(careerVO.getCareerNo());
							
							int projectStatus = insertResumeProject(projectVO);
							if(projectStatus > 0 ) {
								careerStatus = projectStatus;
							}else {
								return careerStatus;
							}
						}
					}
//				}
			}
		}
		return careerStatus;
	}
	

	//이력서 등록할 때 최종학력 데이터가 있으면
	private int insertResumeEducation(EducationVO educationVO, ResumeVO resumeVO) {
		
		int eduStatus = 0;
		
		resumeVO.setEduEnd(educationVO.getEduEnd());
		resumeVO.setEduAcdmcr(educationVO.getEduAcdmcr());
		resumeVO.setEduNm(educationVO.getEduNm());
		resumeVO.setRsmMjrNm(educationVO.getRsmMjrNm());
		resumeVO.setGrade(educationVO.getGrade());
		resumeVO.setFull(educationVO.getFull());
		resumeVO.setRsmNo(resumeVO.getRsmNo());
		
		//resume등록할 때 입력한 최종학력 insert
		eduStatus = resumeMapper.insertResumeEducation(resumeVO);
		
		return eduStatus;
	}

	//이력서 등록할 때 포트폴리오 파일 데이터가 있으면
	private int insertResumePortfolioFile(PortfolioFileVO portFileVO, String rsmNo, MultipartFile[] portFile, HttpServletRequest req) {
		
		int portFileStatus = 0;
			
		portFileVO.setRsmNo(rsmNo); //이력서 번호 설정
		
		List<String> portFileTtlList = portFileVO.getPortFileTtlList();
		
		if (portFileTtlList != null) {
			if(portFileTtlList.size() > 0) {
				try {
					
					for(MultipartFile portfolioFile : portFile) {
						
						portFileVO.setPortFileTtl(portfolioFile.getOriginalFilename()); //포트폴리오 파일제목 설정
						
						//resume등록할 때 업로드한 포트폴리오 파일 이름 insert
						portFileStatus = resumeMapper.insertResumePortfolioFileTtl(portFileVO);
						
						String fileSrcNo = portFileVO.getPortFileNo(); //파일번호를 보냄
						
						String orgnCmmncd = "이력서포트폴리오파일";
						
						AtchFileVO atchFileVO = new AtchFileVO(portfolioFile, req, fileSrcNo, orgnCmmncd);
						atchFileVO.setFileSrcNo(fileSrcNo);
						atchFileVO.setOrgnCmmncd(orgnCmmncd);;
						
						//resume등록할 때 업로드한 포트폴리오 파일 insert
						fileMapper.atchFileInsert(atchFileVO);
					}
					
				} catch (Exception e) {
					portFileStatus = 0;
				}	
			}
		}
		return portFileStatus;
	}
	
	//이력서 등록할 때 포트폴리오 url 데이터가 있으면
	private int insertResumePortfolio(List<PortfolioVO> portfolioVOList, String rsmNo) {
		
		int portStatus = 0;
		
		for (PortfolioVO portfolioVO : portfolioVOList) {
			
			portfolioVO.setRsmNo(rsmNo); //이력서 번호 설정
			
			portStatus = resumeMapper.insertResumePortfolioUrl(portfolioVO);
			
		}
		return portStatus;
	}

	//이력서 등록할 때 개발직무 데이터가 있으면
	private int insertResumePosition(PositionVO positionVO, String rsmNo) {
		
		int positionStatus = 0;
		
		String[] pstnArr = positionVO.getPstnArr(); //서버, 웹백엔드
		String[] pstnCateArr = positionVO.getPstnCateArr();	//category1, category2
		
		for(int i = 0; i < pstnArr.length; i++) {
			
			positionVO.setPstnCmmncdNm(pstnArr[i]);
			positionVO.setPstnCate(pstnCateArr[i]);
			
			positionVO.setRsmNo(rsmNo); //이력서 번호 설정
			
			//resume등록할 때 입력한 개발직무 insert
			positionStatus = resumeMapper.insertResumePosition(positionVO);
			
		}
		
		return positionStatus;
	}
	
	//이력서 등록할 때 간단소개 있으면
	private int insertResumeIntro(ResumeVO resumeVO) {
		
		resumeVO.setRsmNo(resumeVO.getRsmNo());
		
		int introStatus = resumeMapper.insertResumeIntro(resumeVO);
		
		return introStatus;
	}

	//이력서 등록할 때 프로필 사진이 있으면
	private int insertResumePhoto(ResumeVO resumeVO) {
		
		resumeVO.setRsmNo(resumeVO.getRsmNo());
		
		int resumePhotoStatus = resumeMapper.insertResumePhoto(resumeVO);
		
		return resumePhotoStatus;
	}

	// 이력서 확인
	public List<ResumeVO> checkResume(String accountId) {
		return resumeMapper.checkResume(accountId);
	}

	
	//회원마이페이지에서 본인 이력서 제목 클릭 후 확인하려고 할 때. rsmNo로 정보를 불러옴
	//기본정보, 학력, 사용언어 select
	@Override
	public List<ResumeVO> selectExistingResume(String rsmNo) {
		List<ResumeVO> existingResumeVO = resumeMapper.selectExistingResume(rsmNo);
		return existingResumeVO;
	}
	//직무 select
	@Override
	public List<ResumeVO> selectPositionResume(String rsmNo) {
		List<ResumeVO> positionList = resumeMapper.selectPositionResume(rsmNo);
		return positionList;
	}
	//포트폴리오 url select
	@Override
	public List<PortfolioVO> selectPortUrl(String rsmNo) {
		List<PortfolioVO> urlList = resumeMapper.selectPortUrl(rsmNo);
		return urlList;
	}
	//포트폴리오 file select
	@Override
	public List<AtchFileVO> selectPortFile(String rsmNo) {
		List<AtchFileVO> fileList = resumeMapper.selectPortFile(rsmNo);
		return fileList;
	}
	//경력, 프로젝트 select
	@Override
	public List<CareerVO> selectCareerProject(String rsmNo) {
		List<CareerVO> careerList = resumeMapper.selectCareerProject(rsmNo);
		return careerList;
	}
	//자격증 select
	@Override
	public List<CertificateVO> selectCert(String rsmNo) {
		List<CertificateVO> certList = resumeMapper.selectCert(rsmNo);
		return certList;
	}
	//경험 select
	@Override
	public List<ExperienceVO> selectExp(String rsmNo) {
		List<ExperienceVO> expList = resumeMapper.selectExp(rsmNo);
		return expList;
	}
	//사진 select
	@Override
	public ResumeVO selectRsmPhoto(String rsmNo) {
		return resumeMapper.selectRsmPhoto(rsmNo);
	}

	//이력서 수정
	@Override
	public ServiceResult updateResume(HttpServletRequest req, ResumeVO resumeVO, AvailLangListVO availLangListVO,
			PositionVO positionVO, List<PortfolioVO> portUrlVOList, PortfolioFileVO portFileVO, EducationVO educationVO,
			List<CareerVO> careerVOList, List<CertificateVO> certVOList, List<ExperienceVO> expVOList,
			MultipartFile[] portFile) {
		
		ServiceResult result = null;
		
		//수정하기 눌러서 넘어온 rsmNo
		String uRsmNo = resumeVO.getRsmNo();
		
		//필수 입력값 중 기본정보들은 업데이트
		int defaultCnt = resumeMapper.updateDefaultRsmInfo(resumeVO);
		if(defaultCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
			return result;
		}
		
		//필수 입력값 중 사용언어는 원래 있던 데이터 먼저 삭제
		int langCnt = resumeMapper.deleteRsmLang(uRsmNo);
		
		if(langCnt > 0) { //필수 입력값 delete됐으면
			
			//기술스택(사용언어)
			String[] langArr = availLangListVO.getLangArr();
			
			for(String lang : langArr) {
				availLangListVO.setRsmNo(uRsmNo); //수정이력서 번호 설정
				
				//resume 수정 할 때 필수로 받는 기술스택(사용언어) insert
				availLangListVO.setAvailLangCmmncdNm(lang);
				int langStatus = resumeMapper.insertResumeLang(availLangListVO);
				if(langStatus > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		//1)원래 사진이 없었는데 수정할 때 추가함
		//2)원래 사진이 있었고 수정할 때 수정함
		if(resumeVO.getRsmPhotoByte() != null) {
			//사진 데이터를 resume에 update
			int photoCnt = resumeMapper.insertResumePhoto(resumeVO);
			if(photoCnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}else {	//1)원래 사진이 있었는데 삭제함  2)원래 사진이 없었고 추가안함
			//사진이 db에 있었는지 없었는지 확인
			int chkRsmPhoto = resumeMapper.findRsmPhoto(uRsmNo);
			if(chkRsmPhoto > 0) {
				//원래 db에 있던 사진 빈값으로 바꾸기(update '')
				int chkDeleteRsmPhoto = resumeMapper.deleteRsmPhoto(uRsmNo);
				if(chkDeleteRsmPhoto > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		//1)원래 간단소개가 없었는데 수정할 때 추가함
		//2)원래 간단소개가 있었고 수정할 때 수정함 
		if(resumeVO.getRsmIntroduction() != null) {
			//간단소개 데이터를 resume에 update
			int introCnt = resumeMapper.insertResumeIntro(resumeVO);
			if(introCnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}else {	//1)원래 간단소개가 있었는데 삭제함  2)원래 간단소개가 없었고 추가안함
			
			//간단소개가 db에 있었는지 없었는지 확인
			int chkRsmIntro = resumeMapper.findRsmIntro(uRsmNo);
			
			//간단소개가 db에 있었음
			if(chkRsmIntro > 0) {
				//원래 db에 있던 간단소개 빈값으로 바꾸기(update '')
				int chkDeleteRsmIntro = resumeMapper.deleteRsmIntro(uRsmNo);
				if(chkDeleteRsmIntro > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		//1)원래 직무가 없었는데 수정할 때 추가함
		//2)원래 직무가 있었고 수정할 때 수정함 
		if(positionVO != null) {
			
			//직무가 db에 있었는지 없었는지 확인
			int chkPosiCnt = resumeMapper.findRsmPosition(uRsmNo);
			
			//직무가 db에 있었음
			if(chkPosiCnt > 0) {
				//원래 db에 있던 직무 삭제
				int chkDeleteRsmPosi = resumeMapper.deleteRsmPosition(uRsmNo);
				
				if(chkDeleteRsmPosi > 0) {
					String[] pstnArr = positionVO.getPstnArr(); //서버, 웹백엔드
					String[] pstnCateArr = positionVO.getPstnCateArr();	//category1, category23
					
					for(int i = 0; i < pstnArr.length; i++) {
						
						positionVO.setPstnCmmncdNm(pstnArr[i]);
						positionVO.setPstnCate(pstnCateArr[i]);
						
						positionVO.setRsmNo(uRsmNo); //이력서 번호 설정
						
						//resume 수정 할 때 입력한 개발직무 insert
						int positionCnt = resumeMapper.insertResumePosition(positionVO);
						if(positionCnt > 0) {
							result = ServiceResult.OK;
						}else {
							result = ServiceResult.FAILED;
							return result;
						}
					}
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}else { //직무가 db에 없었음
				String[] pstnArr = positionVO.getPstnArr(); //서버, 웹백엔드
				String[] pstnCateArr = positionVO.getPstnCateArr();	//category1, category23
				
				for(int i = 0; i < pstnArr.length; i++) {
					
					positionVO.setPstnCmmncdNm(pstnArr[i]);
					positionVO.setPstnCate(pstnCateArr[i]);
					
					positionVO.setRsmNo(uRsmNo); //이력서 번호 설정
					
					//resume 수정 할 때 입력한 개발직무 insert
					int positionCnt = resumeMapper.insertResumePosition(positionVO);
					if(positionCnt > 0) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
		}else {	//1)원래 직무가 있었는데 삭제함  2)원래 직무가 없었고 추가안함
			
			//직무가 db에 있었는지 없었는지 확인
			int chkPosiCnt = resumeMapper.findRsmPosition(uRsmNo);
			
			//직무가 db에 있었음
			if(chkPosiCnt > 0) {
				//원래 db에 있던 직무 삭제
				int chkDeleteRsmPosi = resumeMapper.deleteRsmPosition(uRsmNo);
				if(chkDeleteRsmPosi > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		//1)원래 포트폴리오 url 데이터가 없었는데 수정할 때 추가함
		//2)원래 포트폴리오 url 데이터가 있었고 수정할 때 수정함
		if(portUrlVOList != null) {
			//포트폴리오 url이 db에 있었는지 없었는지 확인
			int chkPortUrlCnt = resumeMapper.findRsmPortfolioUrl(uRsmNo);
			//포트폴리오 url이 db에 있었음
			if(chkPortUrlCnt > 0) {
				//원래 db에 있던 url 삭제
				int chkDeleteRsmPortUrl = resumeMapper.deleteRsmPortfolioUrl(uRsmNo);
				if(chkDeleteRsmPortUrl > 0) {
					for (PortfolioVO portfolioVO : portUrlVOList) {
						
						portfolioVO.setRsmNo(uRsmNo); //이력서 번호 설정
						
						int portCnt = resumeMapper.insertResumePortfolioUrl(portfolioVO);
						if(portCnt > 0) {
							result = ServiceResult.OK;
						}else {
							result = ServiceResult.FAILED;
							return result;
						}
					}
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}else { //포트폴리오 url이 db에 없었음
				for (PortfolioVO portfolioVO : portUrlVOList) {
					
					portfolioVO.setRsmNo(uRsmNo); //이력서 번호 설정
					
					int portCnt = resumeMapper.insertResumePortfolioUrl(portfolioVO);
					if(portCnt > 0) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
		}else { //1)원래 포트폴리오 url이 있었는데 삭제함  2)원래 포트폴리오 url이 없었고 추가안함
			//포트폴리오 url이 db에 있었는지 없었는지 확인
			int chkPortUrlCnt = resumeMapper.findRsmPortfolioUrl(uRsmNo);
			//포트폴리오 url이 db에 있었음
			if(chkPortUrlCnt > 0) {
				//원래 db에 있던 url 삭제
				int chkDeleteRsmPortUrl = resumeMapper.deleteRsmPortfolioUrl(uRsmNo);
				if(chkDeleteRsmPortUrl > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		//1)원래 포트폴리오 file 데이터가 없었는데 수정할 때 추가함
		//2)원래 포트폴리오 file 데이터가 있었는데 수정할 때 지우고 다시 추가함
		//3)원래 포트폴리오 file 데이터가 있었는데 수정할 때 안지우고 새로 추가함
		if(portFile != null) { //file을 추가했다는 것
			
			portFileVO.setRsmNo(uRsmNo); //이력서 번호 설정
			
			//fileTtlList에 데이터가 무조건 있음
			List<String> portFileTtlList = portFileVO.getPortFileTtlList();
			for(String fileTtl : portFileTtlList) {
				
				portFileVO.setPortFileTtl(fileTtl);
				
				//넘어온 fileTtl 데이터가 이미 db에 있는 이름인지 확인
				int chkExistFile = resumeMapper.findRsmPortfolioFileTtl(portFileVO);
				if(chkExistFile <= 0) { //새로 추가된 파일이라는 것. db에 넣어야됨
					try {
						for(MultipartFile portfolioFile : portFile) {
							//resume수정할 때 업로드한 포트폴리오 파일 이름 insert
							int portFileCnt = resumeMapper.insertResumePortfolioFileTtl(portFileVO);
							
							if(portFileCnt > 0) {
								String fileSrcNo = portFileVO.getPortFileNo(); //파일번호를 보냄
								String orgnCmmncd = "이력서포트폴리오파일";
								AtchFileVO atchFileVO = new AtchFileVO(portfolioFile, req, fileSrcNo, orgnCmmncd);
								atchFileVO.setFileSrcNo(fileSrcNo);
								atchFileVO.setOrgnCmmncd(orgnCmmncd);;
								//resume수정할 때 업로드한 포트폴리오 파일 insert
								fileMapper.atchFileInsert(atchFileVO);
							}
						}
					}catch (Exception e) {
						result = ServiceResult.FAILED;
						return result;
					}
					
					List<String> selectPortFileTtlList = new ArrayList<String>(); 
					//새로 추가된 파일까지 모두 insert된 후에
					//db에 있는 fileTtlList사이즈와 수정하기를 눌러서 넘어온 fileTtlList 사이즈랑 비교
					selectPortFileTtlList = resumeMapper.selectRsmPortFileTtl(uRsmNo);
					
					//사이즈가 다르면, 기존에 있던 file을 삭제했다는 것
					if(portFileTtlList.size() != selectPortFileTtlList.size()) {
						for(String fileNm : selectPortFileTtlList) {
							if(!portFileTtlList.contains(fileNm)) {
								portFileVO.setPortFileTtl(fileNm);
								//지워야 할 portFileNo 찾기
								String portFileNo = resumeMapper.selectRsmPortFileVO(portFileVO);
								//atch에 있는 file 삭제
								int deleteAtchCnt = resumeMapper.deleteRsmAtchPortfolioFile(portFileNo);
								if(deleteAtchCnt > 0) {
									//resume_portfoliofile에 있는 file 삭제
									int deleteFileCnt = resumeMapper.deleteRsmPortFile(portFileNo);
									if(deleteFileCnt > 0) {
										result = ServiceResult.OK;
									}else {
										result = ServiceResult.FAILED;
										return result;
									}
								}else {
									result = ServiceResult.FAILED;
									return result;
								}
							}
						}
					}
				}
			}
		}else { //portFile == null. 파일이 추가된 건 없음
			//1)원래 포트폴리오 file이 있었고 수정할 때 변동없이 그대로 제출
			//2)원래 포트폴리오 file이 있었고 수정할 때 여러개 중 몇 개만 삭제하고 추가는 안함
			if(portFileVO != null) {
				if(portFileVO.getPortFileTtlList().size() > 0) {
					
					System.out.println("ppppppp"+portFileVO.getPortFileTtlList().size());
					System.out.println("ppppppp"+portFileVO.getPortFileTtlList());
					
					for(String portFileTtl : portFileVO.getPortFileTtlList()) {
						
						portFileVO.setRsmNo(uRsmNo); //이력서 번호 설정
						
						List<String> selectPortFileTtlList = new ArrayList<String>(); 
						//db에 있는 fileTtlList사이즈와 수정하기를 눌러서 넘어온 fileTtlList 사이즈랑 비교
						selectPortFileTtlList = resumeMapper.selectRsmPortFileTtl(uRsmNo);
						
						//사이즈가 다르면, 기존에 있던 file을 삭제했다는 것
						if(portFileVO.getPortFileTtlList().size() != selectPortFileTtlList.size()) {
							for(String fileNm : selectPortFileTtlList) {
								if(!portFileVO.getPortFileTtlList().contains(fileNm)) {
									portFileVO.setPortFileTtl(fileNm);
									//지워야 할 portFileNo 찾기
									String portFileNo = resumeMapper.selectRsmPortFileVO(portFileVO);
									//atch에 있는 file 삭제
									int deleteAtchCnt = resumeMapper.deleteRsmAtchPortfolioFile(portFileNo);
									if(deleteAtchCnt > 0) {
										//resume_portfoliofile에 있는 file 삭제
										int deleteFileCnt = resumeMapper.deleteRsmPortFile(portFileNo);
										if(deleteFileCnt > 0) {
											result = ServiceResult.OK;
										}else {
											result = ServiceResult.FAILED;
											return result;
										}
									}else {
										result = ServiceResult.FAILED;
										return result;
									}
								}
							}
						}
					}
				}else { //portFileVO.getPortFileTtlList() == null
					//1)원래 포트폴리오 file이 있었고 수정할 때 모두 삭제함
					//2)원래 포트폴리오 file이 없었고 추가안함
					
					int chkDeleteRsmAtchPortFile = 0;
					List<String> beforePortFileNo = new ArrayList<>();
					//포트폴리오 file이 db에 있었는지 없었는지 확인
					int chkPortCnt = resumeMapper.findRsmPortfolioFile(uRsmNo);
					//포트폴리오 file이 db에 있었음
					if(chkPortCnt > 0) {
						//포트폴리오 file이 db에 있었으면 file_no를 모두 가져옴
						beforePortFileNo = resumeMapper.selectRsmPortFile(uRsmNo);
						
						for(String portFileNo : beforePortFileNo) {
							//원래 db에 있던 atch-이력서포트폴리오파일 삭제
							chkDeleteRsmAtchPortFile = resumeMapper.deleteRsmAtchPortfolioFile(portFileNo);
							
							if(chkDeleteRsmAtchPortFile > 0) {
								//원래 db에 있던 file 삭제
								int chkDeleteRsmPortFile = resumeMapper.deleteRsmPortfolioFile(uRsmNo);
								if(chkDeleteRsmPortFile > 0) {
									result = ServiceResult.OK;
								}else {
									result = ServiceResult.FAILED;
									return result;
								}
							}
						} 
					}
				}
			}
		}
		
		//1)원래 최종학력 데이터가 없었는데 수정할 때 추가함 
		//2)원래 최종학력 데이터가 있었고 수정할 때 수정함
		if(educationVO != null) {
					
			resumeVO.setEduEnd(educationVO.getEduEnd());
			resumeVO.setEduAcdmcr(educationVO.getEduAcdmcr());
			resumeVO.setEduNm(educationVO.getEduNm());
			resumeVO.setRsmMjrNm(educationVO.getRsmMjrNm());
			resumeVO.setGrade(educationVO.getGrade());
			resumeVO.setFull(educationVO.getFull());
			resumeVO.setRsmNo(uRsmNo);
			
			//resume수정할 때 입력한 최종학력 insert
			int eduEndCnt = resumeMapper.insertResumeEducation(resumeVO);
			if(eduEndCnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//수정할 때 경력 데이터가 != null이면, 등록할 때 경력을 선택한 이력서라는 것
		//경력 선택 시, 경력 사항을 입력하지 않으면 이력서 등록 자체가 불가능. 수정 또한 마찬가지
		//즉, 경력 이력서면) 무조건 경력(회사+프로젝트)이 1개는 이미 db에 있음
		//	   신입 입력서면) 무조건 경력이 없음
		//1)원래 경력 데이터가 있었고 수정할 때 수정함
		if(careerVOList != null) {
			
			int chkDeleteRsmCareerProject = 0;
			
			List<Object> beforeCareerNo = new ArrayList<>();
			//원래 db에 있던 프로젝트를 지우기 위해 기존 careerNo찾기
			beforeCareerNo = resumeMapper.findRsmCareerNo(uRsmNo);
			
			for(Object careerNo : beforeCareerNo) {
				//원래 db에 있던 경력-프로젝트 삭제
				chkDeleteRsmCareerProject = resumeMapper.deleteRsmCareerProject(Integer.parseInt(String.valueOf(careerNo)));
			}
			if(chkDeleteRsmCareerProject > 0) {
				//원래 db에 있던 경력-회사 삭제
				int chkDeleteRsmCareer = resumeMapper.deleteRsmCareer(uRsmNo);
				
				if(chkDeleteRsmCareer > 0) {
					for(CareerVO careerVO : careerVOList) {
						
						careerVO.setRsmNo(uRsmNo);
						
						resumeMapper.insertResumeCareer(careerVO);
						
						//경력 입력 할 때 무조건 프로젝트 한 개는 필수
						if(careerVO.getProjectData() != null) {
							
							List<ProjectCareerVO> projectVOList = careerVO.getProjectData();
							
							for(ProjectCareerVO projectVO : projectVOList) {
								
								projectVO.setCareerNo(careerVO.getCareerNo());
								
								int projectStatus = insertResumeProject(projectVO);
								if(projectStatus > 0 ) {
									result = ServiceResult.OK;
								}else {
									result = ServiceResult.FAILED;
									return result;
								}
							}
						}
					}
				}
			}else { //프로젝트 삭제 실패
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//1)원래 자격증이 없었는데 수정할 때 추가함
		//2)원래 자격증이 있었고 수정할 때 수정함 
		if(certVOList != null) {
			
			//자격증이 db에 있었는지 없었는지 확인
			int chkCertCnt = resumeMapper.findRsmCertificate(uRsmNo);
			
			//자격증이 db에 있었음
			if(chkCertCnt > 0) {
				
				//원래 db에 있던 자격증 삭제
				int chkDeleteRsmCert = resumeMapper.deleteRsmCertificate(uRsmNo);
				
				if(chkDeleteRsmCert > 0) {
					
					for (CertificateVO certVO : certVOList) {
						
						certVO.setRsmNo(uRsmNo); //이력서 번호 설정
						
						//resume수정할 때 입력한 자격증 insert
						int certCnt = resumeMapper.insertResumeCert(certVO);
						if(certCnt > 0) {
							result = ServiceResult.OK;
						}else {
							result = ServiceResult.FAILED;
							return result;
						}
					}
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}else { //자격증이 db에 없었음
					
				for (CertificateVO certVO : certVOList) {
					
					certVO.setRsmNo(uRsmNo); //이력서 번호 설정
					
					//resume수정할 때 입력한 자격증 insert
					int certCnt = resumeMapper.insertResumeCert(certVO);
					if(certCnt > 0) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
		}else {	//1)원래 자격증이 있었는데 삭제함  2)원래 자격증이 없었고 추가안함
			
			//자격증이 db에 있었는지 없었는지 확인
			int chkCertCnt = resumeMapper.findRsmCertificate(uRsmNo);
			
			//자격증이 db에 있었음
			if(chkCertCnt > 0) {
				//원래 db에 있던 자격증 삭제
				int chkDeleteRsmCert = resumeMapper.deleteRsmCertificate(uRsmNo);
				if(chkDeleteRsmCert > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		//1)원래 경험이 없었는데 수정할 때 추가함
		//2)원래 경험이 있었고 수정할 때 수정함 
		if(expVOList != null) {
			
			//경험이 db에 있었는지 없었는지 확인
			int chkExpCnt = resumeMapper.findRsmExperience(uRsmNo);
			
			//경험이 db에 있었음
			if(chkExpCnt > 0) {
				
				//원래 db에 있던 경험 삭제
				int chkDeleteRsmExp = resumeMapper.deleteRsmExperience(uRsmNo);
				
				if(chkDeleteRsmExp > 0) {
					
					for (ExperienceVO expVO : expVOList) {
						
						expVO.setRsmNo(uRsmNo); //이력서 번호 설정
						
						//resume수정할 때 입력한 경험 insert
						int expCnt = resumeMapper.insertResumeExp(expVO);
						if(expCnt > 0) {
							result = ServiceResult.OK;
						}else {
							result = ServiceResult.FAILED;
							return result;
						}
					}
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}else { //경험이 db에 없었음
				
				for (ExperienceVO expVO : expVOList) {
					
					expVO.setRsmNo(uRsmNo); //이력서 번호 설정
					
					//resume수정할 때 입력한 경험 insert
					int expCnt = resumeMapper.insertResumeExp(expVO);
					if(expCnt > 0) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			}
		}else {	//1)원래 경험이 있었는데 삭제함  2)원래 경험이 없었고 추가안함
			
			//경험이 db에 있었는지 없었는지 확인
			int chkExpCnt = resumeMapper.findRsmExperience(uRsmNo);
			
			//경험이 db에 있었음
			if(chkExpCnt > 0) {
				//원래 db에 있던 경험 삭제
				int chkDeleteRsmExp = resumeMapper.deleteRsmExperience(uRsmNo);
				if(chkDeleteRsmExp > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}
		}
		
		return result;
	}

	
	
	@Override
	public List<ResumeVO> selectAllResume(String accountId) {
		return resumeMapper.selectAllResume(accountId);
	}

	@Override
	public ResumeVO selectDeleteRsm(String rsmNo) {
		return resumeMapper.selectDeleteRsm(rsmNo);
	}

	@Override
	public ServiceResult deleteResume(ResumeVO resumeVO) {
		
		ServiceResult result = null;
		String dRsmNo = resumeVO.getRsmNo();
		
		//사용언어
		int langCnt = resumeMapper.deleteRsmLang(dRsmNo);
		if(langCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
			return result;
		}
		
		//직무가 db에 있었는지 없었는지 확인
		int chkPosiCnt = resumeMapper.findRsmPosition(dRsmNo);
		//직무가 db에 있었음
		if(chkPosiCnt > 0) {
			//원래 db에 있던 직무 삭제
			int chkDeleteRsmPosi = resumeMapper.deleteRsmPosition(dRsmNo);
			if(chkDeleteRsmPosi > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//포트폴리오 url이 db에 있었는지 없었는지 확인
		int chkPortUrlCnt = resumeMapper.findRsmPortfolioUrl(dRsmNo);
		//포트폴리오 url이 db에 있었음
		if(chkPortUrlCnt > 0) {
			//원래 db에 있던 url 삭제
			int chkDeleteRsmPortUrl = resumeMapper.deleteRsmPortfolioUrl(dRsmNo);
			if(chkDeleteRsmPortUrl > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//포트폴리오 파일
		int chkDeleteRsmAtchPortFile = 0;
		List<String> beforePortFileNo = new ArrayList<>();
		//포트폴리오 file이 db에 있었는지 없었는지 확인
		int chkPortCnt = resumeMapper.findRsmPortfolioFile(dRsmNo);
		//포트폴리오 file이 db에 있었음
		if(chkPortCnt > 0) {
			//포트폴리오 file이 db에 있었으면 file_no를 모두 가져옴
			beforePortFileNo = resumeMapper.selectRsmPortFile(dRsmNo);
			for(String portFileNo : beforePortFileNo) {
				//원래 db에 있던 atch-이력서포트폴리오파일 삭제
				chkDeleteRsmAtchPortFile = resumeMapper.deleteRsmAtchPortfolioFile(portFileNo);
				if(chkDeleteRsmAtchPortFile > 0) {
					//원래 db에 있던 file 삭제
					int chkDeleteRsmPortFile = resumeMapper.deleteRsmPortfolioFile(dRsmNo);
					if(chkDeleteRsmPortFile > 0) {
						result = ServiceResult.OK;
					}else {
						result = ServiceResult.FAILED;
						return result;
					}
				}
			} 
		}
		
		if(resumeVO.getRsmNewCareer().equals("경력")) {
			
			int chkDeleteRsmCareerProject = 0;
			
			List<Object> beforeCareerNo = new ArrayList<>();
			//원래 db에 있던 프로젝트를 지우기 위해 기존 careerNo찾기
			beforeCareerNo = resumeMapper.findRsmCareerNo(dRsmNo);
			
			for(Object careerNo : beforeCareerNo) {
				//원래 db에 있던 경력-프로젝트 삭제
				chkDeleteRsmCareerProject = resumeMapper.deleteRsmCareerProject(Integer.parseInt(String.valueOf(careerNo)));
			}
			if(chkDeleteRsmCareerProject > 0) {
				//원래 db에 있던 경력-회사 삭제
				int chkDeleteRsmCareer = resumeMapper.deleteRsmCareer(dRsmNo);
				if(chkDeleteRsmCareer > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
					return result;
				}
			}else { //프로젝트 삭제 실패
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//자격증이 db에 있었는지 없었는지 확인
		int chkCertCnt = resumeMapper.findRsmCertificate(dRsmNo);
		//자격증이 db에 있었음
		if(chkCertCnt > 0) {
			//원래 db에 있던 자격증 삭제
			int chkDeleteRsmCert = resumeMapper.deleteRsmCertificate(dRsmNo);
			if(chkDeleteRsmCert > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//경험이 db에 있었는지 없었는지 확인
		int chkExpCnt = resumeMapper.findRsmExperience(dRsmNo);
		//경험이 db에 있었음
		if(chkExpCnt > 0) {
			//원래 db에 있던 경험 삭제
			int chkDeleteRsmExp = resumeMapper.deleteRsmExperience(dRsmNo);
			if(chkDeleteRsmExp > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
				return result;
			}
		}
		
		//이력서 삭제
		int rsmDelete = resumeMapper.deleteResume(dRsmNo);
		if(rsmDelete > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
			return result;
		}
		
		return result;
	}
	
}
