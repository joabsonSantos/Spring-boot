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
import com.fenix.sales.repository.AutorRepository;

@Controller
public class AutorController {
	ModelAndView modelAndView = new ModelAndView();

	@Autowired
	AutorRepository autorRepository;

	@Autowired
	FileSaver file;

	@GetMapping("/admin/autores")
	public ModelAndView ListarAutores(Autor autor) {
		modelAndView.setViewName("admin/formAutor");
		modelAndView.addObject("registros", autorRepository.findAll());
		return modelAndView;
	}

	@GetMapping("/admin/cadastraAutor")
	public ModelAndView CadastrarAutor(Autor autor) {
		modelAndView.setViewName("admin/formAutor");
		return modelAndView;
	}

	@PostMapping("/admin/cadastro")
	public ModelAndView Cadastrar(Autor autor) {
		modelAndView.setViewName("redirect:/admin/autores");
		autorRepository.save(autor);
		return modelAndView;
	}

	@GetMapping("/admin/ExcluirAutor/{id}")
	public ModelAndView ExcluirAutor(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("redirect:/admin/autores");
		Autor autor = autorRepository.findById(id).get();
		autor.setStatus(false);
		autorRepository.save(autor);
		return modelAndView;
	}

	@GetMapping("/admin/AtivarAutor/{id}")
	public ModelAndView AtivarAutor(@PathVariable Long id) {
		modelAndView.setViewName("redirect:/admin/autores");
		Autor autor = autorRepository.findById(id).get();
		autor.setStatus(true);
		autorRepository.save(autor);
		return modelAndView;
	}

	@GetMapping("/admin/EditarAutor/{id}")
	public ModelAndView EditarAutor(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("redirect:/admin/autores");
		modelAndView.addObject("autores", autorRepository.findById(id).get());
		return modelAndView;
	}

	@PostMapping("/admin/EdicaoAutor")
	public ModelAndView UpdateAutor(Autor autor) {
		modelAndView.setViewName("redirect:/admin/autores");
		Autor autor1 = autorRepository.getById(autor.getId());
		autor1.setNome(autor.getNome());
		autorRepository.save(autor1);

		return modelAndView;
	}

}
