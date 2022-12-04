package com.fenix.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Editora;
import com.fenix.sales.infra.FileSaver;
import com.fenix.sales.repository.EditoraRepository;

@Controller
public class EditoraController {

	ModelAndView modelAndView = new ModelAndView();

	@Autowired
	EditoraRepository EditoraRepository;

	@Autowired
	FileSaver file;

	@GetMapping("/admin/editoras")
	public ModelAndView ListarEditoraes(Editora Editora) {
		modelAndView.setViewName("admin/formEditora");
		modelAndView.addObject("registros", EditoraRepository.findAll());
		return modelAndView;
	}

	@GetMapping("/admin/cadastraEditora")
	public ModelAndView CadastrarEditora(Editora Editora) {
		modelAndView.setViewName("admin/formEditora");
		return modelAndView;
	}

	@PostMapping("/admin/cadastroEditora")
	public ModelAndView editoraCadastra(Editora Editora) {
		modelAndView.setViewName("redirect:/admin/editoras");
		EditoraRepository.save(Editora);
		return modelAndView;
	}

//	@GetMapping("/admin/ExcluirEditora/{id}")
//	public ModelAndView ExcluirEditora(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
//	    modelAndView.setViewName("redirect:/admin/editoras");
//	    Editora Editora = EditoraRepository.findById(id).get();
//	    Editora.setStatus(false);
//        EditoraRepository.save(Editora);
//		return modelAndView;
//	}
//	
//	
//	@GetMapping("/admin/EditarEditora/{id}")
//	public ModelAndView EditarEditora(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
//		modelAndView.setViewName("admin/formEditora");
//		return modelAndView;
//	}
//	
//
//
//	@PostMapping("/admin/EdicaoEditora")
//	public ModelAndView UpdateEditora(Editora Editora) {
//		modelAndView.setViewName("admin/formEditora");
//		return modelAndView;
//	}

	@GetMapping("/admin/ExcluirEditora/{id}")
	public ModelAndView ExcluirEditora(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("redirect:/admin/editoras");
		Editora editora = EditoraRepository.findById(id).get();
		editora.setStatus(false);
		EditoraRepository.save(editora);
		return modelAndView;
	}

	@GetMapping("/admin/AtivarEditora/{id}")
	public ModelAndView AtivarEditora(@PathVariable Integer id) {
		modelAndView.setViewName("redirect:/admin/editoras");
		Editora editora = EditoraRepository.findById(id).get();
		editora.setStatus(true);
		EditoraRepository.save(editora);
		return modelAndView;
	}

	@GetMapping("/admin/EditarEditora/{id}")
	public ModelAndView EditarEditora(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("admin/editoras");
		modelAndView.addObject("editoras", EditoraRepository.findById(id).get());
		return modelAndView;
	}

	@PostMapping("/admin/EdicaoEditora")
	public ModelAndView UpdateEditora(Editora editora) {
		modelAndView.setViewName("redirect:/admin/editoras");
		Editora editora1 = EditoraRepository.getById(editora.getId());
		editora1.setDescricao(editora.getDescricao());
		EditoraRepository.save(editora1);

		return modelAndView;
	}

}
