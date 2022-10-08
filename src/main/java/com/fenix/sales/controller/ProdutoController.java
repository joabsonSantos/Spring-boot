import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fenix.sales.entity.Produto;
import com.fenix.sales.infra.FileSaver;

public class ProdutoController {
	ModelAndView modelAndView = new ModelAndView();
	
	@Autowired
	FileSaver file;

	
	@GetMapping("/produtos")
	public ModelAndView ListarProdutos() {
		modelAndView.setViewName("listarProdutos");
		//List<Produtos> produtos = service.findAll();
		return modelAndView;
	}

	@GetMapping("/cadastrarProduto")
	public ModelAndView CadastrarProduto(Produto produto) {
		modelAndView.setViewName("cadastrarProduto");
		return modelAndView;
	}


	@PostMapping("/cadastro")
	public ModelAndView Cadastrar(Produto produto,RedirectAttributes redirectAttributes, MultipartFile imagem) {
		String foto = file.write("imagens-produtos", imagem);
		produto.setFoto(foto);
		modelAndView.setViewName("listarProdutos");
		return modelAndView;
	}
	
	
	@GetMapping("/ExcluirProduto/{id}")
	public ModelAndView ExcluirProduto(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		modelAndView.setViewName("listarProdutos");
		return modelAndView;
	}

	@GetMapping("/EditarProduto/{id}")
	public ModelAndView EditarProduto(@PathVariable Long id, RedirectAttributes redirectAttributes, MultipartFile imagem) {
		modelAndView.setViewName("listarProdutos");
		return modelAndView;
	}
	
	@PostMapping("/Edicao")
	public ModelAndView UpdateProduto(Produto produto, MultipartFile imagem) {
		if (!imagem.isEmpty()) {
			file.remove(produto.getFoto());
			String foto = file.write("imagens-produtos", imagem);
			produto.setFoto(foto);
		}
		//service.save(produto);
		modelAndView.setViewName("listarProdutos");
		return modelAndView;
	}
	
}
