package kr.co.itcruit.resume.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.itcruit.ServiceResult;
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

public interface IResumeService {

	//resume 등록하려는 회원정보 가져오기
	public AccountVO selectMember(String accountId);

	//resume 기술스택(사용언어) dropdown list 가져오기
	public List<Map<String, Object>> langList(Map<String, Object> paramMap);

	public List<ResumeVO> selectResume(String accountId);

	//resume등록할 때 이력서번호, 회원id, 성별, 이력서제목, 신입경력여부, 연차, 이력서공개여부 작성한거 insert 후 기술스택(사용언어) insert
	public ServiceResult insertResume(HttpServletRequest req, ResumeVO resumeVO
			, AvailLangListVO availLangListVO, PositionVO positionVO
			, List<PortfolioVO> portUrlVOList, PortfolioFileVO portFileVOList, EducationVO educationVO
			, List<CareerVO> careerVOList, List<ProjectCareerVO> projectVOList
			, List<CertificateVO> certVOList, List<ExperienceVO> expVOList, MultipartFile[] portFile);

	// 이력서 확인
	public List<ResumeVO> checkResume(String accountId);

	//회원마이페이지에서 resume 제목 눌러서 본인이 작성한 resume 보고, 수정하는 페이지로 이동
	//기본정보, 학력, 사용언어 select
	public List<ResumeVO> selectExistingResume(String rsmNo);
	//직무 select
	public List<ResumeVO> selectPositionResume(String rsmNo);
	//경력, 프로젝트 select
	public List<CareerVO> selectCareerProject(String rsmNo);
	//포트폴리오 url select
	public List<PortfolioVO> selectPortUrl(String rsmNo);
	//포트폴리오 file select
	public List<AtchFileVO> selectPortFile(String rsmNo);
	//자격증 select
	public List<CertificateVO> selectCert(String rsmNo);
	//경험 select
	public List<ExperienceVO> selectExp(String rsmNo);
	//사진 select
	public ResumeVO selectRsmPhoto(String rsmNo);

	
	//resume 수정
	public ServiceResult updateResume(HttpServletRequest req, ResumeVO resumeVO, AvailLangListVO availLangListVO,
			PositionVO positionVO, List<PortfolioVO> portUrlVOList, PortfolioFileVO portFileVO, EducationVO educationVO,
			List<CareerVO> careerVOList, List<CertificateVO> certVOList, List<ExperienceVO> expVOList,
			MultipartFile[] portFile);

	// 추천공고할때 직무가져오기
	public List<ResumeVO> selectAllResume(String accountId);
	//삭제 - 지울 resume select
	public ResumeVO selectDeleteRsm(String rsmNo);
	//삭제 - resume 항목들 delete
	public ServiceResult deleteResume(ResumeVO resumeVO);


}
