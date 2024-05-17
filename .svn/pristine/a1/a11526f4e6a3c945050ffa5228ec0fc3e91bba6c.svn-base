package kr.co.itcruit.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import kr.co.itcruit.vo.CustomUser;

@Component
public class SecurityUsersInterceptor implements HandshakeInterceptor{

    @Override
    public boolean beforeHandshake(
    		ServerHttpRequest request, 
    		ServerHttpResponse response, 
    		WebSocketHandler wsHandler, 
    		Map<String, Object> attributes) 
    				throws Exception {
    	
        if (request instanceof ServletServerHttpRequest) {
        	
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            
            HttpSession session = servletRequest.getServletRequest().getSession(false);
            
            
            SecurityContext securityContext = null;
            
            if(session != null) {
            	
            	securityContext = (SecurityContext) session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
            	
            }
            
            if (securityContext != null) {
            	
                Authentication authentication = securityContext.getAuthentication();
                
                if (authentication != null && authentication.getPrincipal() instanceof CustomUser) {
                	
                    CustomUser user = (CustomUser) authentication.getPrincipal();
                    
                    attributes.put("user", user);
                }
            }
        }
        return true;
    }

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		// TODO Auto-generated method stub
		
	}

}
