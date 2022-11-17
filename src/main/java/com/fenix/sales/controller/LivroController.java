package com.fenix.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Livro;
import com.fenix.sales.infra.FileSaver;
import com.fenix.sales.repository.AutorRepository;
import com.fenix.sales.repository.CategoriaRepository;
import com.fenix.sales.repository.EditoraRepository;
import com.fenix.sales.repository.LivroRepository;

@Controller
public class LivroController {
	ModelAndView modelAndView = new ModelAndView();
	
	@Autowired
	LivroRepository livroRepository;
	@Autowired
	CategoriaRepository categoriaRepository;
	@Autowired
	AutorRepository autorRepository;
	@Autowired
	EditoraRepository editoraRepository;
	@Autowired
	FileSaver filesaver;
	
	
	@GetMapping("/admin/livros")
	public ModelAndView ListarLivros(Livro livro) {
		modelAndView.setViewName("admin/formLivro");
		modelAndView.addObject("livros", livroRepository.findAll());
		modelAndView.addObject("categorias", categoriaRepository.findAll());
		modelAndView.addObject("autores", autorRepository.findAll());
		modelAndView.addObject("editoras", editoraRepository.findAll());
		return modelAndView;
	}
	
	@GetMapping("/admin/cadastrarLivros")
	public ModelAndView livros(Livro livro) {
		ModelAndView modelAndView = new ModelAndView("/admin/livros");
		return modelAndView;
	}
	
	@PostMapping("/admin/cadastrarLivro")
	public ModelAndView cadastrarLivro(MultipartFile foto1, Livro livro) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/livros");	
		String foto = filesaver.write("imagens", foto1);
		System.out.println(foto);
		livro.setFoto(foto);
		livroRepository.save(livro);
		return modelAndView;
	}
	
	@GetMapping("/admin/listLivros")
	public ModelAndView listarLivro() {
		ModelAndView modelAndView = new ModelAndView("admin/listLivros");
		return modelAndView;
	}
	
	@GetMapping("/admin/ExcluirLivro/{id}")
	public ModelAndView ExcluirLivro(@PathVariable Long id, RedirectAttributes redirectAttributes) {
	    modelAndView.setViewName("redirect:/admin/Livro");
	    Livro livro = livroRepository.findById(id).get();
	    livro.setStatus(false);
        livroRepository.save(livro);
		return modelAndView;
	}
	

	@GetMapping("/editarLivro/{id}")
	public ModelAndView editarLivro(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("admin/atualizarLivro");
		return modelAndView;
	}

	@PostMapping("/editarLivro")
	public ModelAndView update (Livro livro, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listLivros");
		return modelAndView;
	}

}
