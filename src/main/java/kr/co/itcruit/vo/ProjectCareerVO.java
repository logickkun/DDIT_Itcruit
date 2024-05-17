package kr.co.itcruit.vo;

import lombok.Data;

@Data
/**
 * 이력서-경력사항-프로젝트경력
 * @author 김나혜
 *
 */
public class ProjectCareerVO {
	private int projNo;			//프로젝트 번호
	private int careerNo;		//경력번호(fk)
	private String projNm;		//프로젝트 이름
	private String projDtlCn;	//상세내용

}
