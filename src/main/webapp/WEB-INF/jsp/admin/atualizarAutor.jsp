<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/index.css">
<title>Atualizar Autor</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container bg-light mt-4 rounded shadow-1 mb-4">
		<div class="row">
			<div class="container-fluid">
			<h1 class="text-center p-2">Atualizar Autor</h1>
				<form:form action="${s:mvcUrl('AC#UpdateAutor').build()}"
					method="POST" modelAttribute="autores">
					<div class="row m-5 d-flex justify-content-center shadow-1">
						<div class="col-sm-12 col-md-6 p-2 ">

							<form:input type="hidden" path="id" />

							<label for="nome">Nome:</label>
							<form:input path="nome" class="form-control" value="${autores.nome}" />

<%-- 							<form:select path="status" class="form-control mt-3"> --%>
<%-- 								<form:option value="true" label="Ativo" /> --%>
<%-- 								<form:option value="false" label="Inativo" /> --%>
<%-- 							</form:select> --%>

							<button class="btn btn-md btn-block btn-success mt-5 mb-5"
								type="submit">Atualizar</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>