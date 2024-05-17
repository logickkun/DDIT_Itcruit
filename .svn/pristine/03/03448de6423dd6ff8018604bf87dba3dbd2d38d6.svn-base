package kr.co.itcruit.account.service.impl;

import java.io.File;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.account.service.IMemberAccountService;
import kr.co.itcruit.mapper.IAccountMapper;
import kr.co.itcruit.vo.AccountVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Slf4j
@Service
public class MemberAccountServiceImpl implements IMemberAccountService {

	@Inject
	private IAccountMapper accountMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private PasswordEncoder pe;
	
	// 개인회원가입
	@Override
	public ServiceResult signup(HttpServletRequest req, AccountVO accountVO) {
		ServiceResult result = null;
		// 닉네임 추가
		String nick = setNick();
		accountVO.setAccountNick(nick);
		
		String check = accountMapper.idCheck(accountVO);
		log.info("asdfasdfasdfasd " + check);
		if(check != null) {
			
			result = ServiceResult.FAILED;
		}else {
			
			accountVO.setAccountPswd(pe.encode(accountVO.getAccountPswd()));
			
			int status = accountMapper.signup(accountVO);
			
			if(status > 0) {
				accountMapper.addAccountAuth(accountVO);
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		
		return result;
	}
	

	// 램던생성 닉네임
	private String setNick() {
		
		List<String> firstWord = Arrays.asList("기분나쁜","기분좋은","신바람나는","상쾌한","짜릿한","그리운","자유로운","서운한","울적한","비참한","위축되는","긴장되는","두려운","당당한","배부른","수줍은","창피한","멋있는",
		"열받은","심심한","잘생긴","이쁜","시끄러운");
		List<String> secondWord = Arrays.asList(" 사자"," 코끼리"," 호랑이"," 곰"," 여우"," 늑대"," 너구리"," 침팬치"," 고릴라"," 참새"," 고슴도치"," 강아지"," 고양이"," 거북이"," 토끼"," 앵무새"," 하이에나"," 돼지"," 하마"," 원숭이"," 물소"," 얼룩말"," 치타",
						" 악어"," 기린"," 수달"," 염소"," 다람쥐"," 판다");
		Collections.shuffle(firstWord);
		Collections.shuffle(secondWord);
		
		String nick = firstWord.get(0) + secondWord.get(0);
		log.info("nicknicknicknick" + nick);
		
		return nick;
		
	}

	// sms 번호인증
	@Override
	public void phoneandnumber(String phone, int randomNum) {
		
		String api_key = "NCSR67HYHJEGBDDI";
		String api_secret = "EUSKGI84AA5TJSLUIXIUMA6GZ6KF5DXE";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone);
		params.put("from", "010-7758-1871");
		params.put("type", "SMS");
		params.put("text", "[ITCruit] 인증번호는 " + "[" + randomNum + "]" + " 입니다.");;
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj = coolsms.send(params);
	        System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	        
	    }
	}

	// id찾기
	@Override
	public AccountVO searchId(AccountVO accountVO) {
		
		return accountMapper.searchId(accountVO);
		
	}

	// pw찾기
	@Override
	public AccountVO searchPw(AccountVO accountVO) {
		
		//return 타입은 String
		//비밀벉호찾기 시행
		//값이 있으면 초기화실행 + msg=메일확인 ㄱ; return  msg;
		// else msg="일치하는 정보없음" return msg;
		
		//accountVO에 담긴 메일 주소로 임시비밀번호전송
		
		String pswd = accountMapper.searchPw(accountVO);
		
		if(pswd !=null) {
			System.out.println("찾기 성공 후 서비스" + accountVO);
			String tempPswd = generateRandomString();
			
			accountVO.setAccountPswd(pe.encode(tempPswd));
//			accountVO.setAccountPswd(pe.encode(accountVO.getAccountPswd()));
			accountMapper.updateTemppw(accountVO);
			
			String mail = accountVO.getAccountMail();
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				
				helper.setTo(mail);
				helper.setSubject("인증번호");
				helper.setText("<html><body><img src='cid:imageId'><br/>안녕하세요. ITcruit입니다. 많은 이용부탁드립니다.<br/><h3>인증번호 : " + tempPswd + "</h3></body></html>", true);
				helper.addInline("imageId", new FileSystemResource(new File("E:\\logo1(배경0).png")));
				
				mailSender.send(message);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			
		}else {
			System.out.println("일치 없음");
		}
		
		return accountVO;
		
	}


	private static final String UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";
    private static final String SPECIAL = "!@#$%^&*()-_=+";

    private static final SecureRandom RANDOM = new SecureRandom();

    public static String generateRandomString() {
        StringBuilder sb = new StringBuilder(10);
        sb.append(getRandomChar(UPPER));   
        sb.append(getRandomChar(LOWER));   
        sb.append(getRandomChar(DIGITS));  
        sb.append(getRandomChar(SPECIAL)); 

        for (int i = 4; i < 10; i++) {
            String randomSet = getRandomCharacterSet();
            sb.append(getRandomChar(randomSet));
        }

        return sb.toString();
    }

    private static char getRandomChar(String source) {
        return source.charAt(RANDOM.nextInt(source.length()));
    }

    private static String getRandomCharacterSet() {
        String[] characterSets = {UPPER, LOWER, DIGITS, SPECIAL};
        return characterSets[RANDOM.nextInt(characterSets.length)];
    }

    // 카카오로긍니
	@Override
	public ServiceResult kakaoSignup(AccountVO accountVO) {
		ServiceResult result = null;
		
		String check = accountMapper.idCheck(accountVO);
		log.info(check);
		
		
		if(check != null) { // id가 있을때
			result = ServiceResult.FAILED;
		}else { // id가 없을때
			
			int status = accountMapper.kakaoSignup(accountVO);
			
			if(status > 0) {
				
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		
		return result;
	}
	
	
	// 맴버 로그인
	@Override
	public AccountVO memberSignin(AccountVO accountVO) {
		
		return accountMapper.memberSignin(accountVO);
		
	}

	// 카카오 추가정보입력
	@Override
	public ServiceResult kakaoInfoUpdate(HttpServletRequest req, AccountVO accountVO) {
		ServiceResult result = null;
		
		String nick = setNick();
		accountVO.setAccountNick(nick);
		
		
		String yn = accountMapper.idCheck(accountVO);
		
		if(yn != null) {
			result = ServiceResult.FAILED;
		}else {
			accountVO.setAccountPswd(pe.encode(accountVO.getAccountPswd()));
			
			int status = accountMapper.kakaoInfoUpdate(accountVO);
			System.out.println("asdfasdfasdfasdfasdfsd " + accountVO);
			if(status > 0) {
				accountMapper.addAccountAuth(accountVO);
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
			
		}
		
		return result;
	}


	@Override
	public AccountVO selectAccount(AccountVO account) {
		String stop = "STTS0102";
		account.setAccountSttsCmmncd(stop);
		System.out.println("asdfasdfasdfasdfasdfsd " + account);
		return accountMapper.selectAccount(account);
		
	}


	@Override
	public String checkId(AccountVO accountVO) {
		return accountMapper.idCheck(accountVO);
	}
	


}
