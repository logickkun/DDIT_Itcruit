package kr.co.itcruit.vo;

import lombok.Data;

@Data
public class RecruitStatsVO {

	private int totalRecruit; // 총 채용 공고 수
	private int regularCount; // 정규직 채용 수
	private int careerCount; // 경력직 카운트 수
	private int newCareerCount; // 신입 카운트 수
	private int nothingCount; // 경력무관 카운트
	
	
	
	
}
