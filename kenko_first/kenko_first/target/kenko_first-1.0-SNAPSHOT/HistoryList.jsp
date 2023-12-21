<%@ page import="models.Profile" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <%--<link rel="shortcut icon" type="image/png" href="src/images/logos/favicon.png">--%>

    <%--<link rel="stylesheet" type="text/css" href="src/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="src/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="src/css/main.css">--%>

    <%--    <script type="text/javascript" src="src/js/main.js"></script>--%>
    <%--    <script type="text/javascript" src="src/js/jquery-3.2.1.min.js"></script>--%>
        <%--<script type="text/javascript" src="src/js/bootstrap.min.js"></script>--%>

</head>
<body>

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
//        Profile ProfilesInHistoryList = (Profile) request.getSession().getAttribute("Profile");
%>

<!--history-list-->
<div class="row d-flex justify-content-center">
    <div class="col-12">

        <!--row-->
        <div class="row d-flex justify-content-center">
            <div class="col-12">

                <!--row-->
                <div class="row mb-4">
                    <div class="col-12">
                        <h2 class="text-secondary">All History</h2>
                    </div>
                </div>
                <!--/row-->

                <!--row-->
                <div class="row mt-5 mb-5 d-flex">
                    <div class="col-2">
                        <h4 class="text-success">3</h4>
                        <p>Profile Updates</p>
                    </div>
                    <div class="col-4">
                        <h4 class="text-success">2</h4>
                        <p>Land Updates</p>
                    </div>
                    <div class="col-2">
                        <h4 class="text-success">0</h4>
                        <p>Crop Updates</p>
                    </div>
                    <div class="col-2">
                        <h4 class="text-success">1</h4>
                        <p>History Updates</p>
                    </div>
                    <div class="col-2">
                        <h4 class="text-success">1</h4>
                        <p>History Updates</p>
                    </div>
                </div>
                <!--/row-->

                <!--row-->
                <div class="row mt-5 mb-3 d-flex">
                    <div class="col-2">
                        <h4 class="text-success">3</h4>
                        <p>Profile Updates</p>
                    </div>
                    <div class="col-6">
                        <h4 class="text-success">2</h4>
                        <p>Land Updates</p>
                    </div>
                    <div class="col-2">
                        <h4 class="text-success">0</h4>
                        <p>Crop Updates</p>
                    </div>
                    <div class="col-2">
                        <h4 class="text-success">1</h4>
                        <p>History Updates</p>
                    </div>
                </div>
                <!--/row-->

            </div>
        </div>
        <!--/row-->

    </div>
</div>
<!--/history-list-->

<%
    }
%>

</body>
</html>
