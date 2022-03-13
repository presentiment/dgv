package com.dgv.web.admin.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class RequestUtils {
	
	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	}

	public static HttpSession getSession() {
	    return RequestUtils.getRequest().getSession(true);
	}
	
	public static <T> T getSessionObject(final String key, final Class<T> type) {
		return type.cast(RequestUtils.getSession().getAttribute(key));
	}
	
	public static String getUserId(final String userId) {
		return (String) RequestUtils.getSession().getAttribute("userID");
	}
	
	public static String getUserEmail(final String userEmail) {
		return (String) RequestUtils.getSession().getAttribute("userEmail");	
	}
	
	public static String getUserImg(final String userImg) {
		return (String) RequestUtils.getSession().getAttribute("userImg");
	}
	
	public static void setUserId(final String userId) {
		RequestUtils.getSession().setAttribute("userID", userId);
	}
	public static void setUserEmail(final String userEmail) {
		RequestUtils.getSession().setAttribute("userEmail", userEmail);
		
	}
	public static void setUserImg(final String userImg) {
		RequestUtils.getSession().setAttribute("userImg", userImg);
	}
	
}
