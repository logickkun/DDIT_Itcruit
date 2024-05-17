package kr.co.itcruit.vo;

import lombok.Data;

@Data
/**
 * 이력서-경험
 * @author 김나혜
 *
 */
public class ExperienceVO {
	private int experNo;			//경험번호
	private String rsmNo;				//이력서번호(fk)
	private String experNm;			//경험명
	private String experType;		//이력구분
	private String experCoNm;		//회사/기관/단체명
	private String experCn;			//경험내용
	private String experBgngYm;		//시작년월
	private String experEndYm;		//종료년월
	private String experPrgrsYn;	//진행여부
	
	//화면에서
	private String etcYear1;		//앞에 연도
	private String etcMonth1;		//앞에 월
	private String etcYear2;		//뒤에 연도
	private String etcMonth2;		//뒤에 월
	private String proceeding;		//진행중여부
	private String etcName;			//경험명
	private String etcOrganization;	//기관명
	private String etcInfo;			//상세내용

}
