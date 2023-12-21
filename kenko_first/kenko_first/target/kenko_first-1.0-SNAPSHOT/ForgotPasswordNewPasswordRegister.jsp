<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>
<body style="background-color: #e3ece1;">

<%
    String VerifiedNumber = "";
    if (request.getParameter("VerifiedNumber") != null &&
            !request.getParameter("VerifiedNumber").equals("")) {
        VerifiedNumber = request.getParameter("VerifiedNumber");
    }
%>

<div class="auth-layout-wrap">
    <div class="auth-content">
        <div class="row">
            <div class="col-lg-3">
            </div>
            <div class="col-lg-6">
                <div class="card o-hidden" style="height: 560px;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="p-4">
                                <div class="auth-logo text-center mb-4">
                                    <a href="index.jsp">
                                        <img class="logo" src="dist-assets/images/logo.png" alt="#">
                                    </a>
                                </div>
                                <h1 id="lblForgotPasswordNewPasswordForgotPassword"
                                    class="mb-3 text-18">Forgot Password</h1>

                                <form action="ForgotPasswordNewPasswordRegisterServlet" method="post">

                                    <!--verified-contact-number-->
                                    <input type="hidden" value="<%=VerifiedNumber%>"
                                           name="farmer_contact_number">
                                    <!--/verified-contact-number-->

                                    <div class="form-group">
                                        <div class="form-group">
                                            <label id="lblForgotPasswordNewPassword">New Password</label>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="password" placeholder="New Password"
                                                   id="txtForgotPasswordNewPassword" value="" name="farmer_password"
                                                   aria-label="NewPassword"
                                                   aria-describedby="txtForgotPasswordNewPassword"
                                                   minlength="6" maxlength="16" required autofocus/>
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="i-Eye-Visible"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label id="lblForgotPasswordNewPasswordConfirm">New Password Confirm</label>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="password"
                                                   placeholder="New Password Confirm"
                                                   id="txtForgotPasswordNewPasswordConfirm" value=""
                                                   name="farmer_password_confirm"
                                                   aria-label="NewPasswordConfirm"
                                                   aria-describedby="txtForgotPasswordNewPasswordConfirm"
                                                   minlength="6" maxlength="16" required/>
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="i-Eye-Visible"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" style="margin-bottom: 0.5rem;"
                                            id="btnForgotPasswordNewPasswordUpdate"
                                            class="btn btn-primary btn-block mt-2">Update New Password
                                    </button>

                                    <a href="index.jsp" style="margin-top: 0 !important;"
                                       id="btnForgotPasswordNewPasswordSignIn"
                                       class="btn btn-outline-success btn-block mt-2">Sign In</a>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-3">
            </div>
        </div>
    </div>
</div>

<%@include file="FooterMobios.jsp" %>

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>

<script>
    const lan = getLanguage();
    console.log(lan);
    if (lan == "Sinhala") {
        ToggleLanguageSinhala();
    }
    if (lan == "Tamil") {
        ToggleLanguageTamil();
    }
</script>

<%@include file="FooterMobios.jsp" %>

</body>
</html>