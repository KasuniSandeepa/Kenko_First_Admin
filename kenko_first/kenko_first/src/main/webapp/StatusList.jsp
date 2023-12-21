<%@ page import="models.Status" %>
<%@ page import="static services.DatabaseTableLists.StatusOfCropPaginatedGet" %>
<%@ page import="utils.Strings" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <%--<link href="dist-assets/css/main.css" rel="stylesheet">--%>
</head>

<body>

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
//        Profile ProfilesInStatusList = (Profile) request.getSession().getAttribute("Profile");
%>

<!-- =============== Left side start ================-->
<!-- =============== Left side End ================-->

<!-- <div class="main-content-wrap sidenav-open d-flex flex-column"> -->

<!-- ============ Body content start ============= -->

<!-- <div class="main-content">
    <div class="breadcrumb">
        <h1>Lands</h1>
        <ul class="ml-2">
            <li><a href="#">Profile</a></li>
            <li><a href="#">Lands</a></li>
        </ul>
    </div>
    <div class="separator-breadcrumb border-top"></div> -->

<!-- start of main-content -->

<!-- summary -->
<!-- /summary -->

<!-- overview -->
<!-- <div class="row"> -->

<!-- left-side-->
<!-- 			<div class="col-md-12">
                <div class="row"> -->
<!--
    <div class="col-md-12">
        <h4 class="card-title" id="">All Lands</h4>
    </div>

    <div class="col-md-12 mb-4">
        <a class="btn btn-large btn-primary" id="startTourBtn" href="">Add a new land</a>
    </div>
 -->

<!--status-list-->
<div class="col-md-12">

    <%
        for (Status d : StatusOfCropPaginatedGet(3)) {
//            System.out.println(d.getId() + ", " + d.get_Status()
//                    + ", " + d.get_Quantity() + ", " + d.get_DateTime());
    %>

    <div class="card mb-4">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row align-items-sm-center mb-3">

                <%--<img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"--%>
                <%--src="../../dist-assets/images/products/headphone-4.jpg" alt="" />--%>

                <img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"
                     src="dist-assets/images/products/headphone-4.jpg" alt="" />

                <div class="flex-grow-1">
                    <h5><%=d.get_Status()%></h5>
                    <p class="m-0 text-small text-muted">
                        <%=Strings.UnderscoresReplace(d.get_Quantity())%>
                    </p>
                    <p class="text-small text-danger m-0">
                        <%=d.get_DateTime()%>
                    </p>
                </div>
                <%--<div>--%>
                    <%--<a class="btn btn-outline-primary mt-3 mb-3 m-sm-0 btn-sm"--%>
                       <%--href="LandDetails.jsp?PkLandDetails=<%=LandImagesInLandList.getId()%>">--%>
                        <%--View details--%>
                    <%--</a>--%>
                    <%--<a class="btn btn-outline-secondary mt-3 mb-3 m-sm-0 btn-sm"--%>
                       <%--href="CropAdd.jsp?PkLandDetails=<%=LandImagesInLandList.getId()%>">--%>
                        <%--Add a new crop--%>
                    <%--</a>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>

    <%
        }
    %>

</div>
<!--/status-list-->

<!-- </div>
</div> -->
<!-- /left-side-->

<!-- </div>			 -->
<!-- /overview -->

<!-- end of main-content -->


<!-- ============ Body content end ============= -->

<!-- Footer Start -->
<!-- fotter end -->

<!-- </div>
</div> -->

<!-- ============ Search UI Start ============= -->
<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>

<%
    }
%>

</body>
</html>