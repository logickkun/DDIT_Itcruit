package kr.co.itcruit.vo;

import java.util.List;

import lombok.Data;

/**
 * @author KHT
 * 
 * 채용달력에 선택 카테고리 가져오기 위한 VO
 * 
 * 지역
 * 언어
 * 직무
 * 상세지역
 *	
 */
@Data
public class CalInfoListVO {

	private List<String> pstnCmmncdNm; //직무
	private List<String> lang;			//언어
	private List<String> cmmncdGrpCd;	//근무지
	private List<String> cmmncdNm1;		//상세근무지

}
