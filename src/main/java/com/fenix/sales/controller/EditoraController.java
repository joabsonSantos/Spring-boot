package com.fenix.sales.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Autor;
import com.fenix.sales.entity.Editora;
import com.fenix.sales.repository.EditoraRepository;

@Controller
public class EditoraController {
	
	@Autowired
	EditoraRepository editoraRepository;
	ModelAndView modelAndView = new ModelAndView();
	
	
	@GetMapping("/admin/editora")
	public ModelAndView form(Editora editora) {
		ModelAndView modelAndView = new ModelAndView("admin/formEditora");
		return modelAndView;
	}
	
	@PostMapping("/admin/cadastraeditora")
	public ModelAndView createEditora(@Valid Editora editora, BindingResult bindingResult, RedirectAttributes redirectAtributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/editora");
		
		if(bindingResult.hasErrors()) {
			return form(editora);
		}
		editoraRepository.save(editora);
		redirectAtributes.addFlashAttribute("create", editora.getDescricao() + " Editora cadastrada com sucesso!!!");
		return modelAndView;
	}
	
	@GetMapping("/admin/listeditoras")
	public ModelAndView listarEditoras() {
		ModelAndView modelAndView = new ModelAndView("admin/listEditoras");
		List<Editora> editoras = editoraRepository.findAll();
		modelAndView.addObject("sacolaEditora", editoras);
		return modelAndView;
	}
	@GetMapping("/admin/ExcluirEditora/{id}")
	public ModelAndView ExcluirEditora(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
	    modelAndView.setViewName("redirect:/admin/editora");
	    Editora editora = editoraRepository.findById(id).get();
	    editora.setStatus(false);
        editoraRepository.save(editora);
		return modelAndView;
	}

	@GetMapping("/admin/editareditora/{id}")
	public ModelAndView editar(@PathVariable("id") Integer id, Editora editora, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("admin/atualizarEditora");
		editora = editoraRepository.getById(id);
		modelAndView.addObject("edit", editora);
		return modelAndView;
	}

	@PostMapping("/editareditora")
	public ModelAndView update (@Valid Editora editora, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listEditoras");
		
		if(bindingResult.hasErrors()) {
			return editar(editora.getId(), editora, redirectAttributes);
		} 
		
		Editora edit1 = editoraRepository.getById(editora.getId());
		edit1.setDescricao(editora.getDescricao()) ;
		
		editoraRepository.save(edit1);
		return modelAndView;
	}

}
