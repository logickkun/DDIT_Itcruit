package kr.co.itcruit.vo;

import lombok.Data;

@Data
public class EntScoreVO {

	 private int entScrNo;	// 평가번호
	 private int entNo;	// 기업번호
	 private String accountId;	// 아이디
	 private int entScrTscr;	// 총점
	 private String entScrEvl; // 한줄평
	 private String entScrAdvantage; // 장점
	 private String entScrWeakness; // 단점
	 private String entScrWish; // 바라는점
	 private int entScrPromotion; // 승진가능성
	 private int entScrWelfare; // 복지 및 급여
	 private int entScrWnl; // 워라벨
	 private int entScrCulture; // 사내문화
	 private int entScrManagement; // 경영진
	 private String entScrCeoevl; // CEO평가
	 private String entScrFutureCmmncd; // 1년후 미래
	 private String entScrRcmdYn; // 추천
	 private String pstnCmmncd; // 직무분야
	 private String hireCmmncd; // 고용형태
	 private String workStts; // 근무상태
	 private String entScrDate; // 작성일자
	 private int entScrLikeCount; // 도움이되요 갯수
	 
	 private int reviewCount; // 리뷰 총 갯수
	 
	 private double avgTscr; // 총점 평균
	 private double avgPromotion; // 승진가능성 평균
	 private double avgWelfare; // 복지급여 평균
	 private double avgWnl; // 워라벨 평균
	 private double avgCulture; // 사내문화 평균
	 private double avgManagement; // 경영진 평균
	 
	 private int entScrRcmdY; // 기업 추천 카운트
	 private int entScrRcmdN; // 기업 비추천 카운트
	 private int entScrCeoGood; // CEO 지지 카운트
	 private int entScrCeoBad; // CEO 비지지 카운트
	 private int entScrFutureY; // 1년후 성장 카운트
	 private int entScrFutureN; // 1년후 비성장 카운트
	 
	 
	 
}
