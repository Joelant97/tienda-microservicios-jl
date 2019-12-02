%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
    %{--<title>Login</title>--}%
    %{--<asset:stylesheet src="style.css"/>--}%
%{--</head>--}%
%{--<body>--}%
%{--<!-- ============================================================== -->--}%
%{--<!-- login page  -->--}%
%{--<!-- ============================================================== -->--}%
%{--<div class="splash-container">--}%
    %{--<div class="card ">--}%
        %{--<div class="card-header text-center"><a href="/inicio/index"><g:img file="logo.png" dir="images"/></a><span class="splash-description">Please enter your user information.</span></div>--}%
        %{--<div class="card-body">--}%
            %{--<g:if test='${flash.message}'>--}%
                %{--<div class="validation-error">--}%
                    %{--<span class="glyphicon glyphicon-exclamation-sign"></span>--}%
                    %{--${flash.message}--}%
                %{--</div>--}%
                %{--<br>--}%
            %{--</g:if>--}%

            %{--<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">--}%
                %{--<div class="form-group">--}%
                    %{--<input class="form-control form-control-lg" name="${usernameParameter ?: 'username'}" id="username" type="text" placeholder="Username" autocomplete="off" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASCAYAAABSO15qAAAAAXNSR0IArs4c6QAAAPhJREFUOBHlU70KgzAQPlMhEvoQTg6OPoOjT+JWOnRqkUKHgqWP4OQbOPokTk6OTkVULNSLVc62oJmbIdzd95NcuGjX2/3YVI/Ts+t0WLE2ut5xsQ0O+90F6UxFjAI8qNcEGONia08e6MNONYwCS7EQAizLmtGUDEzTBNd1fxsYhjEBnHPQNG3KKTYV34F8ec/zwHEciOMYyrIE3/ehKAqIoggo9inGXKmFXwbyBkmSQJqmUNe15IRhCG3byphitm1/eUzDM4qR0TTNjEixGdAnSi3keS5vSk2UDKqqgizLqB4YzvassiKhGtZ/jDMtLOnHz7TE+yf8BaDZXA509yeBAAAAAElFTkSuQmCC&quot;); background-repeat: no-repeat; background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%; cursor: auto;">--}%
                %{--</div>--}%
                %{--<div class="form-group">--}%
                    %{--<input class="form-control form-control-lg"  name="${passwordParameter ?: 'password'}"  id="password" type="password" placeholder="Password" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASCAYAAABSO15qAAAAAXNSR0IArs4c6QAAAPhJREFUOBHlU70KgzAQPlMhEvoQTg6OPoOjT+JWOnRqkUKHgqWP4OQbOPokTk6OTkVULNSLVc62oJmbIdzd95NcuGjX2/3YVI/Ts+t0WLE2ut5xsQ0O+90F6UxFjAI8qNcEGONia08e6MNONYwCS7EQAizLmtGUDEzTBNd1fxsYhjEBnHPQNG3KKTYV34F8ec/zwHEciOMYyrIE3/ehKAqIoggo9inGXKmFXwbyBkmSQJqmUNe15IRhCG3byphitm1/eUzDM4qR0TTNjEixGdAnSi3keS5vSk2UDKqqgizLqB4YzvassiKhGtZ/jDMtLOnHz7TE+yf8BaDZXA509yeBAAAAAElFTkSuQmCC&quot;); background-repeat: no-repeat; background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%; cursor: auto;" autocomplete="off">--}%
                %{--</div>--}%
                %{--<div class="form-group">--}%
                    %{--<label class="custom-control custom-checkbox">--}%
                        %{--<input class="custom-control-input" type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>>--}%
                        %{--Recordar--}%
                    %{--</label>--}%
                %{--</div>--}%
                %{--<button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>--}%
            %{--</form>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%

%{--<!-- ============================================================== -->--}%
%{--<!-- end login page  -->--}%
%{--<!-- ============================================================== -->--}%
%{--<!-- Optional JavaScript -->--}%
%{--<asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>--}%
%{--<asset:stylesheet src="vendor/fonts/circular-std/style.css"/>--}%
%{--<asset:stylesheet src="vendor/fonts/fontawesome/css/fontawesome-all.css"/>--}%
%{--<asset:stylesheet src="vendor/daterangepicker/daterangepicker.css"/>--}%
%{--<asset:javascript src="vendor/jquery/jquery-3.3.1.min.js"/>--}%


%{--</body>--}%
%{--</html>--}%


<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">Please Login</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                        <i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>
                    </div>

                    <div class="form-group form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/> Remember me
                        </label>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                    <hr class="my-4">
                    <p>Don't have an account? <g:link controller="register">Register</g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['username'].focus();
    });
    function passwordDisplayToggle() {
        var toggleEl = document.getElementById("passwordToggler");
        var eyeIcon = '\u{1F441}';
        var xIcon = '\u{2715}';
        var passEl = document.getElementById("password");
        if (passEl.type === "password") {
            toggleEl.innerHTML = xIcon;
            passEl.type = "text";
        } else {
            toggleEl.innerHTML = eyeIcon;
            passEl.type = "password";
        }
    }
</script>
</body>
</html>
