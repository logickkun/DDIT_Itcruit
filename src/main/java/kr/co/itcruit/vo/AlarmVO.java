package kr.co.itcruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmVO {
	
	private int alarmNo;		
	private String alarmRcvr;		//받는사람
	private String alarmSndr;		//보낸사람
	private String readYn;			//확인여부
	private String alarmCn;			//알림내용
	private String alarmUrl;		//알림url
	private Date alarmTime;			//알림시간
	private String alarmCtgry;		//알림주제(채용공고/인재제안)
	private String alarmTtl;		//채용공고 일 때, 공고 제목
	
	private int entNo;				//기업번호
	private String rprsTelno;		//기업대표전화번호
	private boolean isPass;
	private String accountNm;
	
	public AlarmVO() {}

	public AlarmVO(int alarmNo) 
	{
		this.alarmNo = alarmNo;
		
	}
	
	public AlarmVO(String alarmRcvr, String alarmSndr, 
					String alarmCn, Date alarmTime, 
					String alarmCtgry, String alarmTtl
					) {
		
		this.alarmRcvr = alarmRcvr;
		this.alarmSndr = alarmSndr;
		this.alarmCn = alarmCn;
		this.alarmTime = alarmTime;
		this.alarmCtgry = alarmCtgry;
		this.alarmTtl = alarmTtl;
		
	}
	
}