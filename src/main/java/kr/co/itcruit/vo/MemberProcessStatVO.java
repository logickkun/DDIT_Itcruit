package kr.co.itcruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberProcessStatVO {
	
	//프로세스별 진행 상황
	private String eachOrder;
	private String passYn;
	private String clsNm;

	private int processSeq;	
	private int entCodingtestNo;
	
	
	private String strtDt;
	private String endDt;
}
