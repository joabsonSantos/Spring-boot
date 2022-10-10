package com.fenix.sales.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Categoria;
import com.fenix.sales.infra.FileSaver;
import com.fenix.sales.repository.CategoriaRepository;


@Controller
public class CategoriaController {
	@Autowired
	CategoriaRepository categoriaRepository;
	@Autowired
	FileSaver fileSaver;
	
	@GetMapping("/admin/categorias")
	public ModelAndView form(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
		return modelAndView;
	}
	
	@PostMapping("/admin/cadastarcategoria")
	public ModelAndView create(@Valid Categoria categoria, BindingResult bindingResult, RedirectAttributes redirectAtributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/formCategoria");
		
		if(bindingResult.hasErrors()) {
			return form(categoria);
		}
					
		System.out.println(categoria);
		categoriaRepository.save(categoria);
		redirectAtributes.addFlashAttribute("create", categoria.getDescricao() + " Categoria cadastrada com sucesso!!!");
		return modelAndView;
	}
	
	@GetMapping("/admin/listcategorias")
	public ModelAndView listarCategorias() {
		ModelAndView modelAndView = new ModelAndView("admin/listCategorias");
		List<Categoria> categorias = categoriaRepository.findAll();
		modelAndView.addObject("sacolaCategoria", categorias);
		System.out.println("listar Categorias");
		return modelAndView;
	}
	@GetMapping("/excluircategoria/{id}")
	public ModelAndView excluirCategorias(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listcategorias");
		Categoria categoria = categoriaRepository.findById(id).get();
		categoriaRepository.delete(categoria);
		redirectAttributes.addFlashAttribute("Mensagem", "Categoria excluida com sucesso");
		System.out.println("Excluiu a categoria");
		return modelAndView;
	}

	@GetMapping("/editarcategoria/{id}")
	public ModelAndView editar(@PathVariable("id") Integer id, Categoria categoria, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("admin/categoriaAtualizar");
		categoria = categoriaRepository.getById(id);
		System.out.println(categoria);
		modelAndView.addObject("categ", categoria);
		return modelAndView;
	}

	@PostMapping("/editarcategoria")
	public ModelAndView update (@Valid Categoria categoria, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listcategorias");
		
		if(bindingResult.hasErrors()) {
			return editar(categoria.getId(), categoria, redirectAttributes);
		} 
		
		Categoria categ1 = categoriaRepository.getById(categoria.getId());
		categ1.setDescricao(categoria.getDescricao()) ;
		
		categoriaRepository.save(categ1);
		return modelAndView;
	}

}
