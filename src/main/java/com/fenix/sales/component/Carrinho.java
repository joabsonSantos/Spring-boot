package com.fenix.sales.component;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.fenix.sales.entity.Livro;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class Carrinho {
	Map<Livro, Integer> carrinho = new LinkedHashMap<>();

	public Collection<Livro> getItens() {
		return carrinho.keySet();
		
	}

	public void add(Livro livro) {
		carrinho.put(livro, getQtdLivro(livro));
	}

	private Integer getQtdLivro(Livro livro) {
		if (!carrinho.containsKey(livro)) {
			return 1;
		} else {
			return carrinho.get(livro) + 1;
		}

	}

	public Integer getQtdLivroTela(Livro livro) {
		if (!carrinho.containsKey(livro)) {
			return 1;
		} else {
			return carrinho.get(livro);
		}
	}

	public void remove(Livro livro) {
		carrinho.remove(livro);		
	}

	public void atualizaQtd(Livro l, Integer quantidade) {
		carrinho.put(l, quantidade);
	
	}
	
	public Double totalCarrinho() {
		double total = 0;
		for (Livro item : carrinho.keySet()) {
			//System.out.println(item);
			//System.out.println(getQtdLivroTela(item));
			total += item.getPreco() * getQtdLivroTela(item);
//			System.out.println(total);
		}
		return total;
	}
	
}







