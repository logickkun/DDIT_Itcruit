package kr.co.itcruit.alarm.service;

import java.util.List;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AlarmVO;

public interface IAlarmService {

	public List<AlarmVO> getAlarmListById(String accountId);

	public void setUpdateReadY(String alarmNo);

	public ServiceResult setInsertAlarm(AlarmVO avo);


}
