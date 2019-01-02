package com.sb.mall.home.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.sb.mall.member.model.MemberInfo;

public class ChatHandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// TODO Auto-generated method stub
		
		// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
        
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());

        HttpServletRequest req =  ssreq.getServletRequest();
        
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        Object SessionMemberInfo = (Object)req.getSession().getAttribute("memberInfo");
        MemberInfo memberInfo = (MemberInfo) SessionMemberInfo;
        attributes.put("userName", memberInfo.getUserName());
        System.out.println("HttpSession에 저장된 id:" + memberInfo.getUserName());
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
		
	}
	
	@Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
	
}
