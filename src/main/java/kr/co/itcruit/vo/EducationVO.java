package kr.co.itcruit.vo;

import lombok.Data;

@Data
public class EducationVO {
	
	private String eduEnd;			    //졸업(예정)일
	private String eduAcdmcr;		    //학력구분
	private String eduNm; 			    //학교명
	private double grade;				    //학점
	private double full;				    //만점
	private String rsmMjrNm;		    //주전공
	private String rsmMjrCd;		    //부전공

}
