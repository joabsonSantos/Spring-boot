
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

	<title>Pedido Finalizado</title>
</head>

<body class="">
	<%@ include file="header.jsp" %>
	
	<section class="container-fluid p-2 mb-5">

		<a class="btn btn-primary" href="/">Inicio</a>


		<div class="container mt-4">

			<div class="container-fluid bg-light rounded p-5">
				<div class="row d-flex justify-content-center">
					<div class="col-12 text-center">
						<img  height="200px" src="/resources/img/check-pedido.svg">
						<h1 class="text-center mt-4 text-success font-weight-bold text-capitalize">Pedido Finalizado com Sucesso</h1>
					</div>
					<div class="col-12 text-center">
						...
					</div>
				</div>
			</div>
		</div>




	</section>


<%@ include file="admin/footer.jsp" %>

</body>

</html>