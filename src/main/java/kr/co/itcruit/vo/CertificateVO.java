package kr.co.itcruit.vo;

import lombok.Data;

@Data
/**
 * 이력서-자격증
 * @author 김나혜
 *
 */
public class CertificateVO {
	private int crtfctSeq;				//자격증시퀀스
	private String rsmNo;					//이력서번호(fk)
	private String crtfctNm;			//자격증명
	private String crtfctNo;			//자격증번호
	private String crtfctQlfcAcqsYm;	//자격증취득일자
	private String crtfctPblcnInstNm;	//발행기관명
	
	private String certificateYear;
	private String certificateMonth;
	private String certificateName;
	private String certificateNo;
	private String certificatePublisher;
	
}
