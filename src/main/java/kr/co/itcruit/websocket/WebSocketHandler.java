package kr.co.itcruit.websocket;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TimeZone;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.alarm.service.IAlarmService;
import kr.co.itcruit.mapper.IAlarmMapper;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AlarmVO;
import kr.co.itcruit.vo.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{
	
	HashMap<String, WebSocketSession> loginSessionMap = new HashMap<String, WebSocketSession>();
	
	Iterator<Map.Entry<String, WebSocketSession>> iterator;
	
	Map.Entry<String, WebSocketSession> entry;
	
	
	
	@Autowired
	private IAlarmService alarmService;
	

	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        super.afterConnectionEstablished(session);

        CustomUser user = (CustomUser) session.getAttributes().get("user");
        if (user != null) {
            AccountVO av = user.getAccount();
            String accountId = av.getAccountId();

            if (accountId != null) {
                loginSessionMap.put(accountId, session);
                log.info("들어와라 참깨 : " + accountId);
            }else {
            	log.error("참깨 실패");
            }
        }
    }
	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		loginSessionMap.values().remove(session);
//		log.info("꺼져라 참깨 : " + session.getId());
	}
	
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        super.handleTextMessage(session, message);
        String payload = message.getPayload();
       
        
        JSONObject jsonMessage = new JSONObject(payload);
        String category = jsonMessage.getString("type");
    	String rcvrId = jsonMessage.getString("rcvrId");
    	String sndrId = jsonMessage.getString("sndrId");
    	String alramTime = jsonMessage.getString("alramtime");
    	Date parseAlarmTime = parseDate(alramTime);
    	
        log.info("#### jsonMessage : " + jsonMessage);
        
        if(category.equals("passStatus")) {
        	
        	ObjectMapper mapper = new ObjectMapper();
        	
        	String recruitTtl = jsonMessage.getString("recruitTtl");
        	String alarmCn = "채용 공고 결과를 확인해주세요";
        	
        	AlarmVO avo = new AlarmVO(rcvrId, sndrId, alarmCn, parseAlarmTime, "채용결과", recruitTtl);

        	iterator = loginSessionMap.entrySet().iterator();

        	while (iterator.hasNext()) {
        		
        		entry = iterator.next();
        	    String sessionId = entry.getKey();
        	    WebSocketSession targetSession = entry.getValue();
        	    
        	    if (rcvrId.equals(sessionId)) {
        	        if (targetSession != null && targetSession.isOpen()) {
        	        	
        	        	ServiceResult result =  alarmService.setInsertAlarm(avo);
        	        	String json = mapper.writeValueAsString(avo);
        	        	
        	        	if(result.equals(ServiceResult.OK)) {
        	        		
        	        		targetSession.sendMessage(new TextMessage(json));
        	        		log.info("참깨를 받아라: " + json);
        	        		
        	        	}else {
        	        		log.error("알람 업데이트 실패!!! ");
        	        	}
        	        	
        	        	
        	        } else {
        	            log.error("거절하는 참깨인");
        	        }
        	        break;
        	    }
        	}

        	if (!iterator.hasNext()) {
        	    log.error("없는 참깨인");
        	}

        	
        }else if(category.equals("offerTalent")) {
        	
        	ObjectMapper mapper = new ObjectMapper();
        	
        	String alarmCn = "인재제안이 왔습니다. 빨리 확인해보세요";
        	String availLang = jsonMessage.getString("availLang");
        	
        	AlarmVO avo = new AlarmVO(rcvrId, sndrId, alarmCn, parseAlarmTime, "인재제안", availLang);
        	
        	iterator = loginSessionMap.entrySet().iterator();
        	
        	while (iterator.hasNext()) {
        	    entry = iterator.next();
        	    String sessionId = entry.getKey();
        	    WebSocketSession targetSession = entry.getValue();
        	    
        	    if (rcvrId.equals(sessionId)) {
        	    	
        	        if (targetSession != null && targetSession.isOpen()) {
        	        	
        	        	ServiceResult result =  alarmService.setInsertAlarm(avo);
        	        	String json = mapper.writeValueAsString(avo);
        	        	
        	        	if(result.equals(ServiceResult.OK)) {
        	        		
        	        		targetSession.sendMessage(new TextMessage(json));
        	        		log.info("참깨를 받아라: " + json);
        	        		
        	        	}else {
        	        		log.error("알람 업데이트 실패!!! ");
        	        	}
        	        	
        	        	
        	        } else {
        	        	
        	            log.error("거절하는 참깨인");
        	        }
        	        break;
        	    }
        	}
        	
        	if (!iterator.hasNext()) {
        	    log.error("없는 참깨인");
        	}
        }
    }


	private Date parseDate(String alramTime) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    	sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
    	Date parseAlarmTime = sdf.parse(alramTime);
		return parseAlarmTime;
	}

	
}
