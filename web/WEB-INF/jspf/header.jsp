<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>WorldSound</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <!-- Main Header -->
        <header class="main-header">
            <!-- Logo -->
            <a href="<c:url value='/'/>" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>W</b>S</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>World</b>Sound</span>
            </a>
            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Control Sidebar Toggle Button -->
                        <li>
                            <a href="#" data-toggle="control-sidebar">
                                <i class="fa fa-shopping-basket"></i>
                                <c:if test="${cart.numberOfItems != null}">
                                    <span class="label label-success">
                                        ${cart.numberOfItems}
                                    </span>
                                </c:if>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="https://www.gravatar.com/avatar/${user.getMD5Email()}?s=160&d=mm" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${pageContext.request.userPrincipal.toString()}</p>
                            <i class="fa fa-circle text-success"></i> Connecté
                        </div>
                    </div>
                </c:if>
                <!-- search form -->
                <form action="#" method="get" class="sidebar-form">
                  <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Rechercher...">
                        <span class="input-group-btn">
                            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                            </button>
                        </span>
                  </div>
                </form>
                <!-- /.search form -->
                <!-- Sidebar Menu -->
                <ul class="sidebar-menu">
                    <li>
                        <a href="<c:url value='/'/>">
                            <i class="fa fa-fw fa-home"></i>
                            <span>Accueil</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-money"></i> <span>Catalogue</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <c:forEach var="category" items="${categories}">
                                <c:choose>
                                    <c:when test="${category.name == selectedCategory.name && requestScope['javax.servlet.forward.request_uri'].contains('category')}">
                                        <li class="active">
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                    </c:otherwise>
                                </c:choose>
                                            <a href="<c:url value='category?${category.id}'/>">
                                                <i class="fa fa-fw ${category.fa}"></i>
                                                <span>${category.name}</span>
                                            </a>
                                        </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <a href="<c:url value='/'/>">
                            <i class="fa fa-fw fa-fire"></i>
                            <span>Nouveautés</span>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value='/'/>">
                            <i class="fa fa-fw fa-handshake-o"></i>
                            <span>Professionnels</span>
                        </a>
                    </li>
                    <c:if test="${empty pageContext.request.userPrincipal}">
                        <li>
                            <a href="<c:url value='/login'/>">
                                <i class="fa fa-fw fa-sign-in"></i>
                                <span>Connexion</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <li>
                            <a href="<c:url value='/logout'/>">
                                <i class="fa fa-fw fa-power-off"></i>
                                <span>Déconnexion</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
                <!-- /.sidebar-menu -->
            </section>
          <!-- /.sidebar -->
        </aside>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">