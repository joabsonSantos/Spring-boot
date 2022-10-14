package com.fenix.sales.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name= "tbl_categorias")
public class Categoria {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String nome;
	private boolean status;
	
	
	public Categoria(Integer id,String nome, boolean status) {
		super();
		this.id = id;
		this.nome = nome;
		this.status = status;
	}


	public Categoria() {
		super();
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getnome() {
		return nome;
	}


	public void setnome(String nome) {
		this.nome = nome;
	}


	public boolean isstatus() {
		return status;
	}


	public void setstatus(boolean status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Categoria [id=" + id + ", nome=" + nome + ", status=" + status + "]";
	}
	
	

}
