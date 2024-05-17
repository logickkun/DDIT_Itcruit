package kr.co.itcruit.vo;

import java.util.List;


/**
 * @author KHT
 * 채용리스트페이지에서 사용하는 채용 검색용 카테고리 불러올  VO
 */
public class RecruitSearchVO {

	
	private List<String> local1;	// 지역 리스트     - 광역시, 도 등
	private List<String> local2;	// 상세지역  리스트  - 시 군
	private List<String> pstn;		// 직무
	private List<String> lang;		// 사용언어
	private List<String> stat;		// 채용형태(정규, 계약, 인턴 등) 
	
}
