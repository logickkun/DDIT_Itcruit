package kr.co.itcruit.vo;

import java.util.List;

import lombok.Data;

@Data
public class StatVO {
	
	List<RecruitApplicantVO> applyDateStat;
	List<LogRecruitTableVO> applyHitStat;
	List<ApplicantPassStatVO> applyPassStat;
	List<ApplicantCareerStatVO> applyCareerStat;
	List<ApplicantGenderStatVO> applyGenderStat;
	List<ApplicantEduStatVO> applyEduStat;

}
