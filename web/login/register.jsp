            <p class="login-box-msg">Inscription</p>

            <form action="<c:url value='register'/>" method="post">
                <c:if test="${!empty validationErrorFlag}">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h4><i class="icon fa fa-ban"></i> Erreur!</h4>
                        Merci de corriger les erreurs dans le formulaire
                    </div>
                </c:if>
                <div class="form-group has-feedback<c:if test='${!empty usernameError}'> has-error</c:if>">
                    <input type="text" class="form-control" name="username" placeholder="Nom d'utilisateur" value="${param.username}">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback<c:if test='${!empty emailError}'> has-error</c:if>">
                    <input type="text" class="form-control" name="email" placeholder="Email" value="${param.email}">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback<c:if test='${!empty password1Error}'> has-error</c:if>">
                    <input type="password" class="form-control" name="password1" placeholder="Mot de passe">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback<c:if test='${!empty password2Error}'> has-error</c:if>">
                    <input type="password" class="form-control" name="password2" placeholder="Retapez votre mot de passe">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-offset-8 col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Inscription</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>