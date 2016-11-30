            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Confirmation de paiement
                    <small>#${orderRecord.confirmationNumber}</small>
                </h1>
            </section>
            <!-- Main content -->
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i> TrivaMarket, Inc.
                            <small class="pull-right">Date : <fmt:formatDate value="${orderRecord.dateCreated}" pattern="dd/MM/yyyy" /></small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        De
                        <address>
                            <strong>TrivaMarket, Inc.</strong><br>
                            795 Folsom Ave, Suite 600<br>
                            San Francisco, CA 94107<br>
                            Phone: (804) 123-5432<br>
                            Email: info@trivamarket.com
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        A
                        <address>
                            <strong>${customer.name}</strong><br>
                            ${customer.address}<br>
                            ${customer.cityRegion}<br>
                            Phone: ${customer.phone}<br>
                            Email: ${customer.email}
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <b>Commande #${orderRecord.confirmationNumber}</b><br>
                        <br>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Plat</th>
                                    <th>Quantité</th>
                                    <th>Prix</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">
                                    <tr>
                                        <td>${products[iter.index].name}</td>
                                        <td>${orderedProduct.quantity}</td>
                                        <td>${products[iter.index].price * orderedProduct.quantity} &euro;</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-xs-6">
                        <p class="lead">Méthodes de paiement</p>
                        <img src="/dist/img/credit/visa.png" alt="Visa">
                        <img src="/dist/img/credit/mastercard.png" alt="Mastercard">
                        <img src="/dist/img/credit/american-express.png" alt="American Express">

                        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                        </p>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-6">
                        <p class="lead">Montant payé le <fmt:formatDate value="${orderRecord.dateCreated}" pattern="dd/MM/yyyy" /></p>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th style="width:50%">Sous-total</th>
                                        <td class="pull-right"><fmt:formatNumber type="number" minFractionDigits="2" value="${orderRecord.amount - initParam.deliverySurcharge}" /> &euro;</td>
                                    </tr>
                                    <tr>
                                        <th>Livraison</th>
                                        <td class="pull-right">${initParam.deliverySurcharge} &euro;</td>
                                    </tr>
                                    <tr>
                                        <th>Total</th>
                                        <td class="pull-right"><fmt:formatNumber type="number" minFractionDigits="2" value="${orderRecord.amount}" /> &euro;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <div class="clearfix"></div>
            <!-- /.content -->