
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add History - Kenko 1st</title>
    <link rel="shortcut icon" type="image/png" href="src/images/logos/favicon.png">

    <link rel="stylesheet" type="text/css" href="src/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="src/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="src/css/main.css">

    <%--    <script type="text/javascript" src="src/js/jquery-3.2.1.min.js"></script>--%>
    <%--    <script type="text/javascript" src="src/js/bootstrap.min.js"></script>--%>
        <%--<script type="text/javascript" src="src/js/main.js"></script>--%>

    <script type="text/javascript">
        function initRefineUrl() {
            window.location.href = refineUrl(window.location.href);
        }
    </script>

    <script type="text/javascript">
        function PreviewImageBeforeSaving(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('farmer_photo_preview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</head>
<body>

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
//        Profile Profile = (Profile) request.getSession().getAttribute("Profile");
%>

<%@include file="Header.jsp" %>


<!--history-all-->
<div class="container rounded border bg-white mt-5 mb-5">
    <div class="row pt-5 pb-5 pl-3 pr-3">
        <div class="col-lg-12">

            <!--row-->
            <div class="row d-flex">

                <!--sidebar-->
                <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 border p-4">

                    <!--include-sidebar-->
                    <%--<%@include file="" %>--%>

                </div>
                <!--/sidebar-->


                <!--content-->
                <div class="col-xl-10 col-lg-10 col-md-12 col-sm-12 col-12 border p-4">

                  <!--include-history-list-->
                  <%@include file="HistoryList.jsp" %>

                </div>
                <!--/content-->


            </div>
            <!--/row-->

        </div>

    </div>
</div>
<!--/history-all-->

<%@include file="FooterKenkoFirst.jsp" %>

<%
    }
%>

</body>
</html>
