package com.teksystems22.wandermaps.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.teksystems22.wandermaps.security.AuthenticatedUserService;

import lombok.extern.slf4j.Slf4j;


@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private AuthenticatedUserService authService;

	@Value("${spring.datasource.url}")
	private String variable;

	
//	/index.html
//	/signup
//	/login
//	/createtrip
//	/viewtrips
//	/viewtripdetails
//	/contact.html
	
	@RequestMapping(value= {"/", "/index", "/index.html"}, method=RequestMethod.GET)
	public ModelAndView slash() {
		System.out.println("Index controller request.");
		
		return null;
	}
	
	@RequestMapping(value= {"/search"}, method=RequestMethod.GET)
	public ModelAndView search() {
		System.out.println("This is the index controller search request.");
		
		return null;
	}

}
