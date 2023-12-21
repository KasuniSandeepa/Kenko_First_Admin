<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Log4J Test</title>
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

                        <a href="Log4jTestServlet?user=Nick" class="btn btn-success ripple">
                            Success Link
                        </a>

                    </div>

                    <div class="col-md-3 mb-2">

                        <a href="#" class="btn btn-info ripple">
                            Information Link
                        </a>

                    </div>

                    <div class="col-md-3 mb-2">

                        <a href="#" class="btn btn-warning ripple">
                            Warning Link
                        </a>

                    </div>

                    <div class="col-md-3 mb-2">

                        <a href="#" class="btn btn-danger ripple">
                            Error Link
                        </a>

                    </div>

                </div>

            </div>
        </div>

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

<%--<script>--%>
<%--window.onload = function () {--%>
<%--$('#myModalSuccess').modal('show');--%>
<%--}--%>
<%--</script>--%>

</body>
</html>