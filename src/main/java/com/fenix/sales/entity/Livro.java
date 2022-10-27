package com.fenix.sales.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "tbl_livros")
public class Livro {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@NotBlank
	private String titulo;
	@NotNull
	private Integer paginas;
	@NotNull
	@OneToOne
	private Autor autor;
	@NotNull
	@OneToOne
	private Editora editora;
	private String foto;
	private double preco;
	private boolean destaque;
	private boolean ativo;
	@OneToOne
	private Categoria categoria;
	
	
	public Livro(Long id, @NotBlank String titulo, @NotNull Integer paginas, @NotNull Autor autor,
			@NotNull Editora editora, String foto, double preco, boolean destaque, boolean ativo, Categoria categoria) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.paginas = paginas;
		this.autor = autor;
		this.editora = editora;
		this.foto = foto;
		this.preco = preco;
		this.destaque = destaque;
		this.ativo = ativo;
		this.categoria = categoria;
	}
	

	public Livro() {
		super();
	}



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


	public Integer getPaginas() {
		return paginas;
	}


	public void setPaginas(Integer paginas) {
		this.paginas = paginas;
	}


	public Autor getAutor() {
		return autor;
	}


	public void setAutor(Autor autor) {
		this.autor = autor;
	}


	public Editora getEditora() {
		return editora;
	}


	public void setEditora(Editora editora) {
		this.editora = editora;
	}


	public String getFoto() {
		return foto;
	}


	public void setFoto(String foto) {
		this.foto = foto;
	}


	public double getPreco() {
		return preco;
	}


	public void setPreco(double preco) {
		this.preco = preco;
	}


	public boolean isDestaque() {
		return destaque;
	}


	public void setDestaque(boolean destaque) {
		this.destaque = destaque;
	}


	public boolean isAtivo() {
		return ativo;
	}


	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}


	public Categoria getCategoria() {
		return categoria;
	}


	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}


	@Override
	public String toString() {
		return "Livro [id=" + id + ", titulo=" + titulo + ", paginas=" + paginas + ", autor=" + autor + ", editora="
				+ editora + ", foto=" + foto + ", preco=" + preco + ", destaque=" + destaque + ", ativo=" + ativo
				+ ", categoria=" + categoria + "]";
	}



}
