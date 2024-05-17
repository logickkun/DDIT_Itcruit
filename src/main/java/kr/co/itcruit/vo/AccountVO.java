package kr.co.itcruit.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AccountVO {
	private String applyNo;				//회사 이름
	private String eachProcessNo;
	private int processSeq;
	private String passYn;				// 합격 여부.
	private String entNm;

	private int rsmCareerYear;			//경력
	private String accountId; 			// 아이디 loginId
	private int entNo;
	private String kakaoId;				// 카카오 랜덤아이디
	
	private String accountNm;			// 회원명(가입명)
	private String accountNick;			// 닉네임
	private String accountMail;			// 이메일
	private String accountTell;			// 전화번호
	private String accountZip;			// 우편번호
	private String accountAddr1;		// 주소
	private String accountAddr2;		// 상세주소
	private String accountPswd;			// 비밀번호
	private String enabled;				// enabled
	private String authCmmncd;			// 계정권한s
	private Date joinYmd;				// 가입일
	private String accountSttsCmmncd;	// 계정상태
	private String socialName;			// 소셜가입(kakao, naver, null)
	
	private String rsmNo;				// 이력서번호
	private Date birthYmd;				// 생년월일
	private String birthY;				// 출생연도
	private String gender;				// 성별
	
	
	//기업코딩테스트 맞은 문항, 제줄 문항의 수 구하기
	private int correctCount;
	private int submitCount;
	private int entCodingtestNo;
	
//	account_id,
//    apply_no,
//    process_seq,
//    recruit_no,
//    each_order,
//    pstn_cmmncd_nm,
//    pass_yn,
	private String recruitNo;
	private int eachOrder; 
	private String pstnCmmncdNm;
	
	private List<EntCodingtestVO> ansrList;	
//	  ecqa.ent_codingtest_no,
//    ecqa.ent_codingtest_no_order,
//    ecqa.pass_yn ct_pass_yn는 리스트 형식으로 1:N

	
	private String token;
	
	
	List<AccountAuthVO> authList;
	
	
	List<String> accountIds; // 아이디값을 배열형태로 받을 필드명 
	
	private int ranking;	
	private int codingtestScore;
	private List<CodepowerVO> codePower;
	
	
	public void setBirthYmd(String birthYmd) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            try {
				this.birthYmd = dateFormat.parse(birthYmd);
			} catch (ParseException e) {
				e.printStackTrace();
			}
    }
	
}