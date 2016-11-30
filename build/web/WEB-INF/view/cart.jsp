            <section class="content-header">
                <h1>Panier</h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="box box-warning">
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p>Votre commande 
                        <c:choose>
                            <c:when test="${cart.numberOfItems > 1}">
                                contient ${cart.numberOfItems} acticles.</p>
                            </c:when>
                            <c:when test="${cart.numberOfItems == 1}">
                                contient ${cart.numberOfItems} article.</p>
                            </c:when>
                            <c:otherwise>
                                est vide.</p>
                            </c:otherwise>
                        </c:choose>
                        <div class="btn-group">
                            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                                <c:url var="url" value="viewCart">
                                    <c:param name="clear" value="true"/>
                                </c:url>
                                <a href="${url}" class="btn btn-danger">Annuler la commande</a>
                            </c:if>
                            <c:set var="value">
                                <c:choose>
                                    <c:when test="${!empty selectedCategory}">
                                        category
                                    </c:when>
                                    <c:otherwise>
                                        index.jsp
                                    </c:otherwise>
                                </c:choose>
                            </c:set>
                            <c:url var="url" value="${value}"/>
                            <a href="${url}" class="btn btn-default">Continuer la commande</a>
                            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                                <a href="<c:url value='checkout'/>" class="btn btn-success">Finaliser la commande</a>
                            </c:if>
                        </div>

                        <c:if test="${!empty cart && cart.numberOfItems != 0}">
                            <h4 id="subtotal">Total:
                                <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${cart.subtotal}" /> &euro;
                            </h4>
                            <table class="table table-bordered table-responsive table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>Nom</th>
                                        <th>Prix</th>
                                        <th>Quantité</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">
                                        <c:set var="product" value="${cartItem.product}"/>
                                        <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                                            <td>
                                              <i class="menu-icon fa fa-fw fa-2x ${product.category.fa}"></i>
                                            </td>
                                            <td>${product.name}</td>
                                            <td>
                                                ${cartItem.total} &euro;
                                                <br>
                                                <span class="smallText">(${product.price} &euro;/ unité)</span>
                                            </td>
                                            <td>
                                                <form action="<c:url value='updateCart'/>" method="post" class="form-inline">
                                                    <input type="hidden" name="productId" value="${product.id}">
                                                    <input type="number" class="form-control" maxlength="2" size="2" value="${cartItem.quantity}" name="quantity" style="width:50px;margin:5px">
                                                    <input type="submit" name="submit" class="btn btn-default" value="mettre à jour">
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                          </table>
                        </c:if>
                    </div>
                </div>
            </section>