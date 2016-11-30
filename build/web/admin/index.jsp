            <section class="content-header">
                <h1>
                    <c:choose>
                        <c:when test="${!empty customerList}">
                            Clients
                        </c:when>
                        <c:when test="${!empty orderList}">
                            Commandes
                        </c:when>
                        <c:when test="${!empty customerRecord}">
                            Informations du client
                        </c:when>
                        <c:when test="${!empty orderRecord}">
                            Détails de la commande
                        </c:when>
                    </c:choose>
                </h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="box box-warning box-">
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <c:if test="${!empty customerList}">
                            <table class="table table-bordered table-striped table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <td>ID Client</td>
                                        <td>Nom</td>
                                        <td>Email</td>
                                        <td>Tel</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="customer" items="${customerList}" varStatus="iter">
                                        <tr onclick="document.location.href='customerRecord?${customer.id}'">
                                            <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.id}</a></td>
                                            <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.name}</a></td>
                                            <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.email}</a></td>
                                            <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.phone}</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                        <%-- orderList is requested --%>
                        <c:if test="${!empty orderList}">
                            <table class="table table-bordered table-striped table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <td>ID Commande</td>
                                        <td>Numero de commande</td>
                                        <td>Montant</td>
                                        <td>Date de traitement</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orderList}" varStatus="iter">
                                        <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                                            onclick="document.location.href='orderRecord?${order.id}'">
                                          <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                                            <td><a href="orderRecord?${order.id}" class="noDecoration">${order.id}</a></td>
                                            <td><a href="orderRecord?${order.id}" class="noDecoration">${order.confirmationNumber}</a></td>
                                            <td><a href="orderRecord?${order.id}" class="noDecoration">
                                                    ${order.amount} &euro;
                                                </a>
                                            </td>
                                            <td>
                                                <a href="orderRecord?${order.id}" class="noDecoration">
                                                    <fmt:formatDate value="${order.dateCreated}" pattern="dd/MM/yyyy HH:mm" />
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                        <%-- customerRecord is requested --%>
                        <c:if test="${!empty customerRecord}">
                            <table class="table table-bordered table-striped table-responsive table-hover">
                                <tr>
                                    <td style="width: 290px"><strong>ID Client:</strong></td>
                                    <td>${customerRecord.id}</td>
                                </tr>
                                <tr>
                                    <td><strong>Nom:</strong></td>
                                    <td>${customerRecord.name}</td>
                                </tr>
                                <tr>
                                    <td><strong>E-mail:</strong></td>
                                    <td>${customerRecord.email}</td>
                                </tr>
                                <tr>
                                    <td><strong>Tel:</strong></td>
                                    <td>${customerRecord.phone}</td>
                                </tr>
                                <tr>
                                    <td><strong>Adresse:</strong></td>
                                    <td>${customerRecord.address}</td>
                                </tr>
                                <tr>
                                    <td><strong>Ville:</strong></td>
                                    <td>${customerRecord.cityRegion}</td>
                                </tr>
                                <tr>
                                    <td><strong>Numero carte de crédit:</strong></td>
                                    <td>${customerRecord.ccNumber}</td>
                                </tr>
                                <tr><td colspan="2" style="padding: 0 0"><hr></td></tr>
                                <tr class="tableRow" onclick="document.location.href='orderRecord?${order.id}'">
                                    <td colspan="2">
                                        <a href="orderRecord?${order.id}" class="noDecoration">
                                        <strong>Détails de la commande &#x279f;</strong></a>
                                    </td>
                                </tr>
                            </table>
                        </c:if>

                        <c:if test="${!empty orderRecord}">
                            <table class="table table-bordered table-striped table-responsive table-hover">
                                <tr>
                                    <td><strong>ID Commande</strong></td>
                                    <td>${orderRecord.id}</td>
                                </tr>
                                <tr>
                                    <td><strong>N° Commande</strong></td>
                                    <td>${orderRecord.confirmationNumber}</td>
                                </tr>
                                <tr>
                                    <td><strong>Date</strong></td>
                                    <td>
                                        <fmt:formatDate value="${orderRecord.dateCreated}" pattern="dd/MM/yyyy HH:mm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <td>Produit</td>
                                                    <td>Quantité</td>
                                                    <td>Prix</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">
                                                    <tr>
                                                        <td>
                                                            ${products[iter.index].name}
                                                        </td>
                                                        <td>
                                                            ${orderedProduct.quantity}
                                                        </td>
                                                        <td class="confirmationPriceColumn">
                                                            ${products[iter.index].price * orderedProduct.quantity} &euro;
                                                        </td>
                                                    </tr>
                                                </c:forEach>    
                                                <tr>
                                                    <td colspan="2" id="totalCellLeft">
                                                        <strong>Montant total</strong>
                                                    </td>
                                                    <td id="totalCellRight">
                                                        ${orderRecord.amount} &euro;
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>
                                <tr class="tableRow" onclick="document.location.href='customerRecord?${customer.id}'">
                                    <td colspan="2">
                                        <%-- Anchor tag is provided in case JavaScript is disabled --%>
                                        <a href="customerRecord?${customer.id}" class="noDecoration">
                                            <strong>Informations du client &#x279f;</strong>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </c:if>
                    </div>
                </div>
            </section>