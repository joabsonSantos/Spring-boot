<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!-- Import da taglib -->
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<link rel="stylesheet" href="/resources/css/index.css">
				<title>Cadastrar Livros</title>
			</head>

			<body>

				<%@ include file="header.jsp" %>

					<main class="main mb-5">

						<div class="container bg-light mt-4 rounded shadow-1">
							<div class="row">
								<div class="container-fluid">
									<form:form action="${s:mvcUrl('LC#cadastrarLivro').build()}" method="POST"
										modelAttribute="livro" enctype="multipart/form-data">"
										
										<div class="row m-5 d-flex justify-content-center shadow-1">
											<div class="col-sm-12 col-md-6 p-2 ">
												
												<label>Titulo:</label>
												<form:input  class="form-control" path="titulo"/>
												
												<label>Páginas:</label>
												<form:input  class="form-control" path="paginas"/>
												
												<label>Autor:</label>
												<form:select path="autor" class="form-control mt-3"> 
													<form:option value="NONE"> -- SELECT--</form:option>
													<form:options items= "${autores}" itemLabel="nome"/>
												</form:select>
												
												<label>Editora:</label>
												<form:select path="editora" class="form-control mt-3"> 
													<form:option value="NONE"> -- SELECT--</form:option>
													<form:options items= "${editoras}" itemLabel="descricao"/>
												</form:select>
												
												<label>Foto:</label>
												<input type="file"  class="form-control" name="foto"/>
												
												<label>Preço:</label>
												<form:input  class="form-control" path="preco"/>
												
												<label>Destaque:</label>
												<form:input  class="form-control" path="destaque"/>
												
												<label>Ativo:</label>
												<form:input  class="form-control" path="ativo"/>
												
												<label>Categoria:</label>
												<form:select path="categoria" class="form-control mt-3"> 
													<form:option value="NONE"> -- SELECT--</form:option>
													<form:options items= "${categorias}" itemLabel="nome"/>
												</form:select>
												
												
												<button class="btn btn-md btn-block btn-success mt-5 mb-5"
													type="button">Cadastrar</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>

							<div class="row">
								<div class="container w-100 m-5 shadow-1">
									<h3 class="text-center p-2">Categorias cadastradas</h3>
									<div class="container-fluid  table-responsive-md">
										<table class="table table-sm table-hover table-bordered text-center">
											<thead class="thead-dark">
												<th colspan="3">Nome:</th>
												<th>Editar</th>
												<th>Excluir</th>
											</thead>

											<tbody>
												<tr>
													<td colspan="3">teste</td>
													<td><button class="btn-edite"></button></td>
													<td><button class="btn-delete"></button></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
					</main>

					<%@ include file="footer.jsp" %>
			</body>

			</html>