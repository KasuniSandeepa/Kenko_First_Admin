
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password Mobile Number - Kenko 1st Agri Business</title>
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
                                <h1 id="lblForgotPasswordForgotPassword"
                                    class="mb-3 text-18">Forgot Password</h1>

                                <form action="ForgotPasswordOtpSendServlet" method="post">
                                    <div class="form-group">
                                        <div class="form-group mb-3">
                                            <div class="form-group">
                                                <label id="lblForgotPasswordMobileNumber">Mobile Number</label>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Telephone"></i>
                                                </span>
                                                </div>
                                                <input class="form-control" type="text" placeholder="Mobile Number"
                                                       id="txtForgotPasswordMobileNumber" value="" name="farmer_contact_number"
                                                       aria-label="MobileNumber"
                                                       aria-describedby="txtForgotPasswordMobileNumber"
                                                       minlength="10" maxlength="10" required autofocus/>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" style="margin-bottom: 0.5rem;"
                                            class="btn btn-primary btn-block mt-2"
                                            id="btnForgotPasswordNext">Next</button>

                                    <a href="" style="margin-top: 0 !important;"
                                       class="btn btn-outline-success btn-block mt-2"
                                       id="btnForgotPasswordSignIn">Sign In</a>
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

<%
    String Response = "None";
    if (request.getParameter("OtpSentStatus") != null &&
            request.getParameter("OtpSentStatus").equals("invalid")) {
        //show alert
        Response = "OtpSentStatusInvalid";
    } else if (request.getParameter("OtpSentStatus") != null &&
            request.getParameter("OtpSentStatus").equals("false")) {
        //show alert
        Response = "OtpSentStatusFalse";
    }
%>

<!--row-->
<div class="row">

    <div class="col-md-12 mb-2">

        <!--modal-error-->
        <div class="modal fade" id="ModalError01OtpSentStatusInvalid">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                            <p id="ModalError01Body" class="mt-4 mb-4">Given mobile number is not found in the system.</p>
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
        <div class="modal fade" id="ModalError02OtpSentStatusFalse">
            <div class="modal-dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content p-3">
                        <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                            <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                            <p id="ModalError02Body" class="mt-4 mb-4">OTP code sending failed, try again.</p>
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
            case 'OtpSentStatusInvalid':
                // alert("Success!");
                $('#ModalError01OtpSentStatusInvalid').modal('show');
                break;
            case 'OtpSentStatusFalse':
                // alert("Success!");
                $('#ModalError02OtpSentStatusFalse').modal('show');
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

</body>
</html>