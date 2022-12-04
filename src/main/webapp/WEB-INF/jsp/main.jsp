
<div class="container-fluid" style="overflow: scroll">
	<div class="row flex-nowrap">

		<!-- aside -->
		<div
			class="col-auto col-md-2 col-xl-2 px-sm-2 px-0 bg-light d-none d-md-block d-lg-block">

			<div class="bg-dark mt-2 d-block w-100 text-center text-white">Filtros</div>
			<div id="accordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">Filtar Por Autores</button>
						</h5>
					</div>

					<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordion">
						<div class="card-body">
							<ul class="list-group">

								<c:forEach items="${autores}" var="autor">
									<li class="list-group-item"><a
										href="${s:mvcUrl('IC#buscarPorAutor').arg(0, autor.id).build()}">${autor.nome}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse"
								data-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">Filtar Por Editoras</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#accordion">
						<div class="card-body">
							<ul class="list-group">

								<c:forEach items="${editoras}" var="editora">
									<li class="list-group-item"><a
										href="${s:mvcUrl('IC#buscarPorEditora').arg(0, editora.id).build()}">${editora.descricao}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse"
								data-target="#collapseThree" aria-expanded="false"
								aria-controls="collapseThree">Filtar Por Categorias</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#accordion">
						<div class="card-body">
							<ul class="list-group">

								<c:forEach items="${categorias}" var="categoria">
									<li class="list-group-item"><a
										href="${s:mvcUrl('IC#buscarPorCategoria').arg(0, categoria.id).build()}">${categoria.nome}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<div class="bg-dark mt-2 d-block w-100 text-center text-white">Administrativo</div>
			<div
				class="d-flex flex-column align-items-center align-items-sm-start px-0 pt-2 text-white min-vh-100">


				<ul class="navbar-nav d-block w-100 border-bottom">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle " data-toggle="dropdown" href="#">
							Cadastro </a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="/admin/livros">Cadastro de
								Livros</a> <a class="dropdown-item" href="/admin/categorias">Cadastro
								de Categorias</a> <a class="dropdown-item" href="/admin/autores">Cadastro
								de Autores</a> <a class="dropdown-item" href="/admin/editoras">Cadastro
								de Editoras</a>
						</div></li>
				</ul>

				<ul class="navbar-nav d-block w-100 border-bottom">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
							Edição </a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="/admin/livros">Editar Livros</a> <a
								class="dropdown-item" href="/admin/EditarCategoria">Editar
								Categorias</a> <a class="dropdown-item" href="/admin/autor">Editar
								Autores</a> <a class="dropdown-item" href="/admin/editora">Editar
								Editoras</a>
						</div></li>
				</ul>
			</div>


		</div>

		<!-- main -->
		<div class="col">
			<main class="main">

				<!-- Conteudo principal-->
				<div class="container bg-light mt-4 rounded shadow-1">

					<!-- 		<div class="row d-flex"> -->
					<!-- 			<nav class="navbar bg-light"> -->
					<!-- 				<div class="container-fluid"> -->
					<!-- 					<form class="d-flex" role="search"> -->
					<!-- 						<input class="form-control me-2" type="search" -->
					<!-- 							placeholder="Search" aria-label="Search"> -->
					<!-- 						<button class="btn btn-outline-success" type="submit">Search</button> -->
					<!-- 					</form> -->
					<!-- 				</div> -->
					<!-- 			</nav> -->
					<!-- 		</div> -->

					<div class="row">

						<div class="col p-4">

							<div
								class="d-flex justify-content-center align-items-center m-2 p-2">
								<h1 class="title text-center w-100">Livros</h1>
							</div>
							<!--  principal-->
							<!-- container -->
							<div
								class="container-fluid  d-flex flex-wrap flex-colum justify-content-center">

								<c:forEach items="${livros}" var="r">

									<!-- Card Produto -->
									<div class="card card-1 shadow-1">
										<%--<a class="" href="${s:mvcUrl('IC#detalhesLivro').arg(0, r.id).build()}">  --%>
										<a onclick="showModal()"
											href="${s:mvcUrl('IC#detalhesLivro').arg(0, r.id).build()}">
											<img class="card-img-top m-2 card-img" src="/${r.foto}"
											alt="Card image cap">
										</a>
										<div class="card-body">
											<h5 class="card-title text-capitalize">${r.titulo}</h5>
											<p class="card-text">Valor R$ ${r.preco}</p>
											<p class="card-text">
												<small class="text-muted text-capitalize">Autor:
													${r.autor.nome}</small> &nbsp;&nbsp;&nbsp; <small
													class="text-muted text-capitalize">Editora:
													${r.editora.descricao}</small>
											</p>
										</div>
									</div>
									<!-- Card Produto -->
								</c:forEach>
								<!-- Produtos -->

								<c:if test="${empty livros}">
									Não achei Registros!!	
								</c:if>

							</div>
							<!--Container-->

							<!-- principal -->
						</div>
					</div>
				</div>


				<!-- Modal -->
				<!-- 				<div class="modal fade" id="staticBackdrop" -->
				<!-- 					data-backdrop="static" data-keyboard="false" tabindex="-1" -->
				<!-- 					aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
				<!-- 					<div class="modal-dialog"> -->
				<!-- 						<div class="modal-content"> -->
				<!-- 							<div class="modal-header"> -->
				<!-- 								<h5 class="modal-title" id="staticBackdropLabel">Modal -->
				<!-- 									title</h5> -->
				<!-- 								<button type="button" class="close" data-dismiss="modal" -->
				<!-- 									aria-label="Close"> -->
				<!-- 									<span aria-hidden="true">&times;</span> -->
				<!-- 								</button> -->
				<!-- 							</div> -->
				<!-- 							<div class="modal-body"> -->

				<!-- 								<div class="card m-5"> -->
				<%-- 									<img class="card-img-top m-2 card-img" src="/${livro.foto}" --%>
				<!-- 										alt="Card image cap"> -->
				<!-- 									<div class="card-body"> -->
				<%-- 										<h5 class="card-title text-capitalize">${livro.titulo}</h5> --%>
				<%-- 										<p class="card-text">Valor R$ ${livro.preco}</p> --%>
				<!-- 										<p class="card-text"> -->
				<!-- 											<small class="text-muted text-capitalize">Autor: -->
				<%-- 												${livro.autor.nome}</small> &nbsp;&nbsp;&nbsp; <small --%>
				<!-- 												class="text-muted text-capitalize">Editora: -->
				<%-- 												${livro.editora.descricao}</small> --%>
				<!-- 										</p> -->
				<!-- 									</div> -->
				<!-- 								</div> -->

				<!-- 							</div> -->
				<!-- 							<div class="modal-footer"> -->
				<!-- 								<button type="button" class="btn btn-secondary" -->
				<!-- 									data-dismiss="modal">Close</button> -->
				<!-- 								<button type="button" class="btn btn-primary">Adicionar -->
				<!-- 									ao carrinho</button> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- Modal -->




			</main>
		</div>
	</div>
</div>



