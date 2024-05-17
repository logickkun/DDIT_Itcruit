package kr.co.itcruit.account.service.impl;

import java.io.File;
import java.security.SecureRandom;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.account.service.IEnterpriseAccountService;
import kr.co.itcruit.mapper.IAccountMapper;
import kr.co.itcruit.mapper.IAtchFileMapper;
import kr.co.itcruit.mapper.IEnterpriseMapper;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchFileVO;
import kr.co.itcruit.vo.EntAccountVO;
import kr.co.itcruit.vo.EnterpriseVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Slf4j
public class EnterpriseAccountServiceImpl implements IEnterpriseAccountService {

	@Inject
	private IAccountMapper accountMapper;
	
	@Inject
	private IEnterpriseMapper enterpriseMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private PasswordEncoder pe;
	
	@Autowired
	private IAtchFileMapper fileMapper;
	
	// 기업회원가입
	@Override
	public ServiceResult signup(HttpServletRequest req, Map<String, Object> map) {
//		System.out.println("서비스스슷");
		ServiceResult result = null;
		
		AccountVO accountVO = (AccountVO) map.get("accountVO");
		EnterpriseVO enterpriseVO = (EnterpriseVO) map.get("enterpriseVO");
//		System.out.println("!!!!! : " + accountVO);
//		System.out.println("!!!!! : " + enterpriseVO);
		
//		log.info("#####" + String.valueOf(enterpriseVO.getEntNo()));
		
		
		// 닉네임 추가 기업이름 + 01
		String nick = enterpriseVO.getEntNm() + "01";
		accountVO.setAccountNick(nick);
//		log.info("#####" + String.valueOf(enterpriseVO.getEntNo()));
		// 아이디 체크
		String check = accountMapper.idCheck(accountVO);
		log.info("idCheck  : {}", check);
		if(check != null) {
			result = ServiceResult.FAILED;
		}else {
			System.out.println("!!!!! : " + accountVO);
			System.out.println("!!!!! : " + enterpriseVO);
			
			accountVO.setAccountPswd(pe.encode(accountVO.getAccountPswd()));
			
			int memStatus = accountMapper.insert(accountVO);
			int entStatus = enterpriseMapper.insert(enterpriseVO);
//			log.info("#####" + String.valueOf(enterpriseVO.getEntNo()));
			log.info("memStatus  : {}", memStatus);
			log.info("entStatus  : {}", entStatus);
			if(memStatus > 0 && entStatus > 0) {
				String fileSrcNo = String.valueOf(enterpriseVO.getEntNo());
				
				String orgnCmmncd = "사업자등록증";
				
				for(MultipartFile entFile : enterpriseVO.getBrnoFile()) {
					
					AtchFileVO atchFileVO = new AtchFileVO(entFile, req, fileSrcNo, orgnCmmncd);
					atchFileVO.setFileSrcNo(fileSrcNo);
					atchFileVO.setOrgnCmmncd(orgnCmmncd);;
					
					fileMapper.atchFileInsert(atchFileVO);
				}
				accountMapper.entAccount(enterpriseVO);
				accountMapper.addEnterpriseAuth(accountVO);
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		
		return result;
	}

	// 아이디 찾기
	@Override
	public AccountVO searchId(AccountVO accountVO) {
		
		return accountMapper.searchId(accountVO);
	}

	@Override
	public AccountVO searchPw(AccountVO accountVO) {
		
		String pswd = accountMapper.searchPw(accountVO);
		
		if(pswd !=null) {
			System.out.println("찾기 성공 후 서비스" + accountVO);
			String tempPswd = generateRandomString();
			
			accountVO.setAccountPswd(tempPswd);
			
			accountMapper.updateTemppw(accountVO);
			
			String mail = accountVO.getAccountMail();
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				
				helper.setTo(mail);
				helper.setSubject("인증번호");
				helper.setText("<html><body><img src='cid:imageId'><br/>안녕하세요. ITcruit입니다. 많은 이용부탁드립니다.<br/><h3>인증번호 : " + tempPswd + "</h3></body></html>", true);
				helper.addInline("imageId", new FileSystemResource(new File("E:\\lion.png")));
				
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

	@Override
	public AccountVO enterpriseSignin(AccountVO accountVO) {
		
		return accountMapper.enterpriseSignin(accountVO);
	}

	@Override
	public EntAccountVO searchEntNo(String accountId) {
		return accountMapper.searchEntNo(accountId);
	}

	@Override
	public EnterpriseVO entBrnoCheck(String brno) {
		return enterpriseMapper.entBrnoCheck(brno);
	}
	
	
	
	
	
	
	
	
	
}
	