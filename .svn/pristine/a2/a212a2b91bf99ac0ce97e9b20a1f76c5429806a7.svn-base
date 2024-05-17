package kr.co.itcruit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        if (exception instanceof BadCredentialsException || exception instanceof UsernameNotFoundException ) {
            // 로그인 실패 시 인증 예외가 발생한 경우, 여기서 필요한 로직을 추가하여 서로 다른 페이지로 리디렉션하도록 처리합니다.
//        	System.out.println("%%%%%%%");
//        	String username = request.getParameter(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_USERNAME_KEY);
        	String type = request.getParameter("type");
//        	System.out.println(type); 
        	
            if (type.equals("personal")) {
                // 일반 로그인 실패 시
                setDefaultFailureUrl("/main/loginForm.do");
            } else if (type.equals("enterprise")) {
                // 기업회원 로그인 실패 시
                setDefaultFailureUrl("/main/loginForm.do");
            } else if (type.equals("enterpriseOnly")) {
            	// 기업회원 로그인 실패 시
                setDefaultFailureUrl("/main/entLoginForm.do");
            } else {
            	// 관리자 로그인 실패 시
            	setDefaultFailureUrl("/main/adminLoginForm.do");
            }
            
        }
        super.onAuthenticationFailure(request, response, exception);
    }
}
