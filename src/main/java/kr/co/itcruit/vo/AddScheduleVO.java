package kr.co.itcruit.vo;

import lombok.Data;

@Data
public class AddScheduleVO {
	private String skedNm;
	private String skedStrtYmd;
	private String skedEndYmd;
	private String skedColor;
	private String skedTxtColor;
	private String skedCn;
	private String accountId;
	private int skedNo;
}
