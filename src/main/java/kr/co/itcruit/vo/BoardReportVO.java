package kr.co.itcruit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReportVO {
	 private int reportNo;				// 신고번호
	 private String bbsReportId;		// 신고자
	 private String bbsReportCmmncd;	// 신고사유
	 private String bbsNo;				// 글번호
	 private int cmmtNo;				// 댓글번호
	 private String writeId;			// 원글작성자
	 private Date reportYmd;			// 신고일자
	 private String handlingYn;			// 신고처리여부
	 
	 
	 private String accountId;    // 작성자 id
	 
	 private int bssCmntNo;
	 private String bssCmntTm;
	 private String bssCmntCn;
	 private String bssCmntWriter;
	 private String bssCmntDelyn;

}
