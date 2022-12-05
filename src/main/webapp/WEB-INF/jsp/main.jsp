

<style>
	*{
		list-style:none;
	}
</style>

<div class="container-fluid" style="overflow: scroll">
	<div class="row flex-nowrap">

		<!-- aside -->
		<div
			class="col-auto col-md-2 col-xl-1 px-sm-2 ml-3 mr-0 p-4 d-none d-md-block d-lg-block">

			<div class="mt-5 d-block text-capitalize font-weight-bolder">Autores</div>

			<ul>
				<c:forEach items="${autores}" var="autor">
					<li class="text-capitalize pl-2"><small><a class="text-secondary"
						href="${s:mvcUrl('IC#buscarPorAutor').arg(0, autor.id).build()}">${autor.nome}</a></small>
					</li>
				</c:forEach>
			</ul>
			
			<div class="mt-2 d-block text-capitalize font-weight-bolder">Editoras</div>
			<ul >

				<c:forEach items="${editoras}" var="editora">
					<li class="text-capitalize pl-2"><small><a class="text-secondary"
						href="${s:mvcUrl('IC#buscarPorEditora').arg(0, editora.id).build()}">${editora.descricao}</a></small>
					</li>
				</c:forEach>
			</ul>
			
			<div class="mt-2 d-block text-capitalize font-weight-bolder">Categorias</div>	
			<ul >

				<c:forEach items="${categorias}" var="categoria">
					<li class="text-capitalize pl-2"><small><a class="text-secondary"
						href="${s:mvcUrl('IC#buscarPorCategoria').arg(0, categoria.id).build()}">${categoria.nome}</a></small>
					</li>
				</c:forEach>
			</ul>


			<div class="mt-5 d-block w-100 ">Administrativo</div>
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
									<a style="text-decoration: none;"
										href="${s:mvcUrl('IC#detalhesLivro').arg(0, r.id).build()}">
										<div class="card card-1 shadow-1">
											<img class="card-img-top m-2 card-img" src="/${r.foto}"
												alt="Card image cap">

											<div class="card-body">
												<h5 class="card-title text-capitalize text-truncate">${r.titulo}</h5>
												<p class="card-text">Valor R$ ${r.preco}</p>
												<p class="card-text">
													<small class="text-muted text-capitalize">Autor:
														${r.autor.nome}</small> &nbsp;&nbsp;&nbsp; <small
														class="text-muted text-capitalize">Editora:
														${r.editora.descricao}</small>
												</p>
											</div>
										</div>
									</a>
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
			</main>
		</div>
	</div>
</div>



