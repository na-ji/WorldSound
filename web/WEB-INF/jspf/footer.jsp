        </div>
        <!-- /.content-wrapper -->
        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- To the right -->
            <!-- Default to the left -->
            <strong>
                Copyright &copy; <script type="text/javascript">document.write(new Date().getFullYear());</script> 
                <a href="<c:url value='/'/>">WorldSound</a>.
            </strong> 
            Tout droits réservés. <a href="<c:url value='/admin'/>">Admin Console</a>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Create the tabs -->
            <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                <li class="active">
                    <a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-shopping-basket"></i></a>
                </li>
                <c:if test="${!empty cart && cart.numberOfItems != 0 
                              && !fn:contains(pageContext.request.servletPath,'/checkout')
                              && requestScope['javax.servlet.forward.servlet_path'] ne '/checkout'
                              && validationErrorFlag ne true 
                              && orderFailureFlag ne true}">
                    <li>
                        <a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-credit-card-alt"></i></a>
                    </li>
                </c:if>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Home tab content -->
                <div class="tab-pane active" id="control-sidebar-home-tab">
                    <c:if test="${empty cart}">
                        <h3 class="control-sidebar-heading">Panier vide</h3>
                    </c:if>
                    <c:if test="${!empty cart && cart.numberOfItems != 0}">
                        <h4 id="subtotal">Total:
                            <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${cart.subtotal}" /> &euro;
                        </h4>
                        <ul class="control-sidebar-menu">
                            <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">
                                <c:set var="product" value="${cartItem.product}"/>
                                <li>
                                    <a href="<c:url value='viewCart'/>">
                                        <i class="menu-icon fa ${product.category.fa} bg-yellow"></i>

                                        <div class="menu-info">
                                            <h4 class="control-sidebar-subheading">${product.name} x${cartItem.quantity}</h4>
                                            <p>${cartItem.total} &euro;</p>
                                            <p><small>(${product.price}&euro;/unité)</small></p>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${!empty cart && cart.numberOfItems != 0 
                                  && !fn:contains(pageContext.request.servletPath,'/cart')
                                  && requestScope['javax.servlet.forward.servlet_path'] ne '/cart'}">
                        <a href="<c:url value='viewCart'/>" class="bubble">
                            Visualiser la commande
                        </a>
                    </c:if>
                    <!-- /.control-sidebar-menu -->
                </div>
                <!-- /.tab-pane -->
                <c:if test="${!empty cart && cart.numberOfItems != 0 
                              && !fn:contains(pageContext.request.servletPath,'/checkout') 
                              && requestScope['javax.servlet.forward.servlet_path'] ne '/checkout' 
                              && validationErrorFlag ne true 
                              && orderFailureFlag ne true}">
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">Paiement</h3>
                            
                            <a href="<c:url value='checkout'/>">
                              Finaliser la commande
                            </a>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </c:if>
            </div>
        </aside>
        <!-- /.control-sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
</body>
</html>