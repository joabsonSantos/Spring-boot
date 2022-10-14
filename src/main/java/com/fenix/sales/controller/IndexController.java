package com.fenix.sales.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

public class IndexController {
	ModelAndView modelAndView = new ModelAndView();
	
	@GetMapping("/")
	public ModelAndView Index() {
		System.out.println("chegou aqui");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@GetMapping("/admin")
	public ModelAndView admin() {
		ModelAndView modelAndView = new ModelAndView("admin/index");
		return modelAndView;
	}

}
