package com.fenix.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fenix.sales.entity.Autor;
import com.fenix.sales.entity.Livro;
import com.fenix.sales.repository.AutorRepository;
import com.fenix.sales.repository.CategoriaRepository;
import com.fenix.sales.repository.EditoraRepository;
import com.fenix.sales.repository.LivroRepository;

@Controller
public class IndexController {
	ModelAndView modelAndView = new ModelAndView();

	@Autowired
	LivroRepository livrorepository;
	@Autowired
	CategoriaRepository categoriarepository;
	@Autowired
	AutorRepository autorrepository;
	@Autowired
	EditoraRepository editorarepository;

	@GetMapping("/")
	public ModelAndView index() {
		modelAndView.addObject("disp", "flex");
		modelAndView.setViewName("redirect:/index");
		return modelAndView;
	}

	@GetMapping("/admin")
	public ModelAndView admin() {
		modelAndView.setViewName("/index");
		return modelAndView;
	}

	@GetMapping("/index")
	public ModelAndView vendasLivros(Livro livro) {
		modelAndView.setViewName("index");
		modelAndView.addObject("disp", "flex");
		modelAndView.addObject("livros", livrorepository.findByDestaqueTrue());
		modelAndView.addObject("categorias", categoriarepository.findAll());
		modelAndView.addObject("autores", autorrepository.findAll());
		modelAndView.addObject("editoras", editorarepository.findAll());
		return modelAndView;
	}
	
	@PostMapping("/filtroTitulo")
	public ModelAndView filtrarTitulo(Livro livro) {
		modelAndView.setViewName("index");
		modelAndView.addObject("livros", livrorepository.findByTituloContainingIgnoreCase(livro.getTitulo()));
		return modelAndView;
	}
	
	
	@GetMapping("/buscarAutor/{id}")
	public ModelAndView buscarPorAutor(@PathVariable Long id,Livro livro) {
		modelAndView.setViewName("index");
		Autor autor = autorrepository.findById(id).get();
		modelAndView.addObject("livros", livrorepository.findByAutor(autor));
		return modelAndView;
	}
	
	
	@GetMapping("/detalhes/{id}")
	public ModelAndView detalhesLivro(@PathVariable Long id,Livro livro) {
		modelAndView.setViewName("detalhes");
		modelAndView.addObject("livro", livrorepository.findById(id).get());
//		modelAndView.addObject("s", "show");
		return modelAndView;
	}
	

}










