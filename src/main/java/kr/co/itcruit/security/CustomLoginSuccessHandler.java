package kr.co.itcruit.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	private static final Logger log = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("## Login Success");
		
		// 당신이 개인/기업 중 어떤 타입으로 로그인하셨습니까?
		// personal : 일반
		// enterprise : 기업
		// admin : 관리자
		String type = request.getParameter("type");
		log.info(type);
		// 101 관리자
		// 102 일반
		// 103 기업
		
		String targetUrl = "";
		String auth = "";
		User customUser = (User) authentication.getPrincipal();
		Collection<GrantedAuthority> authList = (Collection<GrantedAuthority>) authentication.getAuthorities();
		Iterator<GrantedAuthority> ite = authList.stream().iterator();
		
		while(ite.hasNext()) {
			GrantedAuthority authority = ite.next();
			auth = authority.getAuthority();
			
			// 타입과 권한 체크
			// type : 102    auth : 102
		    if (type.equals("personal") && auth.contains("102")) {
		        // 일반회원 조건에 해당하는 경우
		        targetUrl = "/account/member/signin.do";
		        break;
		    } else if (type.equals("enterprise") && auth.contains("103")) {
		        // 기업회원 조건에 해당하는 경우
		        targetUrl = "/account/enterprise/signin.do";
		        break;
		    } else if (type.equals("enterpriseOnly") && auth.contains("103")) {
		        // 기업회원 조건에 해당하는 경우
		        targetUrl = "/account/enterprise/signin.do";
		        break;
		    } else if(type.equals("admin") && auth.contains("101")) {
		        // 관리자회원 조건에 해당하는 경우
		        targetUrl = "/myPage/admin/signin.do";
		        break;
		    }
		};
		
		if (targetUrl.isEmpty()) {
			targetUrl = "/main/loginForm.do";
		    // 어떤 권한에도 해당하지 않는 경우
		    if (type.equals("personal")) {
		        // 일반회원 조건에 해당하지 않는 경우
		        request.getSession().setAttribute("message", "일반회원만 로그인 가능합니다!");
		        SecurityContextHolder.getContext().setAuthentication(null);
		    } else if (type.equals("enterprise")) {
		        // 기업회원 조건에 해당하지 않는 경우
		        request.getSession().setAttribute("message", "기업회원만 로그인 가능합니다!");
		        SecurityContextHolder.getContext().setAuthentication(null);
		    } else if (type.equals("enterpriseOnly")) {
		        // 기업회원 조건에 해당하지 않는 경우
		        request.getSession().setAttribute("message", "기업회원만 로그인 가능합니다!");
		        SecurityContextHolder.getContext().setAuthentication(null);
		        targetUrl = "/main/entLoginForm.do";
		    } else {
		        // 유효하지 않은 회원 유형인 경우
		        request.getSession().setAttribute("message", "관리자회원만 로그인 가능합니다!");
		        SecurityContextHolder.getContext().setAuthentication(null);
		        targetUrl = "/main/adminLoginForm.do";
		    }
		    
		}
		
		
		log.info("## username : " + customUser.getUsername());
		log.info("## password : " + customUser.getPassword());
		
		clearAuthenticationArrtibute(request);
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		log.info("Login Success targetUrl123123 : " + targetUrl);
		
		if(savedRequest != null) {
//			log.info("savedRequest == " , savedRequest);
			targetUrl = savedRequest.getRedirectUrl();
		}		
		
		log.info("Login Success targetUrl : " + targetUrl);
		response.sendRedirect(targetUrl);
	}

	private void clearAuthenticationArrtibute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session == null) {
			
			return;
			
		}
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}
