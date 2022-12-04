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
<title>Cadastrar Livros</title>
</head>

<body>

	<%@ include file="header.jsp"%>

	<main class="main mb-5">

		<div class="container-fluid mt-4 ">


			<div class="row">
				<div class="container-fluid w-100 m-5 bg-light rounded shadow-1">
					<h3 class="text-center p-2">Livros Cadastrados</h3>
					<div class="container-fluid  table-responsive-md">
						<table
							class="table table-sm table-hover table-bordered text-center">
							<thead class="thead-dark">
								<tr>
									<th>Foto</th>
									<th>Titulo</th>
									<th>Paginas</th>
									<th>Autor</th>
									<th>Editora</th>
									<th>Valor</th>
									<th>Destaque ?</th>
									<th>Status</th>
									<th>Categoria</th>
									<th>Editar</th>
									<th>Exclusão</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${livros}" var="reg">
									<tr>
										<td><img width="100rem" src="/${reg.foto}"
											alt="Card image"></td>
										<td>${reg.titulo}</td>
										<td>${reg.paginas}</td>
										<td>${reg.autor.nome}</td>
										<td>${reg.editora.descricao}</td>
										
										<td>${reg.preco}</td>
										<td>${reg.destaque}</td>
										<td>${reg.status}</td>
										<td>${reg.categoria.nome}</td>
										
										<td><button class="btn-edite"></button></td>

										<c:if test="${reg.status}">
											<td>
											<a class="btn-excluir">
<%-- 												href="${s:mvcUrl('CC#ExcluirCategoria').arg(0, reg.id).build()}"> --%>
												
												Desativar</a>
											</td>
										</c:if>
										<c:if test="${!reg.status}">
											<td><a class="btn-excluir">
<%-- 												href="${s:mvcUrl('CC#AtivarCategoria').arg(0, reg.id).build()}"> --%>
												
												Ativar</a>
											</td>
										</c:if>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="container bg-light rounded shadow-1">
					<h3 class="text-center p-2">Cadastrar Livros</h3>
					<form:form action="${s:mvcUrl('LC#cadastrarLivro').build()}"
						method="POST" modelAttribute="livro" enctype="multipart/form-data">

						<div class="row m-5 d-flex justify-content-center shadow-1">
							<div class="col-sm-12 col-md-6 p-2 ">

								<label class="mt-3">Titulo:</label>
								<form:input class="form-control" path="titulo" />
								
								<label class="mt-3">Descrição:</label>
								<form:input class="form-control" path="descricao" />

								<label class="mt-3">Páginas:</label>
								<form:input class="form-control" path="paginas" />

								<label class="mt-3">Autor:</label>
								<form:select path="autor" class="form-control mt-3">
									<form:option value="NONE"> -- SELECT--</form:option>
									<form:options items="${autores}" itemLabel="nome" />
								</form:select>

								<label class="mt-3">Editora:</label>
								<form:select path="editora" class="form-control mt-3">
									<form:option value="NONE"> -- SELECT--</form:option>
									<form:options items="${editoras}" itemLabel="descricao" />
								</form:select>

								<label class="mt-3">Categoria:</label>
								<form:select path="categoria" class="form-control mt-3">
									<form:option value="NONE"> -- SELECT--</form:option>
									<form:options items="${categorias}" itemLabel="nome" />
								</form:select>
									
								<label class="mt-3" for="foto1">Foto:</label> 
								<input type="file" class="form-control"
									name="foto1" />
									 
								<label class="mt-3">Preço:</label>
								<form:input class="form-control" path="preco" required="required" value="100"/>

								<label class="mt-3">Destaque:</label>
<%-- 								<form:input class="form-control" path="destaque" required="required" value="true"/> --%>
								<form:select path="destaque" class="form-control mt-3">
									<form:option value="false" label="Não destacar" />
									<form:option value="true" label="Destaque" selected="selected" />
								</form:select>

<!-- 								<label class="mt-3">Ativo:</label> -->
<%-- 								<form:input class="form-control" path="status" /> --%>

						


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