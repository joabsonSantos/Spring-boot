<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/index.css">
<title>Edição de Livro</title>
</head>

<body>

	<%@ include file="header.jsp"%>

	<main class="main mb-5">

		<div class="container-fluid mt-4 ">

			<div class="row">
				<div class="container bg-light rounded shadow-1">
					<h3 class="text-center p-2">Edição de Livros</h3>
					<form:form action="${s:mvcUrl('LC#cadastrarLivro').build()}"
						method="POST" modelAttribute="livro" enctype="multipart/form-data">

						<div class="row m-5 d-flex justify-content-center shadow-1">
							<div class="col-sm-12 col-md-6 p-2 ">
							
								<form:input type="hidden" path="id" value="${livro.id}" />
								
								<label class="mt-3">Titulo:</label>
								<form:input class="form-control" path="titulo" value="${livro.titulo}" />
								
								<label class="mt-3">Descrição:</label>
								<form:input class="form-control" path="descricao" value="${livro.descricao}"/>

								<label class="mt-3">Páginas:</label>
								<form:input class="form-control" path="paginas" value="${livro.paginas}"/>
								

								<label class="mt-3">Autor:</label>
								<form:select path="autor" class="form-control mt-3">
									<form:option value="${livro.autor}"> -- SELECT--</form:option>
									<form:options items="${autores}" itemLabel="nome" />
								</form:select>

								<label class="mt-3">Editora:</label>
								<form:select path="editora" class="form-control mt-3">
									<form:option value="${livro.editora}"> -- SELECT--</form:option>
									<form:options items="${editoras}" itemLabel="descricao" />
								</form:select>

								<label class="mt-3">Categoria:</label>
								<form:select path="categoria" class="form-control mt-3">
									<form:option value="${livro.categoria}"> -- SELECT--</form:option>
									<form:options items="${categorias}" itemLabel="nome" />
								</form:select>
								
								
									
								<label class="mt-3" for="foto1">Foto:</label> 
								<input type="file" class="form-control"
									name="foto1" />
									 
								<label class="mt-3">Preço:</label>
								<form:input class="form-control" path="preco" required="required" value="${livro.preco}"/>

								<label class="mt-3">Destaque:</label>

								<form:select path="destaque" class="form-control mt-3">
									<form:option value="false" label="Não destacar" />
									<form:option value="true" label="Destaque" selected="selected" />
								</form:select>

								<button class="btn btn-md btn-block btn-success mt-5 mb-5"
									type="submit">Cadastrar</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>

		</div>
	</main>

	<%@ include file="footer.jsp"%>
</body>

</html>