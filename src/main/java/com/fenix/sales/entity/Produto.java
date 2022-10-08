package com.fenix.sales.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name= "tbl_Produtos")
public class Produto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@NotBlank
	private String nome;
	@NotBlank
	private String descricao;
	private Long estoque = (long) 1;
	@NotBlank
	private Integer codigo;
	private String foto;
	
	public Produto() {
		
	}

	public Produto(Long id, @NotBlank String nome, @NotBlank String descricao, Long estoque, @NotBlank Integer codigo) {
		super();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.estoque = estoque;
		this.codigo = codigo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Long getEstoque() {
		return estoque;
	}

	public void setEstoque(Long estoque) {
		this.estoque = estoque;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	
	
	

}
