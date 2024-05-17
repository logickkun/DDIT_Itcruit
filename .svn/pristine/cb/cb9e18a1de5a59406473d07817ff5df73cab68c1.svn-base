package kr.co.itcruit.vo;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RecruitVO {
	
	private String recruitNo;						// 공고번호
	private int entNo;								// 기업번호
	private String recruitTtl; 						// 공고제목
	private String recruitStrtDt; 					// 공고 시작일
	private String recruitEndDt; 					// 공고 종료일
	private String recruitPay; 						// 공고 연봉
	private String entUrl; 							// 공고 URL
	private String cmmncdGrpCd; 					// 근무지
	private String cmmncdNm1; 						// 상세 근무지
	private String pstnCmmncdNm;					// 모집 분야
	private String processYn;						// 프로세스 신청 여부
	private int processAmt;							// 프로세스 비용
	private int recruitHit;							// 모집공고 클릭수
	private String recruitCareerCodeNm;				// 지원 자격 (신입/경력/경력무관/)
	private String recruitCareerDt;					// 경력 기간
	private MultipartFile[] recruitFile;			// 공고 파일
	private String recruitYn;						// 수시채용여부
	private int recruitCnt;							// 채용 인원
	private int entPostcode;						// 우편번호(업데이트전용)
	private String entNm;							// 기업 이름
	private String deadLineDay;						// Dday
	private int processOrder;
	private int processPrice;
	private String processName;
	private String recruitStatus;
	private int entApply;
	private String rsmNo;
	
	
	private String accountId;						// 회원아이디
	private String resumeCheck;						// 이력서 유무 체크
	private String applicantCheck;					// 채용신청 유무 체크
	private String esntlLangCmmncdNm;				// 필수 조건
	private String preferLangCmmncdNm;				// 우대 조건
	private String hireCmmncdNm; 					// 고용형태
	private String recruitEnrollYmd;				// 등록일
	
	private List<String> esntlLangCmmncdNms;		// 필수 조건 클라이언트에서 받음
	private List<String> preferLangCmmncdNms;		// 우대 조건 클라이언트에서 받음
	private List<String> hireCmmncdNms; 			// 고용형태 클라이언트에서 받음
	
	private List<HireSttsVO> hireSttsList; 			// 고용형태 클라이언트에서 받음
	private List<PreferLangVO> PreferLangList; 		// 고용형태 클라이언트에서 받음
	private List<EsntlLangVO> esntlLangList; 		// 고용형태 클라이언트에서 받음
	
	private int flag;							// sql쿼리 머지 업데이트 딜리트 인서트 카운트 전용 필드
	
	private Map<String, String> hireType; 	// 중복 제거한 고용형태 
	private Map<String, String> esntlType;	// 중복 제거한 필수언어
	private Map<String, String> preferType; // 중복 제거한 우대언어
	
	
	
	private int[] order;
	private int[] price;
	private String[] Name;
	
	
	private String endDt; // 마감 날짜 문자열로 받는 필드명
	private String strtDt; // 채용 시작 날짜 문자열로 받는 필드명
	
	private String lang;	//공고 검색시 검색조건으로 사용할 필드
	private String time;	//공고 검색시 검색조건으로 사용할 필드
	
	private int stlmAmt;	// 결제 비용

}
