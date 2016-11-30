            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    ${selectedCategory.name}
                </h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="box box-warning">
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-bordered table-striped table-hover table-responsive">
                            <c:forEach var="product" items="${categoryProducts}" varStatus="iter">
                                <tr>
                                    <td>
                                        <img src="${initParam.productImagePath}${product.id}.jpeg" alt="${product.name}" class="img-responsive" style="width:100%;">
                                    </td>
                                    <td>
                                        ${product.name}
                                        <br>
                                        <span class="smallText">${product.description}</span>
                                    </td>
                                    <td>${product.price} &euro;</td>
                                    <td>
                                        <form action="<c:url value='addToCart'/>" method="post">
                                            <input type="hidden" name="productId" value="${product.id}" />
                                            <input type="submit" class="btn btn-default" name="submit" value="Ajouter" />
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </section>
            <!-- /.content -->