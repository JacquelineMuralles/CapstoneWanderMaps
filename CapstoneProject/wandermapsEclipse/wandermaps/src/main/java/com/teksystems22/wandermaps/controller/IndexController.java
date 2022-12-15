package com.teksystems22.wandermaps.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teksystems22.wandermaps.security.AuthenticatedUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	
	@Autowired
	private AuthenticatedUserService authService;
	
	@Autowired
	

	@Value("${spring.datasource.url}")
	private String variable;

	@RequestMapping(value = { "/", "/index", "/index.html" }, method = RequestMethod.GET)
	public ModelAndView slash(@RequestParam(required = false) String courseName,
			@RequestParam(required = false) String instructorName) {
		
		ModelAndView response = new ModelAndView();
		response.setViewName("index");

		
		// if the user is authenticated
		if ( authService.isAuthenticated() ) {
			boolean isAdmin = authService.isUserInRole("ADMIN");
			log.debug(authService.getCurrentUsername() + " is current logged in and admin access = " + isAdmin);
			log.debug(authService.getCurrentUser() + "");
		} else {
			log.debug("USER NOT LOGGED IN");
		}

		return response;
	}

	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public ModelAndView search() {
		System.out.println("Index controller search request");

		return null;
	}


}
