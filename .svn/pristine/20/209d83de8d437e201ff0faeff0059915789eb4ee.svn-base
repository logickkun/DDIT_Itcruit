package kr.co.itcruit.mapper;

import java.util.List;

import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.EntAccountVO;
import kr.co.itcruit.vo.EnterpriseVO;

public interface IAccountMapper {

	public int signup(AccountVO accountVO);

	public AccountVO searchId(AccountVO accountVO);

	public String searchPw(AccountVO accountVO);

	public void updateTemppw(AccountVO accountVO);

	public int kakaoSignup(AccountVO accountVO);

	public String idCheck(AccountVO accountVO);

	public AccountVO memberSignin(AccountVO accountVO);

	public int kakaoInfoUpdate(AccountVO accountVO);

	public int insert(AccountVO accountVO);

	public void addAccountAuth(AccountVO accountVO);
	public AccountVO readByUserId(String username);
	public void addEnterpriseAuth(AccountVO accountVO);
	public AccountVO enterpriseSignin(AccountVO accountVO);

	public void entAccount(EnterpriseVO enterpriseVO);

	public AccountVO selectAccount(AccountVO account);

	public EntAccountVO searchEntNo(String accountId);



}
