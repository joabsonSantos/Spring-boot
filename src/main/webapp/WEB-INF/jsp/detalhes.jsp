<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/index.css">
<title>Home</title>
</head>

<body class="">
	<section class="bg-dark container-fluid p-2">
	
	<a class="btn btn-primary" href="/">Voltar</a>
	

		<div class="container">

			<div class="row d-flex justify-content-center">
				<div class="card m-5">
					<img class="card-img-top m-2 card-img" src="/${livro.foto}"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title text-capitalize">${livro.titulo}</h5>
						<p class="card-text">Valor R$ ${livro.preco}</p>
						<p class="card-text">
							<small class="text-muted text-capitalize">Autor:
								${livro.autor.nome}</small> &nbsp;&nbsp;&nbsp; <small
								class="text-muted text-capitalize">Editora:
								${livro.editora.descricao}</small>
						</p>
						
						<a class="btn btn-primary btn-link" href="${s:mvcUrl('CCC#adicionaLivro').arg(0, livro.id).build()}" >Adicionar</a>
					</div>
				</div>


			</div>
		</div>




	</section>


</body>
</html>