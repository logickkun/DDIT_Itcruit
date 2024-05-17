package kr.co.itcruit.vo;

import lombok.Data;

@Data
public class CalendarVO {
//	{
//  title: '삼성전자',
//  start: '2024-04-08T00:00', //시간 찍으면 dot로 나옴
//  color: '#CC77FF',
//  extendedProps: {
//  	name: '이름',
//  	processNumber: 'processNum'
//  }
//},
//	private String recruitNo;
//	private String pstnCmmncdNm;
	private String color;							//달력에 표시할 색
	private String title;							//달력에 표시할 이름
	private String start;							//달력에 표시할 시작일
	private ExtendVO extendedProps;
	
}
