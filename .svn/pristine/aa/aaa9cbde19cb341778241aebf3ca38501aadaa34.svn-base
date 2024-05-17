package kr.co.itcruit.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.alarm.service.IAlarmService;
import kr.co.itcruit.mapper.IAlarmMapper;
import kr.co.itcruit.vo.AlarmVO;

@Service
public class AlarmServiceImpl implements IAlarmService{
	
	@Autowired
	private IAlarmMapper alarmMapper;

	@Override
	public List<AlarmVO> getAlarmListById(String accountId) {
		return alarmMapper.getAlarmListById(accountId);
	}

	@Override
	public void setUpdateReadY(String alarmNo) {
		alarmMapper.setUpdateReadY(alarmNo);
	}

	@Override
	public ServiceResult setInsertAlarm(AlarmVO avo) {
		
		ServiceResult result = null;
		
		int pass = alarmMapper.setInsertAlarm(avo);
		
		if(pass > 0) {
			
			
			result = ServiceResult.OK;
			
			
		}else {
			
			result = ServiceResult.FAILED;
			
			
		}
		
		
		return result;
	}

}
