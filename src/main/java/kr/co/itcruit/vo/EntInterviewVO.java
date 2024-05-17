package kr.co.itcruit.vo;

import lombok.Data;

@Data
public class EntInterviewVO {

	 private int rvwNo;	// 후기번호
	 private int entNo;	// 기업번호
	 private String accountId;	// 회원아이디
	 private String rvwCourse; // 면접경로
	 private String rvwExperience; // 면접경험
	 private String rvwCrs; // 과정요약
	 private String rvwQue; // 면접 질문
	 private String rvwAns; // 면접 답변
	 private String rvwCmmncd; // 직무
	 private String rvwIntYmd; // 면접일자
	 private String rvwAnnYmd; // 발표일자
	 private int rvwLevel;	// 난이도
	 private String rvwStts; // 합격상태
	 private String rvwYmd; // 작성일
	 
	 private int rvwLikeCount; // 후기 좋아요 카운트
	 
	 private int rvmCount; // 총 리뷰 수
	 
	 private double avgLevel; // 평균 난이도
	 
	 private int rvwExperiencePositiveCount; // 면접경험 긍정적 카운트
	 private int rvwExperienceNormalCount; // 면접경험 보통 카운트
	 private int rvwExperienceNegativeCount; // 면접경험  부정적 카운트
	 
	 private int rvwSttsPass; // 면접합격 카운트
	 private int rvwSttsWaiting; // 면접대기 카운트
	 private int rvwSttsNotPass; // 면접불합격 카운트
	 
	 private int rvwCourseOnline; // 면접경로 온라인지원 카운트
	 private int rvwCourseFriend; // 면접경로 지인추천 카운트
	 private int rvwCourseHeadHunter; // 면접경로 헤드헌터 카운트
	 private int rvwCoursePublic; // 면접경로 공개채용 카운트
	 private int rvwCourseSchool; // 면접경로 학교 취업지원 카운트	 
	 private int rvwCourseEtc; // 면접경로 기타 카운트	 
	 
	 
}
