package com.teksystems22.wandermaps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
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
