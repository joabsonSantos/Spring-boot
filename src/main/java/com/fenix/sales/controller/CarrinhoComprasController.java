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
	
	
	@GetMapping
	public ModelAndView carrinho(Livro livro) {
		modelAndView.setViewName("carrinho");
		modelAndView.addObject("livros", carrinho.getItens());
		modelAndView.addObject("itens", carrinho.getItens().size());
		modelAndView.addObject("total", carrinho.totalCarrinho());
		return modelAndView;
	}

	@GetMapping("/add/{id}")
	public ModelAndView adicionaLivro(@PathVariable Long id, Livro l) {
		Optional<Livro> livro = livroRepository.findById(id);
		modelAndView.addObject("itens", carrinho.getItens().size());

		if (livro.isPresent()) {
			carrinho.add(livro.get());
		}

		modelAndView.setViewName("redirect:/carrinho");
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}

	@GetMapping("/delete/{id}")
	public ModelAndView excluirLivro(@PathVariable Long id, Livro l) {
		modelAndView.setViewName("carrinho");
		Optional<Livro> livro = livroRepository.findById(id);

		if (livro.isPresent()) {
			carrinho.remove(livro.get());
		}
		modelAndView.addObject("total", carrinho.totalCarrinho());
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}

	@PostMapping("/atualizar")
	public ModelAndView atualizarQuantidade(Long idLivro, Integer quantidade, Livro livro) {
		Livro l = livroRepository.getById(idLivro);
		carrinho.atualizaQtd(l, quantidade);
		modelAndView.setViewName("redirect:/carrinho");
		modelAndView.addObject("livros", carrinho.getItens());
		return modelAndView;
	}
	
	
	@GetMapping("/pagamento")
	public ModelAndView pagamento(Livro livro) {
		modelAndView.addObject("total", carrinho.totalCarrinho());
		modelAndView.addObject("itens", carrinho.getItens().size());
		modelAndView.addObject("livros", carrinho.getItens());
		modelAndView.setViewName("pagamento");
		return modelAndView;
	}
	
	@GetMapping("/chekout")
	public ModelAndView finalize(Livro livro) {
		modelAndView.setViewName("redirect:/index");
		carrinho.clear();
		return modelAndView;
	}

}
