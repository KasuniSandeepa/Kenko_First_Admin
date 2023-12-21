<%@ page import="models.Profile" %>
<%@ page import="utils.JSON" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>json test</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>

<body class="text-left">

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profile Profile = (Profile) request.getSession().getAttribute("Profile");
%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1>Profile Update</h1>
            <ul class="ml-2">
                <li><a href="Profile.jsp">Profile</a></li>
                <li><a href="">Profile Update</a></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="farmer_id"
                                           value="<%=Profile.getPkProfiles()%>" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateProvince">Province</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Map2"></i>
                                                </span>
                                        </div>

                                        <select class="form-control"
                                                id="cmbLandAddProvince" name="farmer_province"
                                                aria-label="Province"
                                                aria-describedby="cmbProfileUpdateProvince"
                                                onchange="SetDistricts()"
                                                required>

                                            <%
                                                List<String> list = new JSON().JsonArrayListGet("LandTypes");
                                                for (String StringValue : list) {
                                                    System.out.println(StringValue);
                                            %>

                                            <option value="<%=StringValue%>">
                                                <%=StringValue%>
                                            </option>

                                            <%
                                                }
                                            %>

                                            <%--<option value="Select Province" disabled selected hidden>--%>
                                            <%--Select Province--%>
                                            <%--</option>--%>
                                            <%--<option value="Central">Central</option>--%>
                                            <%--<option value="Eastern">Eastern</option>--%>
                                            <%--<option value="Northern">Northern</option>--%>
                                            <%--<option value="North Central">North Central</option>--%>
                                            <%--<option value="North Western">North Western</option>--%>
                                            <%--<option value="Sabaragamuwa">Sabaragamuwa</option>--%>
                                            <%--<option value="Southern">Southern</option>--%>
                                            <%--<option value="Uva">Uva</option>--%>
                                            <%--<option value="Western">Western</option>--%>

                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateDistrict">District</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Map2"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddDistrict" name="farmer_district"
                                                aria-label="District"
                                                aria-describedby="cmbProfileUpdateDistrict"
                                                onchange="SetGNDivisions()"
                                                required>

                                            <%-- <%
                                                 for (IdAndName Districts : DistrictsListGet()) {
                                             %>

                                             <option value="<%=Districts.getId()%>"><%=Districts.getName()%>
                                             </option>

                                             <%
                                                 }
                                             %>--%>

                                            <option value="Select District" disabled selected hidden>
                                                Select District
                                            </option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateGNDivision">GN Division</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Map2"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddGNDivision" name="farmer_gn_division"
                                                aria-label="GNDivision"
                                                aria-describedby="cmbProfileUpdateGNDivision"
                                                required>

                                            <%--  <%
                                                  for (IdAndName GnDivisions : GnDivisionsListGet()) {
                                              %>

                                              <option value="<%=GnDivisions.getId()%>"><%=GnDivisions.getName()%>
                                              </option>

                                              <%
                                                  }
                                              %>--%>

                                            <option value="Select GN Division" disabled selected hidden>
                                                Select GN Division
                                            </option>

                                        </select>
                                    </div>
                                </div>
                                <!-- <div class="col-md-4 form-group">&nbsp;</div> -->
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button class="btn btn-primary">Update Profile</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <!-- end of main-content -->

    </div>

    <!-- ============ Body content end ============= -->

    <!--Footer Start-->
    <%@include file="FooterKenkoFirst.jsp" %>
    <!--Footer end-->

</div>

<!-- ============ Search UI Start ============= -->

<!-- <div class="search-ui">
    <div class="search-header">
        <img src="../../dist-assets/images/logo.png" alt="" class="logo">
        <button class="search-close btn btn-icon bg-transparent float-right mt-2">
            <i class="i-Close-Window text-22 text-muted"></i>
        </button>
    </div>
    <input type="text" placeholder="Type here" class="search-input" autofocus>
    <div class="search-title">
        <span class="text-muted">Search results</span>
    </div>
    <div class="search-results list-horizontal">
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <a href="#">
                        <img src="../../dist-assets/images/products/headphone-1.jpg" alt="">
                    </a>
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-danger">Sale</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <img src="../../dist-assets/images/products/headphone-2.jpg" alt="">
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-primary">New</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <img src="../../dist-assets/images/products/headphone-3.jpg" alt="">
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-primary">New</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-item col-md-12 p-0">
            <div class="card o-hidden flex-row mb-4 d-flex">
                <div class="list-thumb d-flex">
                    TUMBNAIL
                    <img src="../../dist-assets/images/products/headphone-4.jpg" alt="">
                </div>
                <div class="flex-grow-1 pl-2 d-flex">
                    <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                        OTHER DATA
                        <a href="" class="w-40 w-sm-100">
                            <div class="item-title">Headphone 1</div>
                        </a>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                            <del class="text-secondary">$400</del>
                        </p>
                        <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                            <span class="badge badge-primary">New</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    PAGINATION CONTROL
    <div class="col-md-12 mt-5 text-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination d-inline-flex">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div> -->
<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>
<script src="dist-assets/js/custom/distric_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/gn_division_dropdown_automate.js"></script>
<script src="dist-assets/js/custom/data_lists.js"></script>


<%
    }
%>

</body>
</html>