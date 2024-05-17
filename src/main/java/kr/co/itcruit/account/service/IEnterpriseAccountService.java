package kr.co.itcruit.account.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.EntAccountVO;
import kr.co.itcruit.vo.EnterpriseVO;

public interface IEnterpriseAccountService {

	public ServiceResult signup(HttpServletRequest req, Map<String, Object> map);

	public AccountVO searchId(AccountVO accountVO);

	public AccountVO searchPw(AccountVO accountVO);

	public AccountVO enterpriseSignin(AccountVO accountVO);

	public EntAccountVO searchEntNo(String accountId);

	public EnterpriseVO entBrnoCheck(String brno);

}
