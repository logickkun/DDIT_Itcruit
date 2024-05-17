package kr.co.itcruit.mapper;

import java.util.List;
import java.util.Map;

import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.AvailLangListVO;
import kr.co.itcruit.vo.CareerVO;
import kr.co.itcruit.vo.CertificateVO;
import kr.co.itcruit.vo.ExperienceVO;
import kr.co.itcruit.vo.PortfolioFileVO;
import kr.co.itcruit.vo.PortfolioVO;
import kr.co.itcruit.vo.PositionVO;
import kr.co.itcruit.vo.ProjectCareerVO;
import kr.co.itcruit.vo.ResumeVO;

public interface IResumeMapper {

	//resume 등록하려는 회원정보 가져오기
	public AccountVO selectMember(String accountId);

	//resume 기술스택(사용언어) dropdown list 가져오기
	public List<Map<String, Object>> langList(Map<String, Object> paramMap);

	public List<ResumeVO> selectResume(String accountId);

	//resume등록할 때 이력서번호, 회원id, 성별, 이력서제목, 신입경력여부, 연차, 이력서공개여부 작성한거 insert
	public int insertResume(ResumeVO resumeVO);

	//resume등록할 때 필수로 받는 기술스택(사용언어)의 공통코드 가져오기
	public String selectCommncdLang(String cmmncdGrpNm);
	//resume등록할 때 필수로 받는 기술스택(사용언어) insert
	public int insertResumeLang(AvailLangListVO availLangVO);
	//resume등록할 때 업로드한 이미지 사진 insert
	public int insertResumePhoto(ResumeVO resumeVO);
	//resume등록할 때 입력한 간단소개 insert
	public int insertResumeIntro(ResumeVO resumeVO);
	//resume등록할 때 입력한 개발직무의 공통코드 가져오기
	public String selectCommncdPosition(String pstnArr);
	//resume등록할 때 입력한 개발직무 insert
	public int insertResumePosition(PositionVO positionVO);
	//resume등록할 때 입력한 포트폴리오 url insert
	public int insertResumePortfolioUrl(PortfolioVO portfolioVO);
	//resume등록할 때 업로드한 포트폴리오 파일 이름 insert
	public int insertResumePortfolioFileTtl(PortfolioFileVO portFileVO);
	//resume등록할 때 입력한 최종학력 insert
	public int insertResumeEducation(ResumeVO resumeVO);
	
	//resume등록할 때 경력 insert하기 전에 이미 insert된 경력인지 확인
	public int checkCareerDuplicate(CareerVO careerVO);
	//resume등록할 때 입력한 경력 insert
	public int insertResumeCareer(CareerVO careerVO);
	//resume등록할 때 입력한 경력-프로젝트 insert
	public int insertResumeCareerProject(ProjectCareerVO projectVO);

	//resume등록할 때 입력한 자격증 insert
	public int insertResumeCert(CertificateVO certVO);
	//resume등록할 때 입력한 경험 insert
	public int insertResumeExp(ExperienceVO expVO);

	// 이력서 확인
	public List<ResumeVO> checkResume(String accountId);

	//회원마이페이지에서 본인 이력서 제목 클릭 후 확인하려고 할 때. rsmNo로 정보를 불러옴
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

	//수정 - 필수 입력값 중 기본정보들은 업데이트
	public int updateDefaultRsmInfo(ResumeVO resumeVO);
	//수정 - 필수 입력값 중 사용언어는 원래 있던 데이터 먼저 삭제
	public int deleteRsmLang(String uRsmNo);
	//수정 - 간단소개가 db에 있었는지 없었는지 확인
	public Integer findRsmIntro(String uRsmNo);
	//수정 - 원래 db에 있던 간단소개 빈값으로 바꾸기(update '')
	public int deleteRsmIntro(String uRsmNo);
	//수정 - 직무가 db에 있었는지 없었는지 확인
	public int findRsmPosition(String uRsmNo);
	//수정 - 원래 db에 있던 직무 삭제
	public int deleteRsmPosition(String uRsmNo);
	//수정 - 자격증이 db에 있었는지 없었는지 확인
	public int findRsmCertificate(String uRsmNo);
	//수정 - 원래 db에 있던 자격증 삭제
	public int deleteRsmCertificate(String uRsmNo);
	//수정 - 경험이 db에 있었는지 없었는지 확인
	public int findRsmExperience(String uRsmNo);
	//수정 - 원래 db에 있던 경험 삭제
	public int deleteRsmExperience(String uRsmNo);
	//수정 - 원래 db에 있던 프로젝트를 지우기 위해 기존 careerNo찾기
	public List<Object> findRsmCareerNo(String uRsmNo);
	//수정 - 원래 db에 있던 경력-프로젝트 삭제
	public int deleteRsmCareerProject(Object careerNo);
	//수정 - 원래 db에 있던 경력-회사 삭제
	public int deleteRsmCareer(String uRsmNo);
	//수정 - 포트폴리오 url이 db에 있었는지 없었는지 확인
	public int findRsmPortfolioUrl(String uRsmNo);
	//수정 - 원래 db에 있던 url 삭제
	public int deleteRsmPortfolioUrl(String uRsmNo);
	//수정 - 포트폴리오 file이 db에 있었는지 없었는지 확인
	public int findRsmPortfolioFile(String uRsmNo);
	//수정 - 포트폴리오 file이 db에 있었으면 file_no를 모두 가져옴
	public List<String> selectRsmPortFile(String uRsmNo);
	//수정 - 원래 db에 있던 atch-이력서포트폴리오파일 삭제
	public int deleteRsmAtchPortfolioFile(Object portFileNo);
	//수정 - 원래 db에 있던 file 삭제
	public int deleteRsmPortfolioFile(String uRsmNo);
	//수정 - 넘어온 fileTtl 데이터가 이미 db에 있는 이름인지 확인
	public int findRsmPortfolioFileTtl(PortfolioFileVO portFileVO);
	//수정 - db에 있는 fileTtlList사이즈와 수정하기를 눌러서 넘어온 fileTtlList 사이즈랑 비교
	public List<String> selectRsmPortFileTtl(String uRsmNo);
	//수정 - 지워야 할 portFileNo 찾기
	public String selectRsmPortFileVO(PortfolioFileVO portFileVO);
	//수정 - resume_portfoliofile에 있는 file 삭제
	public int deleteRsmPortFile(String portFileNo);
	// 선호직무
	public List<ResumeVO> selectAllResume(String accountId);
	//수정 - 사진이 db에 있었는지 없었는지 확인
	public int findRsmPhoto(String uRsmNo);
	//수정 - 원래 db에 있던 사진 빈값으로 바꾸기(update '')
	public int deleteRsmPhoto(String uRsmNo);
	//삭제 - 지울 resume select
	public ResumeVO selectDeleteRsm(String rsmNo);
	//삭제 - 이력서 삭제
	public int deleteResume(String dRsmNo);



}
