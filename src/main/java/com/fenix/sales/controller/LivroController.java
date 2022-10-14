package com.fenix.sales.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Livro;
import com.fenix.sales.repository.LivroRepository;

@Controller
public class LivroController {
	
	@Autowired
	LivroRepository livroRepository;
	
	
	@GetMapping("/admin/livros")
	public ModelAndView livros(Livro livro) {
		ModelAndView modelAndView = new ModelAndView("admin/listLivros");
		return modelAndView;
	}
	
	@PostMapping("/admin/cadastrarLivros")
	public ModelAndView cadastrarLivro(@Valid Livro livro, BindingResult bindingResult, RedirectAttributes redirectAtributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/formLivros");
		return modelAndView;
	}
	
	@GetMapping("/admin/listLivros")
	public ModelAndView listarLivro() {
		ModelAndView modelAndView = new ModelAndView("admin/listLivros");
		return modelAndView;
	}
	@GetMapping("/excluirLivro/{id}")
	public ModelAndView excluirLivro(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listLivros");
		return modelAndView;
	}

	@GetMapping("/editarLivro/{id}")
	public ModelAndView editarLivro(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("admin/atualizarLivro");
		return modelAndView;
	}

	@PostMapping("/editarLivro")
	public ModelAndView update (@Valid Livro livro, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listLivros");
		return modelAndView;
	}

}
