
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up - Kenko 1st Agri Business</title>
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

<%
    String VerifiedNumber = "";
    if (request.getParameter("VerifiedNumber") != null &&
            !request.getParameter("VerifiedNumber").equals("")) {
        VerifiedNumber = request.getParameter("VerifiedNumber");
    }
%>

<div class="auth-layout-wrap" style="background-color: #e3ece1;">
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
                                <h1 id="lblSignUp" class="mb-3 text-18">Sign Up</h1>

                                <form action="ProfileAddServlet" method="post">

                                    <!--verified-contact-number-->
                                    <input type="hidden" value="<%=VerifiedNumber%>"
                                           name="farmer_contact_number" required>
                                    <!--/verified-contact-number-->

                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Business-ManWoman"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="text" placeholder="First Name"
                                                   id="txtSignUpFirstName" value="" name="farmer_first_name"
                                                   aria-label="FirstName" aria-describedby="txtSignUpFirstName"
                                                   minlength="4" maxlength="30" required autofocus />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Business-ManWoman"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="text" placeholder="Last Name"
                                                   id="txtSignUpLastName" value="" name="farmer_last_name"
                                                   aria-label="LastName" aria-describedby="txtSignUpLastName"
                                                   minlength="4" maxlength="30" required />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-ID-Card"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="text" placeholder="NIC"
                                                   id="txtSignUpNic" value="" name="farmer_nic"
                                                   aria-label="Nic" aria-describedby="txtSignUpNic"
                                                   minlength="10" maxlength="12" required />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="password" placeholder="Password"
                                                   id="txtSignUpPassword" value="" name="farmer_password"
                                                   aria-label="Password" aria-describedby="txtSignUpPassword"
                                                   minlength="6" maxlength="16" required />
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="i-Eye-Visible"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="password" placeholder="Password Confirm"
                                                   id="txtSignUpPasswordConfirm" value="" name="farmer_password_confirm"
                                                   aria-label="PasswordConfirm" aria-describedby="txtSignUpPasswordConfirm"
                                                   minlength="6" maxlength="16" required />
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="i-Eye-Visible"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <label class="checkbox checkbox-primary">
                                            <input Id="cheAgreeToTerms" type="checkbox"
                                                   required/>
                                            <span id="checkAgreeToTerms">I Agree To Terms And Conditions</span>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <button type="submit" style="margin-bottom: 0.5rem;" id="btnSignUpSignIn"
                                            class="btn btn-primary btn-block mt-2">Sign Up</button>

                                    <a href="index.jsp" style="margin-top: 0 !important;" id="btnSignUpSignUp"
                                       class="btn btn-outline-success btn-block mt-2">Sign In</a>
                                </form>
                                <!-- <div class="mt-3 text-14 text-center"><a class="text-muted" href="forgot.html">
                                    <u>Forgot Password?</u></a>
                                </div> -->
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

<%
    String Response = "None";
    if (request.getParameter("NicPresent") != null &&
            request.getParameter("NicPresent").equals("true")) {
        //show alert
        Response = "NicPresentTrue";
    } else if (request.getParameter("NicValid") != null &&
            request.getParameter("NicValid").equals("false")) {
        //show alert
        Response = "NicValidFalse";
    }
%>

<!--row-->
<div class="row">

    <div class="col-md-12 mb-2">

        <!--modal-error-->
        <div class="modal fade" id="ModalError01NicPresentTrue">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                            <p id="ModalError01Body" class="mt-4 mb-4">NIC number already present.</p>
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
        <div class="modal fade" id="ModalError02NicValidFalse">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                            <p id="ModalError02Body" class="mt-4 mb-4">Invalid NIC number, try again.</p>
                            <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                <span id="ModalError02Footer">Okay</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/modal-error-->

    </div>

</div>
<!--/row-->

<%@include file="FooterMobios.jsp"%>

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'NicPresentTrue':
                // alert("Success!");
                $('#ModalError01NicPresentTrue').modal('show');
                break;
            case 'NicValidFalse':
                // alert("Info!");
                $('#ModalError02NicValidFalse').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<script>
    const lan =  getLanguage();
    console.log(lan);
    if(lan=="Sinhala"){
        ToggleLanguageSinhala();
    }
    if(lan=="Tamil"){
        ToggleLanguageTamil();
    }
</script>

<%@include file="FooterMobios.jsp"%>

</body>
</html>