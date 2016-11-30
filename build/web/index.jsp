<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Bienvenue sur TrivaMarket !
                </h1>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-sm-12">
                        <p>TrivaMarket est un service de vente en ligne de fournitures scolaires.</p>
                        <p>Contenant plus de 16 références, TrivaMarket vous aide à vous équiper toute l'année !</p>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="category" items="${categories}">
                        <div class="col-sm-3" style="text-align: center;">
                            <a href="category?${category.id}">
                                <i class="fa ${category.fa} fa-5x"></i><br />
                                <h4>${category.name}</h4>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </section>
            <!-- /.content -->