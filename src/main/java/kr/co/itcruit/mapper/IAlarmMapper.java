package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.AlarmVO;

public interface IAlarmMapper {

	List<AlarmVO> getAlarmListById(String accountId);

	void setUpdateReadY(String alarmNo);

	int setInsertAlarm(AlarmVO avo);


}
