<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Modal Test Level 2</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>

<body class="text-left">

<!-- =============== Left side start ================-->
<%--<%@include file="_header.jsp" %>--%>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content">
        <div class="breadcrumb">
            <h1>Blank</h1>
            <ul>
                <li><a href="">Pages</a></li>
                <li>Blank</li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <div class="row">
            <div class="col-md-12">

                <div class="row">

                    <div class="col-md-3 mb-2">

                        <button type="button" class="btn btn-primary ripple"
                                data-toggle="modal" data-target="#ModalSuccess01">
                            Success modal
                        </button>

                        <div class="modal fade" id="ModalSuccess01">
                            <div class="modal-dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content p-3">
                                        <div class="modal-body align-items-center text-center">
                                            <span class="text-center"><i
                                                    class="text-success display-3 i-Yes"></i></span>
                                            <h2 class="mt-3 mb-3" id="ModalSuccess01Title">Success!</h2>
                                            <p id="ModalSuccess01Body" class="mt-4 mb-4">Your work has been saved.</p>
                                            <button class="btn btn-lg btn-success" type="button" data-dismiss="modal">
                                                <span id="ModalSuccess01Footer">Okay</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 mb-2">

                        <button type="button" class="btn btn-dark ripple"
                                data-toggle="modal" data-target="#ModalInfo01">
                            Info modal
                        </button>

                        <div class="modal fade" id="ModalInfo01">
                            <div class="modal-dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content p-3">
                                        <div class="modal-body align-items-center text-center">
                                            <span class="text-center"><i class="text-dark display-3 i-Information"></i></span>
                                            <h2 class="mt-3 mb-3" id="ModalInfoTitle01">Info!</h2>
                                            <p id="ModalInfoBody01" class="mt-4 mb-4">An image goes here.</p>
                                            <button class="btn btn-lg btn-dark" type="button" data-dismiss="modal">
                                                <span id="ModalInfoFooter01">Okay</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 mb-2">

                        <button type="button" class="btn btn-warning ripple"
                                data-toggle="modal" data-target="#ModalWarning01">
                            Warning modal
                        </button>

                        <div class="modal fade" id="ModalWarning01">
                            <div class="modal-dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content p-3">
                                        <div class="modal-body align-items-center text-center">
                                            <span class="text-center"><i
                                                    class="text-warning display-3 i-Information"></i></span>
                                            <h2 class="mt-3 mb-3" id="ModalWarning01Title">Warning!</h2>
                                            <p id="ModalWarning01Body" class="mt-4 mb-4">Be careful.</p>
                                            <button class="btn btn-lg btn-warning" type="button" data-dismiss="modal">
                                                <span id="ModalWarning01Footer">Okay</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="col-md-3 mb-2">

                        <button type="button" class="btn btn-danger ripple"
                                data-toggle="modal" data-target="#ModalError01">
                            Error modal
                        </button>

                        <div class="modal fade" id="ModalError01">
                            <div class="modal-dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content p-3">
                                        <div class="modal-body align-items-center text-center">
                                            <span class="text-center"><i
                                                    class="text-danger display-3 i-Close"></i></span>
                                            <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                            <p id="ModalError01Body" class="mt-4 mb-4">That was a failure.</p>
                                            <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                                <span id="ModalError01Footer">Okay</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>

        <%
            String Response = "d";
            if (request.getParameter("x") != null) {
                Response = request.getParameter("x");
            }
        %>

        <!-- end of main-content -->

    </div>

    <!-- ============ Body content end ============= -->

    <!--Footer Start-->
    <%--<%@include file="_footer.jsp" %>--%>
    <!--Footer end-->

</div>

<!-- ============ Search UI Start ============= -->

<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        // console.log(ResponseValue);
        switch (ResponseValue) {
            case 's':
                // alert("Success!");
                $('#ModalSuccess01').modal('show');
                break;
            case 'i':
                // alert("Info!");
                $('#ModalInfo01').modal('show');
                break;
            case 'w':
                // alert("Warning!");
                $('#ModalWarning01').modal('show');
                break;
            case 'e':
                // alert("Error!");
                $('#ModalError01').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<%--<script>--%>
<%--window.onload = function () {--%>
<%--$('#myModalSuccess').modal('show');--%>
<%--}--%>
<%--</script>--%>

</body>
</html>