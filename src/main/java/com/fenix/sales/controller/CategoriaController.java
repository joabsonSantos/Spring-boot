package com.fenix.sales.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fenix.sales.entity.Categoria;
import com.fenix.sales.repository.CategoriaRepository;


@Controller
public class CategoriaController {
	@Autowired
	CategoriaRepository categoriaRepository;
		
	@GetMapping("/admin/cadastraCategoria")
	public ModelAndView index(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
		return modelAndView;
	}
	
	@PostMapping("admin/seveCategoria")
    public ModelAndView cadastra(Categoria categoria) {
        ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
        categoriaRepository.save(categoria);
        return modelAndView;
    }
	
	@GetMapping("admin/listCategorias")
	public ModelAndView listarCategorias(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");        
		List<Categoria> categorias = categoriaRepository.findAll();
		modelAndView.addObject("registros", categorias);
		return modelAndView;
	}
	
	
	
	
	
//	
//	
//	
//	@GetMapping("/excluircategoria/{id}")
//	public ModelAndView excluirCategorias(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
//		ModelAndView modelAndView = new ModelAndView("redirect:/admin/formCategoria");
//		Categoria categoria = categoriaRepository.findById(id).get();
//		categoriaRepository.delete(categoria);
//		redirectAttributes.addFlashAttribute("Mensagem", "Categoria excluida com sucesso");
//		return modelAndView;
//	}
//
//	@GetMapping("/editarCategoria/{id}")
//	public ModelAndView editar(@PathVariable("id") Integer id, Categoria categoria, RedirectAttributes redirectAttributes) {
//		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
//		//categoria = categoriaRepository.getById(id);
//		//modelAndView.addObject("categ", categoria);
//		return modelAndView;
//	}
//
//	@PostMapping("/editarCategoria")
//	public ModelAndView update (@Valid Categoria categoria, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
//		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listCategorias");
//		
//		if(bindingResult.hasErrors()) {
//			return editar(categoria.getId(), categoria, redirectAttributes);
//		} 
//		
//		//Categoria categ1 = categoriaRepository.getById(categoria.getId());
//		//categ1.setnome(categoria.getnome()) ;
//		//categoriaRepository.save(categ1);
//		
//		return modelAndView;
//	}

}
