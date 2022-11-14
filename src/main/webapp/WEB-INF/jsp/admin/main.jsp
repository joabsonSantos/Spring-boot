
<!-- main -->
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
					class="d-flex justify-content-around align-items-center m-2 p-2">
					<h1 class="title text-center w-100">PEDIDOS</h1>

					<button type="button"
						class="btn btn-md btn-outline-success rounded rounded-circle">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                                <path
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                            </svg>
					</button>

				</div>
				<!-- tabela principal-->
				<div class="container-fluid  table-responsive-md">
					<table
						class="table table-sm table-hover table-bordered text-center">
						<thead class="thead-dark">
							<th>CLIENTE:</th>
							<th>DATA:</th>
							<th>OBSERVAÇÕES:</th>
							<th>EDITAR</th>
							<th>EXCLUIR</th>
						</thead>

						<tbody>
							<tr>
								<td>teste</td>
								<td>teste</td>
								<td>Lorem ipsum, dolor sluptatem orem ipsum, dolor
									sluptatem orem ipsum, dolor sluptatem.</td>
								<td><button class="btn-edite" data-toggle="modal"
										data-target="#editePedido"></button></td>
								<td><button class="btn-delete" data-toggle="modal"
										data-target="#modalDelete"></button></td>
							</tr>
							<tr>
								<td>teste</td>
								<td>teste</td>
								<td>Lorem ipsum, dolor sluptatem orem ipsum, dolor
									sluptatem orem ipsum, dolor sluptatem.</td>
								<td><button class="btn-edite" data-toggle="modal"
										data-target="#modalEdite"></button></td>
								<td><button class="btn-delete" data-toggle="modal"
										data-target="#modalDelete"></button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Alerta Exclusaõ de Pedido -->
	<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="">CONFIRME PARA CONTINUAR</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Deseja realmente Excluir este Pedido?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Confirmar</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>

	<!--Modal Editar pedidos de Clientes-->
	<div class="modal" id="editePedido" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Edição de Pedido</h5>
					<button type="button" class="close" data-dismiss="editePedido">
						<span>&times;<span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<details class="form-control">
							<summary>Dados Da Nota</summary>

							<div class="row mb-4">
								<div class="col-sm-12 col-md-5">
									<label for="inputCpf">CPF/CNPJ:</label> <input type="text"
										class="form-control" id="inputCpf" disabled>
								</div>
								<div class="colcol-sm-12 col-md-7">
									<label for="inputNome">Nome:</label> <input type="text"
										class="form-control" id="inputNome" disabled>
								</div>
							</div>
							<div class="row mb-4">
								<div class="col-sm-12 col-md-6">
									<label for="inputNumnota">Nº Nota:</label> <input type="text"
										class="form-control" id="inputNumnota" disabled>
								</div>
								<div class="col-sm-12 col-md-6">
									<label for="inputNumpedi">Nº Pedido:</label> <input type="text"
										class="form-control" id="inputNumpedi" disabled>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<label for="inputData">Data:</label> <input type="date"
										class="form-control" id="inputData" disabled>
								</div>
								<div class="col-sm-12 col-md-6">
									<label for="inputValor">Valor:</label> <input type="text"
										class="form-control" id="inputValor" disabled>
								</div>
							</div>
						</details>
						<hr>
						<div class="container">
							<form>
								<div class="row mb-4">
									<div class="col-sm-12 col-md-5">
										<label for="inputCpf">CPF/CNPJ:</label> <input type="text"
											class="form-control" id="inputCpf" disabled>
									</div>
									<div class="colcol-sm-12 col-md-7">
										<label for="inputNome">Nome:</label> <input type="text"
											class="form-control" id="inputNome" disabled>
									</div>
								</div>
							</form>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger px-5" type="button"
						data-dismiss="modal">Cancelar</button>
					<button class="btn btn-success px-5" type="button">Salvar</button>
				</div>
			</div>
		</div>
	</div>


</main>