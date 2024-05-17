package kr.co.itcruit.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.itcruit.account.service.IEnterpriseAccountService;
import kr.co.itcruit.mapper.IAccountMapper;
import kr.co.itcruit.mapper.IEnterpriseMapper;
import kr.co.itcruit.mapper.IMyEnterpriseMapper;
import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EntAccountVO;
import kr.co.itcruit.vo.EnterpriseVO;


public class CustomUserDetailsService implements UserDetailsService{

	private static final Logger log = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private IAccountMapper accountMapper;
	
	@Autowired
	private IMyEnterpriseMapper myEntMapper;
	
//	@Autowired
//	private IEnterpriseMapper entAccountMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//인증된 사용자 정보를 담을 공간 선언
		AccountVO account;
//		AccountVO account = null;
		
		try {
			account = accountMapper.readByUserId(username);
			if (account == null) {
                throw new UsernameNotFoundException(username);
//                return null;
            }
//			System.out.println("@#@#@#@#@  ==  " + account);
			EntAccountVO entAccountVO =  accountMapper.searchEntNo(username);
			if(entAccountVO != null) {
//				System.out.println("@#@#@#@#@  ==  " + entAccountVO);
				account.setEntNo(entAccountVO.getEntNo());
				EnterpriseVO etvo =  myEntMapper.selectEntInfoByEntNo(entAccountVO.getEntNo());
				account.setEntNm(etvo.getEntNm());
			}
			
			log.info("queried by member mapper : " + account);
			return new CustomUser(account);
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException(username);
		}
		
	}

}
