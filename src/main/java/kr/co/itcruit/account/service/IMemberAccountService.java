package kr.co.itcruit.account.service;

import javax.servlet.http.HttpServletRequest;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AccountVO;

public interface IMemberAccountService {
	
	public ServiceResult signup(HttpServletRequest req, AccountVO accountVO);

	public void phoneandnumber(String phone, int randomNum);

	public AccountVO searchId(AccountVO accountVO);

	public AccountVO searchPw(AccountVO accountVO);

	public ServiceResult kakaoSignup(AccountVO accountVO);

	public AccountVO memberSignin(AccountVO accountVO);

	public ServiceResult kakaoInfoUpdate(HttpServletRequest req, AccountVO accountVO);

	public AccountVO selectAccount(AccountVO account);

	public String checkId(AccountVO accountVO);



}
