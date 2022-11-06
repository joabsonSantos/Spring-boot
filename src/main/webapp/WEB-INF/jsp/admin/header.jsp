    <!-- Inicio Navbar -->
    <header class="p-3 bg-dark shadow">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark shadow-md">



            <div class="container">
                <!-- Logo-->
                <a class="navbar-brand" href="/">LOGO</a>

                <!-- Itens que irao ficar escondido no botao da navbar responsiva-->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
                    aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                                Cadastro
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="/admin/livros">Cadastro de Livros</a>
                                <a class="dropdown-item" href="/admin/categorias">Cadastro de Categorias</a>
                                <a class="dropdown-item" href="/admin/autores">Cadastro de Autores</a>
                                <a class="dropdown-item" href="/admin/editoras">Cadastro de Editoras</a>
                            </div>
                        </li>
                    </ul>

                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                                Edição
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                            	<a class="dropdown-item" href="/admin/livros">Editar Livros</a>
                                <a class="dropdown-item" href="/admin/EditarCategoria">Editar Categorias</a>
                                <a class="dropdown-item" href="/admin/autor">Editar Autores</a>
                                <a class="dropdown-item" href="/admin/editora">Editar Editoras</a>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>

        </nav>
    </header>