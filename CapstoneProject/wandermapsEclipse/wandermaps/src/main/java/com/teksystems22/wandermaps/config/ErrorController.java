package com.teksystems22.wandermaps.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@ControllerAdvice
public class ErrorController {
	
	@RequestMapping(value="/error/404")
	public String error404(HttpServletRequest request) {
		
		String originalUrl = (String) request.getRequestURI();
		log.error("Request URL Not Found: " + request.getMethod() + " " + originalUrl);
		
		return "error/404";
	}
	
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllExceptions(HttpServletRequest request, Exception ex) {
		
		log.warn("Error page exception : " + getRequestURL(request), ex);
		
		ModelAndView model = new ModelAndView("/error/500");
		
		return model;
	}
	
	private String getRequestURL(HttpServletRequest request) {
		
		String result = request.getRequestURL().toString();
		
		if (request.getQueryString() != null) {
			result = result + "?" + request.getQueryString();
		}
		
		return result;
	}

}
