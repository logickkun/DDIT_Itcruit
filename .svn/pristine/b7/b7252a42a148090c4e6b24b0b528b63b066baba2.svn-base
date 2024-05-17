package kr.co.itcruit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
/**
 * 이력서
 * @author 김나혜
 *
 */
public class ResumeVO {
	
	private String rsmNo;				    //이력서번호
	private String accountId;		    //아이디(fk)
//	private Date birthYmd;			    //생년월일 -> 삭제
	private String rsmGender;		    //성별
	                                    
	private String rsmTtl;			    //이력서제목
	private String rsmNewCareer;	    //신입 or 경력
	private int rsmCareerYear;		    //경력연차
	private String rsmRlsYn;		    //공개여부
	                                    
	private MultipartFile rsmPhoto;		//사진
	private byte[] rsmPhotoByte;		//사진
	
	private String rsmPhotoPath;	    //사진경로
	
	private MultipartFile photoFile;	//사진	
	                                    
	private String rsmIntroduction;	    //간단소개
	                                    
	private String eduEnd;			    //졸업(예정)일
	private String eduAcdmcr;		    //학력구분
	private String eduNm; 			    //학교명
	private double grade;				    //학점
	private double full;				    //만점
	private String rsmMjrNm;		    //주전공
	private String rsmMjrCd;		    //부전공
	
	private List<PositionVO> rsmPositionVO; 						//개발직무
	private List<AvailLangListVO> availLangVOList;		//기술스택 회원마이페이지-이력서관리탭-이력서 목록 보여줄 때
//	private List<PortfolioVO> portUrlVO;				//포트폴리오 url
//	private List<PortfolioFileVO> rsmPortFileVO;					//포트폴리오 파일
//	private EducationVO eduVO;							//최종학력
//	private List<CareerVO> careerVO;					//경력
//	private List<ProjectCareerVO> projectVO;			//프로젝트
//	private List<CertificateVO> certificate;			//자격증
//	private List<ExperienceVO> etcHistories;	//경험
	private String authCmmncd;			// 계정권한
}
