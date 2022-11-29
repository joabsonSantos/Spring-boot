<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/index.css">
	<title>Carrinho</title>
</head>

<body class="">

	<%@ include file="header.jsp" %>

	<section class="container-fluid p-3 mb-5">

		<div class="container bg-light rounded mt-4 py-4">
			
			<h1 class="text-center text-primary m-4 p3-5">Carrinho</h1>

			<c:if test="${empty livros}">
				<div class="text-center my-5 alert alert-warning" role="alert">
					Tú não adicionou nada! <a class="btn btn-link" href="/">Voltar</a>
				</div>
			</c:if>
			
			<c:forEach items="${livros}" var="livro">
			<div class="container-fluid  bg-light rounded p-5">
					
				<div class="row d-flex justify-content-center bg-light p-3 shadow-1">
				
					<div class="col-3 p-2 bg-dark rounded">
						<img class="img-fluid" src="/${livro.foto}" height="350em">
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
								<span class="badge badge-primary">Categoria: ${livro.editora.descricao}</span>
							</div>
						</div>
						<div class="row d-flex justify-content-space-around mt-5">
							<div class="col-8 text-justify">
								<h5>Descrição:</h5>
								<p class="text-wrap"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia
									deleniti laudantium
									hic magni sunt temporibus dolore reprehenderit exercitationem, perferendis tempora
									itaque inventore earum reiciendis eum eos voluptas expedita tenetur eligendi.
								</p>
							</div>
							<div class="col-4 d-flex align-items-center justify-content-center">
								<h2 class="font-weight-bold text-center">R$ ${livro.preco*carrinho.getQtdLivroTela(livro)}</h2>
							</div>
							<div class="row d-flex align-items-center">
								<div class="col-auto">

									<form:form servletRelativeAction="/carrinho/atualizar" method="POST" class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">Qtd</div>
										</div>

										<input type="hidden" name="idLivro" value="${livro.id}" />
										<input class="form-control" type="number" min ="1" name="quantidade" value="${carrinho.getQtdLivroTela(livro)}"/>

<!-- 										<button type="submit" class="btn btn-success" value="atualizar">atualizar</button> -->
										<input class="btn btn-success" value="atualizar" type="submit" />
									</form:form>
									
									
<%-- 									<form:form class="input-group" action="${s:mvcUrl('IC#filtrarTitulo').build()}" method="POST" modelAttribute="livro"> --%>
<%-- 										<form:input class="form-control me-2" path="titulo" type="search" placeholder="Pesquisar" aria-label="pesquisar" /> --%>
<!-- 										<button class="bg-success bg-gradiente btn  btn-outline-success text-light" type="submit">Pesquisar</button>	 -->
<%-- 									</form:form> --%>
									
								</div>

								<div class="col">
									<a class="btn btn-danger"
									href="${s:mvcUrl('CCC#excluirLivro').arg(0, livro.id).build()}">Excluir</a>
								</div>
							</div>

						</div>
					</div>

					
				</div>
				
			</div>
			</c:forEach>
			
			<h1 class="text-right pr-5">Total carrinho R$  </h1>
		</div>
	</section>

<%@ include file="admin/footer.jsp" %>

</body>



</html>