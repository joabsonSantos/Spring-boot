package com.fenix.sales.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fenix.sales.entity.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

}
