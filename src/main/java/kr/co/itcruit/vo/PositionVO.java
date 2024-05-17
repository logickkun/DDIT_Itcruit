package kr.co.itcruit.vo;

import java.util.List;

import lombok.Data;

@Data
/**
 * 이력서-개발직무
 * @author 김나혜
 *
 */
public class PositionVO {
	private String pstnSeq;		  //직무시퀀스
	private String rsmNo;		  //이력서번호(fk)
	private String pstnCmmncdNm;  //직무코드이름
	private String pstnCate;	  //직무코드이름에 맞는 카테고리
	
	private String[] pstnArr;	  //사용자가 선택한 직무 list
	private String[] pstnCateArr; //사용자가 선택한 직무의 카테고리 list
}
