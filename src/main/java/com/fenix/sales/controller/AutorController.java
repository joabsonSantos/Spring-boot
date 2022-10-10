package com.fenix.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Autor;
import com.fenix.sales.infra.FileSaver;

@Controller
public class AutorController {
	ModelAndView modelAndView = new ModelAndView();

	@Autowired
	FileSaver file;

	@GetMapping("/admin/autor")
	public ModelAndView ListarAutores() {
		modelAndView.setViewName("admin/listAutores");
		return modelAndView;
	}

	@GetMapping("/admin/cadastrarAutor")
	public ModelAndView CadastrarAutor(Autor Autor) {
		modelAndView.setViewName("admin/cadastrarAutor");
		return modelAndView;
	}

	@PostMapping("/admin/cadastro")
	public ModelAndView Cadastrar(Autor Autor, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("admin/listAutores");
		return modelAndView;
	}

	@GetMapping("/admin/ExcluirAutor/{id}")
	public ModelAndView ExcluirAutor(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("admin/listAutores");
		return modelAndView;
	}

	@GetMapping("/admin/EditarAutor/{id}")
	public ModelAndView EditarAutor(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("admin/listAutores");
		return modelAndView;
	}

	@PostMapping("/admin/Edicao")
	public ModelAndView UpdateAutor(Autor Autor) {
		modelAndView.setViewName("admin/listAutores");
		return modelAndView;
	}

}
