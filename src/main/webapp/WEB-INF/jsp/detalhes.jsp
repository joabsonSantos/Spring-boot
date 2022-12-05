
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="pt-br">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/resources/css/index.css">

	<title>Home</title>
</head>

<body class="">
	<%@ include file="header.jsp" %>
	<section class="container-fluid p-2 mb-5">

		<a class="btn btn-primary" href="/">Voltar</a>


		<div class="container mt-4">

			<div class="container-fluid bg-light rounded p-5">
				<div class="row d-flex justify-content-center">
					<div class="col-3 px-4 py-2 bg-white rounded">
						<img src="/${livro.foto}" height="350em">
					</div>
					<div class="col-lg ml-3">
						<div class="row border-bottom p-3">
							<div class="col-sm">
								<h1 class="title text-capitalize">${livro.titulo}</h1>
							</div>
						</div>
						<div class="row">
							<div class="col-sm text-center">
								<small>Autor: ${livro.autor.nome}</small>
							</div>
							<div class="col-sm text-center">
								<small>Editora: ${livro.editora.descricao}</small>
							</div>
							<div class="col-sm text-center">
								<small class="badge badge-primary">Categoria: ${livro.editora.descricao}</small>
							</div>
						</div>
						<div class="row d-flex justify-content-space-around mt-5">
							<div class="col-8 text-justify">
								<h5>Descrição:</h5>
								<p class="text-wrap ">
									${livro.descricao}
								</p>
							</div>
							<div class="col-4 d-flex align-items-center justify-content-center">
								<h2 class="font-weight-bold text-center">R$ ${livro.preco}</h2>
							</div>
							<a class="btn btn-primary btn-block mt-5"
							href="${s:mvcUrl('CCC#adicionaLivro').arg(0, livro.id).build()}">Adicionar ao Carrinho</a>
						</div>
					</div>
				</div>
			</div>
		</div>




	</section>


<%@ include file="admin/footer.jsp" %>

</body>

</html>