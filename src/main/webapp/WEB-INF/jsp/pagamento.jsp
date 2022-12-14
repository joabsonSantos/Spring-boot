<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/index.css">
	<title>Checkout</title>
</head>

<body class="">

	<%@ include file="header.jsp" %>


<section class="mb-5">
    <div class="container wow fadeIn">

      <!-- Heading -->
      <h2 class="my-5 h2 text-center">Seus Dados</h2>

      <!--Grid row-->
      <div class="row">

        <!--Grid column-->
        <div class="col-md-8 mb-4">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <form class="card-body">

              <!--Grid row-->
              <div class="row">

                <!--Grid column-->
                <div class="col-md-6 mb-2">

                  <!--firstName-->
                  <div class="md-form ">
                    <input type="text" id="firstName" class="form-control">
                    <label for="firstName" class="">Primeiro Nome:</label>
                  </div>

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 mb-2">

                  <!--lastName-->
                  <div class="md-form">
                    <input type="text" id="lastName" class="form-control">
                    <label for="lastName" class="">Ultimo nome:</label>
                  </div>

                </div>
                <!--Grid column-->

              </div>
              <!--Grid row-->

      

              <!--email-->
              <div class="md-form mb-3">
                <input type="text" id="email" class="form-control" placeholder="youremail@example.com">
                <label for="email" class="">Email (opcional)</label>
              </div>

              <!--address-->
              <div class="md-form mb-3">
                <input type="text" id="address" class="form-control" placeholder="1234 Main St">
                <label for="address" class="">Endereço:</label>
              </div>

            
              <!--Grid row-->
              <div class="row">

                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-4">

                  <label for="country">Cidade</label>
                  <select class="custom-select d-block w-100" id="country" required>
                    <option value="">Selecione...</option>
                    <option>United States</option>
                  </select>
                  <div class="invalid-feedback">
                    Please select a valid country.
                  </div>

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4">

                  <label for="state">Estado</label>
                  <select class="custom-select d-block w-100" id="state" required>
                    <option value="">Selecione...</option>
                    <option>California</option>
                  </select>
                  <div class="invalid-feedback">
                    Please provide a valid state.
                  </div>

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4">

                  <label for="zip">CEP:</label>
                  <input type="text" class="form-control" id="zip" placeholder="" required>
                  <div class="invalid-feedback">
                    Zip code required.
                  </div>

                </div>
                <!--Grid column-->

              </div>
              <!--Grid row-->

<!--               <hr> -->

<!--               <div class="custom-control custom-checkbox"> -->
<!--                 <input type="checkbox" class="custom-control-input" id="same-address"> -->
<!--                 <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label> -->
<!--               </div> -->
<!--               <div class="custom-control custom-checkbox"> -->
<!--                 <input type="checkbox" class="custom-control-input" id="save-info"> -->
<!--                 <label class="custom-control-label" for="save-info">Save this information for next time</label> -->
<!--               </div> -->

              <hr>

              <div class="d-block my-3">
                <div class="custom-control custom-radio">
                  <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                  <label class="custom-control-label" for="credit">Cartão Credito</label>
                </div>
                <div class="custom-control custom-radio">
                  <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="debit">Cartão Debito</label>
                </div>
                <div class="custom-control custom-radio">
                  <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="paypal">Paypal</label>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="cc-name">Nome No cartão</label>
                  <input type="text" class="form-control" id="cc-name" placeholder="" required>
                  <small class="text-muted">Full name as displayed on card</small>
                  <div class="invalid-feedback">
                    Name on card is required
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="cc-number">Número do Cartão</label>
                  <input type="text" class="form-control" id="cc-number" placeholder="" required>
                  <div class="invalid-feedback">
                    Credit card number is required
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-3 mb-3">
                  <label for="cc-expiration">Data Expiração</label>
                  <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                  <div class="invalid-feedback">
                    Expiration date required
                  </div>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="cc-expiration">CVV</label>
                  <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                  <div class="invalid-feedback">
                    Security code required
                  </div>
                </div>
              </div>
              <hr class="mb-4">
              <button class="btn btn-primary btn-lg btn-block" type="submit" onclick="window.location.href='/carrinho/finish'" >Finalizar</button>

            </form>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-4 mb-4">

          <!-- Heading -->
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Seu carrinho</span>
            <span class="badge badge-secondary badge-pill">${itens}</span>
          </h4>
			
		<c:forEach items="${livros}" var="livro">	
          <!-- Cart -->
          <ul class="list-group mb-3 z-depth-1">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0 text-truncate" style="max-width: 200px;">${livro.titulo}</h6>
                <small class="text-muted">Quantidade ${carrinho.getQtdLivroTela(livro)}</small>
              </div>
              <span class="text-muted">R$ ${livro.preco*carrinho.getQtdLivroTela(livro)}</span>
            </li>
<!--             <li class="list-group-item d-flex justify-content-between bg-light"> -->
<!--               <div class="text-success"> -->
<!--                 <h6 class="my-0">Promo code</h6> -->
<%--                 <small>EXAMPLECODE</small> --%>
<!--               </div> -->
<%--               <span class="text-success">-$5</span> --%>
<!--             </li> -->
           
           </c:forEach>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total</span>
              <strong>R$ ${total}</strong>
            </li>
          </ul>
          <!-- Cart -->
		
          <!-- Promo code -->
          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code" aria-label="Recipient's username" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-secondary btn-md waves-effect m-0" type="button">Aplicar</button>
              </div>
            </div>
          </form>
          <!-- Promo code -->
		
        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->

    </div>
  </section>
  <!--Main layout-->
  
  
  <%@ include file="admin/footer.jsp" %>
</body>
</html>
  