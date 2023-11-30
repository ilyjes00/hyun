package com.hyun.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hyun.domain.AdminVO;
import com.hyun.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = false;

		//현재 클라이언트의 세션을 통한 인증상태 확인작업을 할수가 있다.
		HttpSession session = request.getSession();
		
		AdminVO admin = (AdminVO) session.getAttribute("adminStatus");
		
		if(admin == null) { //인증정보가 없는경우
			
			result = false; //컨트롤러로 진행을 하지못한다
			
			if(isAjaxRequest(request)) {
				
				response.sendError(400);
			}
			
			
			getTargetUrl(request);
			
			response.sendRedirect("/admin/intro");
			System.out.println("인증실패");
			
			
			
		}else {//인증정보가 있는 경우. 즉 세션 loginStatus 정보가 존재. (사용자는 로그인증)

			result = true; //컨트롤러로 진행한다
			System.out.println("인증성공");
			
		}
		//인증이될경우 컨트롤러로 넘어가고 안될경우는 동작이넘어가지않는다 
		return result;
	}

	//인증되지 않은상태에서 사용자가 요청한 URL을 저장하고, 로그인후 URL로 리다이렉트 ( 시간이지나서 loginsession이 사라져서 로그아웃된경우 그전 url을 불러오는작업)
	private void getTargetUrl(HttpServletRequest request) {
		//요청주소. localhost:9090/member/modify?userid=user01
		
		String uri = request.getRequestURI();	// /member/modify
		String query = request.getQueryString();	// userid=user01
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		String targetUrl = uri + query;
		
		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("target", targetUrl);
		}
		
		
	}
	//사용자 요청이 ajax요청인지 체크
	private boolean isAjaxRequest(HttpServletRequest request) {
		
		boolean isAjax = false;
		
		String header = request.getHeader("AJAX");	//request.getHeader("AJAX"); ajax에서 요청하는지 알아보는기능
		if(header != null && header.equals("true")) {
			isAjax = true;
		}
		
		return isAjax;
	}

}
