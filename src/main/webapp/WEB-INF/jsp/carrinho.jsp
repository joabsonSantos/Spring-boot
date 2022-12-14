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
		
		<div class="container bg-light rounded mt-4 py-5 shadow text-center">
			<div class="row">
			<div class="col-md-7 font-weight-bold">
				<div class="font-weight-normal fs-5">Subtotal (${itens} itens): &nbsp; <span class="font-weight-bold" style="font-size:1.65em"> R$ ${total}</span></div> 
			</div>
			<div class="col-md-4 d-flex align-items-center justify-content-center">
				<a style="text-decoration:none" class="btn-lg text-dark bg-warning btn-block text-decoration-none" href="/carrinho/pagamento">Fechar Pedido</a>
			</div>
			</div>
		</div>	
		
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
							<div class="col-8 text-justify mb-3">
								<h5>Descrição:</h5>
								<p class="text-wrap">
									${livro.descricao} 
								</p>
							</div>
							<div class="col-4 d-flex align-items-center justify-content-center">
								<h2 class="font-weight-bold text-center">R$ ${livro.preco*carrinho.getQtdLivroTela(livro)}</h2>
							</div>
							<div class="row m-3 w-100 d-flex  align-items-center justify-content-center">
								<div class="col-md-6 p-sm-2 d-flex align-items-center justify-content-center">

									<form:form id="form" servletRelativeAction="/carrinho/atualizar" method="POST" class="input-group form">
										<div class="input-group-prepend">
											<div class="input-group-text">Qtd</div>
										</div>

										<input type="hidden" name="idLivro" value="${livro.id}" />
										<input id="qtd" class="form-control" type="number" min ="1" name="quantidade" value="${carrinho.getQtdLivroTela(livro)}" />
										<input class="btn btn-success" value="atualizar" type="submit" />
									</form:form>
									
								
									
								</div>

								<div class="col col-sm-12 col-md-auto">
									<a class="btn btn-danger"
									href="${s:mvcUrl('CCC#excluirLivro').arg(0, livro.id).build()}">Excluir</a>
								</div>
							</div>

						</div>
					</div>

					
				</div>
				
			</div>
			</c:forEach>
			
			<div class="text-right pr-5" style="font-size:1.20em">(${itens} Itens ): Total carrinho <span class="font-weight-bold"> R$ ${total}</span> </div>
		</div>
	</section>

<%@ include file="admin/footer.jsp" %>



	
	<script type="text/javascript">
	//onchange="myFunction()"
		function myFunction() {
			let form = document.getElementById('form');
			//let form = document.getElementsByClassName('form');
// 			for(let item in form){
// 				item.submit();
// 			}
			form.submit();
		}
	</script>



</body>



</html>