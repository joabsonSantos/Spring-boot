package com.fenix.sales.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fenix.sales.entity.Autor;
import com.fenix.sales.entity.Categoria;
import com.fenix.sales.entity.Editora;
import com.fenix.sales.entity.Livro;

public interface LivroRepository extends JpaRepository<Livro, Long> {

	List<Livro> findByDestaqueTrue();

	List<Livro> findByTituloContainingIgnoreCase(String titulo);

	List<Livro> findByAutor(Autor autor);

	List<Livro> findByEditora(Editora editora);
	
	List<Livro> findByCategoria(Categoria categoria);

}
