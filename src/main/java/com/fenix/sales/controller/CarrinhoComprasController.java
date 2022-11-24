package com.fenix.sales.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.fenix.sales.component.Carrinho;
import com.fenix.sales.entity.Livro;
import com.fenix.sales.repository.LivroRepository;


@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/carrinho")
public class CarrinhoComprasController {
	ModelAndView modelAndView = new ModelAndView();
	
	@Autowired
	LivroRepository livroRepository;
	@Autowired
	Carrinho carrinho;
	
	
	@GetMapping("/add/{id}")
	public ModelAndView adicionaLivro(@PathVariable Long id) {
		modelAndView.setViewName("carrinho");
		Optional<Livro> livro = livroRepository.findById(id);
		
		if(livro.isPresent()) {
			carrinho.add(livro.get());
		}		
		
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}
	
	@GetMapping
	public ModelAndView carrinho() {
		modelAndView.setViewName("carrinho");
	
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}
	
	
	@GetMapping("/delete/{id}")
	public ModelAndView excluirLivro(@PathVariable Long id) {
		modelAndView.setViewName("carrinho");
		Optional<Livro> livro = livroRepository.findById(id);
		
		if(livro.isPresent()) {
			carrinho.remove(livro.get());
		}		
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}
	
		
	@PostMapping("/atualizar")
	public ModelAndView atualizarQuantidade(Long idLivro, Integer quantidade) {
		modelAndView.setViewName("carrinho");
		Livro l = livroRepository.getById(idLivro);
		carrinho.atualizaQtd(l, quantidade);		
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}
	
	
	
	
}
