<%@ page import="services.HttpSession" %>
<%@ page import="services.Cookies" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>

    <script type="text/javascript">
        function initRefineUrl() {
            window.location.href = refineUrl(window.location.href);
        }
    </script>

</head>
<body style="background-color: #e3ece1;">

<!--content-->

<%
    String RememberedMobileNumber = "", RememberedPassWord = "";
    if (request.getCookies() != null) {
        for (Cookie Cookie : request.getCookies()
                ) {
            if (Cookie.getName().equals(Cookies.COOKIE_REMEMBERED_PROFILE)) {
                RememberedMobileNumber = Cookie.getValue().split("_")[0];
                RememberedPassWord = Cookie.getValue().split("_")[1];
//                break;
            }
        }
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
                                    <img src="dist-assets/images/logo.png" alt="">
                                </div>
                                <h1 class="mb-3 text-18" id="lblSputum">Sign In</h1>

                                <form action="SignInServlet" method="post">
                                    <div class="form-group">

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Telephone"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="text" placeholder="Mobile Number"
                                                   Id="lblSignInMobileNumber" value="<%=RememberedMobileNumber%>"
                                                   name="farmer_contact_number"
                                                   aria-label="MobileNumber" aria-describedby="lblSignInMobileNumber"
                                                   minlength="10" maxlength="10" required autofocus/>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="password" placeholder="Password"
                                                   Id="lblSignInPassword" value="<%=RememberedPassWord%>"
                                                   name="farmer_password"
                                                   aria-label="Password" aria-describedby="lblSignInPassword"
                                                   minlength="6" maxlength="16" required/>
                                            <%--<div class="input-group-append">--%>
                                            <%--<span class="input-group-text">@</span>--%>
                                            <%--</div>--%>
                                            <div class="input-group-append">
                                                <span class="input-group-text"
                                                      onclick="ShowPassword_Click()">
                                                    <i class="i-Eye-Visible" id="showEye" style="display: none"></i>
                                                    <i class="i-Eye-Visible" id="hiddenEye"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <label class="checkbox checkbox-primary">
                                            <input Id="cheSignInRememberMe" type="checkbox"
                                                    <%
                                                        if (!RememberedMobileNumber.isEmpty()) {
                                                    %>
                                                   checked="checked"
                                                    <%
                                                        }
                                                    %>
                                                   name="remember_me" value="true"/>
                                            <span id="checkSignInRememberMe">Remember Me</span>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-block mt-2"
                                            id="btnSignInSignIn">
                                        Sign In
                                    </button>

                                    <a href="SignUpMobileNumberRegister.jsp"
                                       class="btn btn-outline-success btn-block mt-2"
                                       id="btnSignIpSignUp">Sign Up</a>
                                </form>

                                <div class="mt-3 text-center">
                                    <a class="btn btn-outline-info" style="width: 80px; float: left;"
                                       onclick="ToggleLanguageEnglish()"
                                       href="#"
                                    <%--href="LanguageChangeServlet?Language=<%=HttpSession.LANGUAGE_ENGLISH%>"--%>
                                    >
                                        English</a>
                                    <a class="btn btn-outline-warning" style="width: 80px;" id="id"
                                       onclick="ToggleLanguageSinhala()"
                                       href="#"
                                    <%--href="LanguageChangeServlet?Language=<%=HttpSession.LANGUAGE_SINHALESE%>"--%>
                                    >
                                        සිංහල</a>
                                    <a class="btn btn-outline-dark" style="width: 80px; float: right;"
                                       onclick="ToggleLanguageTamil()"
                                       href="#"
                                    <%--href="LanguageChangeServlet?Language=<%=HttpSession.LANGUAGE_TAMIL%>"--%>
                                    >
                                        தமிழ்</a>
                                </div>
                                <div class="mt-4 text-14 text-center">
                                    <a class="btn btn-raised-secondary" id="lblSignInForgotPassword"
                                       href="ForgotPasswordMobileNumberRegister.jsp">
                                        Forgot Password?</a>
                                </div>
                                <div class="mt-2 text-14 text-center">
                                    <a class="btn btn-raised-secondary" id="lblSputumAddress"
                                       href="#">View As A Guest</a>
                                </div>
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

<!--modal-display-->

<%
    String Response = "None";
    if (request.getParameter("IsUserSignedIn") != null &&
            request.getParameter("IsUserSignedIn").equals("disabled")) {
        //show alert
        Response = "IsUserSignedInDisabled";
    } else if (request.getParameter("IsUserSignedIn") != null &&
            request.getParameter("IsUserSignedIn").equals("false")) {
        //show alert
        Response = "IsUserSignedInFalse";
    } else if (request.getParameter("IsUserSignedUp") != null &&
            request.getParameter("IsUserSignedUp").equals("true")) {
        //show alert
        Response = "IsUserSignedUpTrue";
    } else if (request.getParameter("IsPasswordUpdated") != null &&
            request.getParameter("IsPasswordUpdated").equals("true")) {
        //show alert
        Response = "IsPasswordUpdatedTrue";
    }
%>

<!--row-->
<div class="row">

    <div class="col-md-12 mb-2">

        <!--modal-error-->
        <div class="modal fade" id="ModalError01UserDisabled">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                            <p id="ModalError01Body" class="mt-4 mb-4">User disabled.</p>
                            <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                <span id="ModalError01Footer">Okay</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/modal-error-->

        <!--modal-error-->
        <div class="modal fade" id="ModalError02UserInvalid">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                            <p id="ModalError02Body" class="mt-4 mb-4">Invalid username or password.</p>
                            <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                <span id="ModalError02Footer">Okay</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/modal-error-->

        <!--modal-success-->
        <div class="modal fade" id="ModalSuccess01SignedUp">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalSuccess01Title">Success!</h2>
                            <p id="ModalSuccess01Body" class="mt-4 mb-4">User added, sign in here.</p>
                            <button class="btn btn-lg btn-success" type="button" data-dismiss="modal">
                                <span id="ModalSuccess01Footer">Okay</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/modal-success-->

        <!--modal-success-->
        <div class="modal fade" id="ModalSuccess02IsPasswordUpdatedTrue">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalSuccess02Title">Success!</h2>
                            <p id="ModalSuccess02Body" class="mt-4 mb-4">Password updated, sign in here.</p>
                            <button class="btn btn-lg btn-success" type="button" data-dismiss="modal">
                                <span id="ModalSuccess02Footer">Okay</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/modal-success-->

    </div>

</div>
<!--/row-->

<!--/modal-display-->

<%@include file="FooterMobios.jsp"%>

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
<script src="dist-assets/js/custom/passwordShowHide.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsUserSignedInDisabled':
                // alert("Success!");
                $('#ModalError01UserDisabled').modal('show');
                break;
            case 'IsUserSignedInFalse':
                // alert("Info!");
                $('#ModalError02UserInvalid').modal('show');
                break;
            case 'IsUserSignedUpTrue':
                // alert("Warning!");
                $('#ModalSuccess01SignedUp').modal('show');
                break;
            case 'IsPasswordUpdatedTrue':
                // alert("Warning!");
                $('#ModalSuccess02IsPasswordUpdatedTrue').modal('show');
                break;
            default:
                break;
        }
    }
</script>

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

</body>
</html>