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
	<section class="container-fluid p-3">

		<a class="btn btn-primary" href="/">Voltar</a>


		<div class="container">




			<h1 class="text-center text-primary">Carrinho</h1>

			<c:if test="${empty livros}">
				<div class="text-center mt-5 alert alert-warning" role="alert">
					Tú não adicionou nada! <a class="btn btn-link" href="/">Voltar</a>
				</div>

			</c:if>


			<c:forEach items="${livros}" var="livro">

				<div class="row d-flex mt-5">

					<img class="card-img-top m-2 card-img" src="/${livro.foto}">

					<h5 class="card-title text-capitalize">${livro.titulo}</h5>
					<p class="card-text">Valor R$ ${livro.preco}</p>
					<p class="card-text">
						<small class="text-muted text-capitalize">Autor:${livro.autor.nome}</small>
						&nbsp;&nbsp;&nbsp; <small class="text-muted text-capitalize">Editora:
							${livro.editora.descricao}</small>
					</p>

					<form:form servletRelativeAction="/carrinho/atualizar" method="post">
						<input type="hidden" name="idLivro" value="${livro.id}"/>
						<input class="btn btn-primary btn-link" type="number" name="quantidade"
							value="${carrinho.getQtdLivroTela(livro)}"></input>
							
						<input type="submit" class="btn btn-primary" value="atualizar" />
						
					</form:form>

					<a class="btn btn-primary"
						href="${s:mvcUrl('CCC#excluirLivro').arg(0, livro.id).build()}">Excluir</a>
					
				</div>

			</c:forEach>




		</div>




	</section>


</body>
</html>