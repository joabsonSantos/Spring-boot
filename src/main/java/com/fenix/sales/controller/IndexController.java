package com.fenix.sales.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

public class IndexController {
	ModelAndView modelAndView = new ModelAndView();
	
	@GetMapping("/")
	public ModelAndView Index() {
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	

}
