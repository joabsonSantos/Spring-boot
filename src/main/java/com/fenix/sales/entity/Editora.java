package com.fenix.sales.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_editora")
public class Editora {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	private String descricao;
	private boolean status = true;

	public Editora() {
	}

	public Editora(Integer id, String descricao, boolean status) {
		this.id = id;
		this.descricao = descricao;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
