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

import com.fenix.sales.entity.Categoria;
import com.fenix.sales.infra.FileSaver;
import com.fenix.sales.repository.CategoriaRepository;

@Controller
public class CategoriaController {
	ModelAndView modelAndView = new ModelAndView();
	
	@Autowired
	CategoriaRepository CategoriaRepository;

	@Autowired
	FileSaver file;

	@GetMapping("/admin/categorias")
	public ModelAndView ListarCategoriaes(Categoria Categoria) {
		modelAndView.setViewName("admin/formCategoria");
		modelAndView.addObject("registros", CategoriaRepository.findAll());
		return modelAndView;
	}

	@GetMapping("/admin/cadastraCategoria")
	public ModelAndView CadastrarCategoria(Categoria Categoria) {
		modelAndView.setViewName("admin/formCategoria");
		return modelAndView;
	}

	@PostMapping("/admin/cadastroCategoria")
	public ModelAndView categioraCadastrar(@Valid Categoria Categoria, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return CadastrarCategoria(Categoria);
		}
		
		modelAndView.setViewName("redirect:/admin/categorias");
		CategoriaRepository.save(Categoria);
		return modelAndView;
	}

	@GetMapping("/admin/ExcluirCategoria/{id}")
	public ModelAndView ExcluirCategoria(@PathVariable Integer id) {
	    modelAndView.setViewName("redirect:/admin/categorias");
	    Categoria categoria = CategoriaRepository.findById(id).get();
	    categoria.setStatus(false);
        CategoriaRepository.save(categoria);
		return modelAndView;
	}
	@GetMapping("/admin/AtivarCategoria/{id}")
	public ModelAndView AtivarCategoria(@PathVariable Integer id) {
	    modelAndView.setViewName("redirect:/admin/categorias");
	    Categoria categoria = CategoriaRepository.findById(id).get();
	    categoria.setStatus(true);
        CategoriaRepository.save(categoria);
		return modelAndView;
	}
	
	
	@GetMapping("/admin/EditarCategoria/{id}")
	public ModelAndView EditarCategoria(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("admin/formCategoria");
		return modelAndView;
	}
	


	@PostMapping("/admin/EdicaoCategoria")
	public ModelAndView UpdateCategoria(Categoria Categoria) {
		modelAndView.setViewName("admin/formCategoria");
		return modelAndView;
	}

}
