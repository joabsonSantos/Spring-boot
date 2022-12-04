
<!-- Inicio Navbar -->
<header class="p-3  shadow" style="background-color: rgb(3, 178, 177);">
	<nav class="navbar navbar-expand-md navbar-dark  shadow-md">



		<div class="container">
			<!-- Logo-->
			<a class="navbar-brand" href="/">
				<img alt="LOGO" src="/resources/img/pilha-livros.png" width="80em">
			</a>

			<!-- Itens que irao ficar escondido no botao da navbar responsiva-->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbar" aria-controls="navbar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end" id="navbar">


				<div class="mx-auto d-none" style="display:${disp} !important">

					<form:form class="input-group" action="${s:mvcUrl('IC#filtrarTitulo').build()}" method="POST" modelAttribute="livro">
						<form:input class="form-control me-2" path="titulo" type="search" placeholder="Pesquisar" aria-label="pesquisar" />
						<button class="bg-success bg-gradiente btn  btn-outline-success text-light" type="submit">Pesquisar</button>	
					</form:form>
					
				</div>


				<div class="dropdown">
				
					<button
						class="btn btn-md btn-outline-success bg-success bg-gradiente rounded rounded-circle text-light p-3"
						type="button" id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">

						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                                <path
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                            </svg>
						<span class="badge badge-secondary">${itens}</span>
					</button>
					<div class="dropdown-menu dropdown-menu-right mt-2"
						aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="/carrinho">Carrinho</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div>
				</div>



			</div>

		</div>

	</nav>
</header>