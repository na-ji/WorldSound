            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1>
                Coordonnées et paiement
              </h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="box box-warning">
                            <!-- /.box-header -->
                            <form id="checkoutForm" class="form-horizontal" action="<c:url value='purchase'/>" method="post">
                            <div class="box-body">
                                <p>Vos coordonnées sont nécessaires pour valider le paiement :</p>
                                <c:if test="${!empty orderFailureFlag}">
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h4><i class="icon fa fa-ban"></i> Erreur!</h4>
                                        Une erreur est survenue, merci de ressayer !
                                    </div>
                                </c:if>
                                <c:if test="${!empty validationErrorFlag}">
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h4><i class="icon fa fa-ban"></i> Erreur!</h4>
                                        Merci de corriger les erreurs dans le formulaire
                                    </div>
                                </c:if>
                                <div class="form-group<c:if test='${!empty nameError}'> has-error</c:if>">
                                    <label for="name" class="col-sm-2 control-label">Nom</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" required="required"id="name" name="name" placeholder="Nom" type="text" value="<c:if test="${empty param.name}">${name}</c:if>${param.name}">
                                    </div>
                                </div>
                                <div class="form-group <c:if test='${!empty emailError}'> has-error</c:if>">
                                    <label for="email" class="col-sm-2 control-label">E-mail</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" required="required"id="email" name="email" placeholder="E-mail" type="email" value="<c:if test="${empty param.email}">${email}</c:if>${param.email}">
                                    </div>
                                </div>
                                <div class="form-group <c:if test='${!empty phoneError}'> has-error</c:if>">
                                    <label for="phone" class="col-sm-2 control-label">Tel</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" required="required"id="phone" name="phone" placeholder="Tel" type="tel" value="<c:if test="${empty param.phone}">${phone}</c:if>${param.phone}">
                                    </div>
                                </div>
                                <div class="form-group <c:if test='${!empty addressError}'> has-error</c:if>">
                                    <label for="address" class="col-sm-2 control-label">Adresse</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" required="required"id="address" name="address" placeholder="Adresse" type="text" value="<c:if test="${empty param.address}">${address}</c:if>${param.address}">
                                    </div>
                                </div>
                                <div class="form-group <c:if test='${!empty cityRegionError}'> has-error</c:if>">
                                    <label for="cityRegion" class="col-sm-2 control-label">Ville</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" required="required" id="cityRegion" name="cityRegion" placeholder="Ville" type="text" value="<c:if test="${empty param.cityRegion}">${cityRegion}</c:if>${param.cityRegion}">
                                    </div>
                                </div>
                                <div class="form-group <c:if test='${!empty ccNumberError}'> has-error</c:if>">
                                    <label for="creditcard" class="col-sm-2 control-label">N° Carte Crédit</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" required="required"id="creditcard" name="creditcard" placeholder="N° Carte Crédit" type="text" value="<c:if test="${empty param.creditcard}">${creditcard}</c:if>${param.creditcard}">
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-default pull-right">Envoyer</button>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="box box-warning">
                            <!-- /.box-header -->
                            <div class="box-body">
                                <p>
                                    Des frais de transports à hauteur de ${initParam.deliverySurcharge} &euro; s'ajoutent à votre facture</li>
                                </p>

                                <table class="table table-condensed table-responsive">
                                    <tr>
                                        <td>Total hors frais de transport</td>
                                        <td class="pull-right"><fmt:formatNumber type="number" minFractionDigits="2" value="${cart.subtotal}" /> &euro;</td>
                                    </tr>
                                    <tr>
                                        <td>Frais de transport</td>
                                        <td class="pull-right">${initParam.deliverySurcharge} &euro;</td>
                                    </tr>
                                    <tr>
                                        <td>Total TTC</td>
                                        <td class="pull-right"><fmt:formatNumber type="number" minFractionDigits="2" value="${cart.total}" /> &euro;</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /.content -->