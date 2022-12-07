package com.fenix.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView excluirLivro(@PathVariable Long id) {
	    modelAndView.setViewName("redirect:/admin/livros");
	    Livro livro = livroRepository.findById(id).get();
	    livro.setStatus(false);
        livroRepository.save(livro);
		return modelAndView;
	}
	
	@GetMapping("/admin/ativarLivro/{id}")
	public ModelAndView ativarLivro(@PathVariable Long id) {
	    modelAndView.setViewName("redirect:/admin/livros");
	    Livro livro = livroRepository.findById(id).get();
	    livro.setStatus(true);
        livroRepository.save(livro);
		return modelAndView;
	}
	

	@GetMapping("/editarLivro/{id}")
	public ModelAndView editarLivro(@PathVariable("id") Long id,Livro livro) {
		modelAndView.setViewName("admin/atualizarLivro");
		modelAndView.addObject("livro", livroRepository.findById(id).get());
		System.out.println(livroRepository.findById(id).get());
		return modelAndView;
	}

	@PostMapping("/editarLivro")
	public ModelAndView updateLivro(MultipartFile foto1, Livro livro) {
		modelAndView.setViewName("redirect:/admin/livros");
		Livro l = livroRepository.findById(livro.getId()).get();
		l.setAutor(livro.getAutor());
		l.setCategoria(livro.getCategoria());
		l.setDescricao(livro.getDescricao());
		l.setDestaque(livro.isDestaque());
		l.setEditora(livro.getEditora());
		l.setPaginas(livro.getPaginas());
		l.setPreco(livro.getPreco());
		l.setStatus(livro.isStatus());
		l.setTitulo(livro.getTitulo());
		
		
		if(!foto1.isEmpty()) {
			filesaver.remove(livro.getFoto());
			String foto = filesaver.write("imagens", foto1);
			l.setFoto(foto);
		}
		
		livroRepository.save(l);
		return modelAndView;
	}
	
	
//	@PostMapping("/Edicao")
//	public ModelAndView Update(Pessoa p, MultipartFile imagem) {
//
//		Pessoa pessoa = service.finById(p.getId());
//		pessoa.setNome(p.getNome());
//		pessoa.setIdade(p.getIdade());
//		pessoa.setCelular(p.getCelular());
//		pessoa.setDocumento(p.getDocumento());
//		
//		if (!imagem.isEmpty()) {
//			file.remove(pessoa.getFoto());
//			String foto = file.write("imagens-pessoas", imagem);
//			pessoa.setFoto(foto);
//		}
//		
//		service.save(pessoa);
//		modelAndView.setViewName("redirect:/");
//		modelAndView.addObject("status", "sucesso");
//		modelAndView.addObject("mensagem", "Editado com sucesso!!");
//		modelAndView.addObject("s", "diseble");
//		return modelAndView;
//	}
	

}
