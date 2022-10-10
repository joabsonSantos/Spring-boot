package com.fenix.sales.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fenix.sales.entity.Livro;

public interface LivroRepository extends JpaRepository<Livro, Long> {

}
