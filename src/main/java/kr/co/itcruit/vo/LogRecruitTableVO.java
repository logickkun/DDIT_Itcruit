package kr.co.itcruit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LogRecruitTableVO {
	
	private Date logDate;
	private String recruitNo;
	private String pstnCmmncdNm;
	private int increaseCount;

}
