<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>.error{color:red;}</style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="renderer" content="webkit"/>
    <meta name="author" content="Wang Lei"/>
    <link rel="stylesheet" href="js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
    <link rel="stylesheet" href="css/font-icons/entypo/css/entypo.css">
    <link rel="stylesheet" href="css/font-icons/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icons/font-awesome/css/font-awesome-cloud.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/neon.css">
    <link rel="stylesheet" href="css/neon-core.css">
    <link rel="stylesheet" href="css/neon-theme.css">
    <link rel="stylesheet" href="css/neon-forms.css">

    <link rel="stylesheet" href="css/ppi_curator.css">

    <script src="js/jquery-1.11.0.min.js"></script>
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script>
    <![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="page-body login-page">
    <div class="login-container">
        <div class="login-header login-caret">
            <div class="login-content">
                <a href="javascript:;" class="logo">
                    <img src="frontend/images/logo-login-text.png" width="180" data-has2x="true" alt="" />
                </a>
            </div>
        </div>
    
        <div class="login-progressbar">
            <div></div>
        </div>
    
        <div class="login-form">
            <div class="login-content">
                <div class="form-login-error" style="height: auto;">
                    <p></p>
                </div>
                <!--  ${pageContext.request.contextPath}/login-->
                <form action="" method="post" role="form" id="form_login" autocomplete='off'>
                    <div class="error">${error}</div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-fw fa-envelope"></i>
                            </div>
                            <input type="text" class="form-control" name="username" id="username" placeholder="Username" autocomplete="off" />
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-fw fa-key"></i>
                            </div>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" autocomplete="off" />
                        </div>
                    </div>
    
                    <div class="form-group" style="text-align:left;">
                        <label class="checkbox-inline">
                            <input type='checkbox' name="rememberMe" value="true" id='rememberMe' checked='checked' />
                            Remember&nbsp;me
                        </label>
                    </div>
    
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block btn-login">
                            <i class="fa fa-fw fa-sign-in"></i>
                            Login
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Bottom Scripts -->
    <script src="js/gsap/main-gsap.js"></script>
    <script src="js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/joinable.js"></script>
    <script src="js/resizeable.js"></script>
    <script src="js/neon-api.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/spin.min.js"></script>
    <script src="js/neon-custom.js"></script>

</body>
</html>