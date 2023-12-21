<%@ page import="models.LandDetails" %>
<%@ page import="static services.HttpSession.PROFILE" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Land Update - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>

<body class="text-left">

<%
    if (request.getSession().getAttribute(PROFILE) == null) {
        response.sendRedirect("index.jsp");
    } else {
//        Profile Profile = (Profile) request.getSession().getAttribute(PROFILE);

        int PkLandDetails = 0;
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));
        LandDetails LandDetails = models.LandDetails.LandDetailsGet(PkLandDetails);

%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <%
        String LandExtentAmount = "";
        String LandExtentMeasurement = "";

        if (request.getParameter("IsLandNameExistsInDatabase") != null &&
                request.getParameter("IsLandNameExistsInDatabase").equals("true")) {
            //get values for auto-fill
            LandExtentAmount = request.getParameter("LandExtentAmount");
            LandExtentMeasurement = request.getParameter("LandExtentMeasurement");
            //show alert - done @ the bottom of the page
        }
    %>

    <div class="main-content">
        <div class="breadcrumb">
            <h1 id="lblLandUpdateBreadCrumbsLandUpdateHeading">Land Update</h1>
            <ul class="ml-2">
                <li><a id="lblLandUpdateBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><a id="lblLandUpdateBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>
                <li><a id="lblLandUpdateBreadCrumbsLandDetails" href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li><span id="lblLandUpdateBreadCrumbsLandUpdate">Land Update</span></li>
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

                            <!--land-id-->
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="land_id"
                                           value="<%=PkLandDetails%>" required>
                                </div>
                            </div>
                            <!--/land-id-->

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandName">Land Name</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Land Name"
                                               id="txtLandUpdateLandName"
                                               value="<%=LandDetails.get_Name()%>" name="land_name"
                                               aria-label="LandName"
                                               aria-describedby="txtLandUpdateLandName"
                                               minlength="4" maxlength="30" required autofocus/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandExtentAmount">Land Extent Amount</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="number" placeholder="Land Extent Amount"
                                               id="txtLandUpdateLandExtentAmount"
                                               value="<%=LandDetails.get_LandExtent().split("_")[0]%>"
                                               name="land_extent_amount"
                                               aria-label="LandExtentAmount"
                                               aria-describedby="txtLandUpdateLandExtentAmount"
                                               min="1" max="1000" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandExtentMeasurement">Land Extent Measurement</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandUpdateLandExtentMeasurement"
                                                name="land_extent_measurement"
                                                aria-label="LandExtentMeasurement"
                                                aria-describedby="cmbLandUpdateLandExtentMeasurement"
                                                required>
                                            <option value="Square Metres">Square Metres</option>
                                            <option value="Square Feet">Square Feet</option>
                                            <option value="Perches">Perches</option>
                                            <option value="Acres">Acres</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandAddress">Land Address</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Land Address"
                                               id="txtLandUpdateLandAddress"
                                               value="<%=LandDetails.get_Address()%>" name="land_Address"
                                               aria-label="LandAddress"
                                               aria-describedby="txtLandUpdateLandAddress"
                                               minlength="4" maxlength="300"/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandType">Land Type</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandUpdateLandType" name="land_type"
                                                aria-label="LandType"
                                                aria-describedby="cmbLandUpdateLandType">
                                            <option value="Wet Land">Wet Land</option>
                                            <option value="Dry Land">Dry Land</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateOwnershipState">Ownership State</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandUpdateOwnershipState"
                                                name="land_ownership_state"
                                                aria-label="OwnershipState"
                                                aria-describedby="cmbLandUpdateOwnershipState"
                                                required>
                                            <option value="Rented">Rented</option>
                                            <option value="Owned">Owned</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateProvince">Province</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddProvince" name="land_province"
                                                aria-label="Province"
                                                aria-describedby="cmbLandUpdateProvince"
                                                onchange="SetDistricts()"
                                                required>

                                            <%-- <%
                                                 for (IdAndName Provinces : ProvincesListGet()) {
                                             %>

                                             <option value="<%=Provinces.getId()%>"
                                                     <%
                                                         if (Provinces.getId() == LandDetails
                                                                 .get_Province()) {
                                                             //set selected
                                                     %>
                                                     selected
                                                     <%
                                                         }
                                                     %>><%=Provinces.getName()%></option>

                                             <%
                                                 }
                                             %>--%>
                                            <option value="Select Province" disabled selected hidden>Select Province</option>
                                            <option value="Western">Western</option>
                                            <option value="Central">Central</option>
                                            <option value="Southern">Southern</option>
                                            <option value="Uva">Uva</option>
                                            <option value="Sabaragamuwa">Sabaragamuwa </option>
                                            <option value="North Western ">North Western </option>
                                            <option value="North Central"> North Central</option>
                                            <option value="Northern">Northern </option>
                                            <option value="Eastern">Eastern  </option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateDistrict">District</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddDistrict" name="land_district"
                                                aria-label="District"
                                                aria-describedby="cmbLandUpdateDistrict"
                                                onchange="SetGNDivisions()"
                                                required>

                                            <%-- <%
                                                 for (IdAndName Districts : DistrictsListGet()) {
                                             %>

                                             <option value="<%=Districts.getId()%>"
                                                     <%
                                                         if (Districts.getId() == LandDetails
                                                                 .get_District()) {
                                                             //set selected
                                                     %>
                                                     selected
                                                     <%
                                                         }
                                                     %>><%=Districts.getName()%></option>

                                             <%
                                                 }
                                             %>--%>
                                            <option value="Select District" disabled selected hidden>Select  District</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateGNDivision">GN Division</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddGNDivision" name="land_gn_area"
                                                aria-label="GNDivision"
                                                aria-describedby="cmbLandUpdateGNDivision"
                                                required>

                                            <%--    <%
                                                    for (IdAndName GnDivisions : GnDivisionsListGet()) {
                                                %>

                                                <option value="<%=GnDivisions.getId()%>"
                                                        <%
                                                            if (GnDivisions.getId() == LandDetails
                                                                    .get_GNArea()) {
                                                                //set selected
                                                        %>
                                                        selected
                                                        <%
                                                            }
                                                        %>><%=GnDivisions.getName()%></option>

                                                <%
                                                    }
                                                %>--%>

                                            <option value="Select GN Division" disabled selected hidden>Select GN Division</option>

                                        </select>
                                    </div>
                                </div>
                                <%--<div class="col-md-4 form-group">--%>
                                    <%--<div class="form-group">--%>
                                        <%--<label id="lblLandUpdateCultivationStatus">Cultivation Status</label>--%>
                                    <%--</div>--%>
                                    <%--<div class="input-group">--%>
                                        <%--<div class="input-group-prepend">--%>
                                                <%--<span class="input-group-text">--%>
                                                    <%--<i class="i-Pen-3"></i>--%>
                                                <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<select class="form-control"--%>
                                                <%--id="cmbLandUpdateCultivationStatus"--%>
                                                <%--name="land_cultivation_status"--%>
                                                <%--aria-label="CultivationStatus"--%>
                                                <%--aria-describedby="cmbLandUpdateCultivationStatus"--%>
                                                <%--required>--%>
                                            <%--<option value="Not Cultivated">Not Cultivated</option>--%>
                                            <%--<option value="Cultivated">Cultivated</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandPhoto">Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgLandUpdateLandPhoto"
                                                   type="file" name="land_photo"
                                                   aria-describedby="imgLandUpdateLandPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblLandUpdateLandChoosePhoto"
                                                   for="lblLandUpdateLandPhoto">Choose Photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandUpdateLandPhotoSaved">Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="land_photo_saved" style="width:100%; height:auto;"
                                             aria-label="LandUpdateLandPhotoSaved"
                                             aria-describedby="imgUpdateLandPhotoSaved">
                                    </div>
                                </div>
                                <!-- <div class="col-md-4 form-group">&nbsp;</div> -->
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnLandUpdateUpdateLand"
                                            class="btn btn-primary btn-block mt-2">Update Land</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->

        <%
            String Response = "None";
            if (request.getParameter("IsLandNameExistsInDatabase") != null &&
                    request.getParameter("IsLandNameExistsInDatabase").equals("true")) {
                //show alert
                Response = "IsLandNameExistsInDatabaseTrue";
            } else if (request.getParameter("IsLandUpdated") != null &&
                    request.getParameter("IsLandUpdated").equals("false")) {
                //show alert
                Response = "IsLandUpdatedFalse";
            } else if (request.getParameter("IsLandUpdated") != null &&
                    request.getParameter("IsLandUpdated").equals("true")) {
                //show alert
                Response = "IsLandUpdatedTrue";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsLandNameExistsInDatabaseTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01Body" class="mt-4 mb-4">Given land name is already present, try
                                        again.</p>
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
                <div class="modal fade" id="ModalError02IsLandUpdatedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                                    <p id="ModalError02Body" class="mt-4 mb-4">Land updating failed.</p>
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
                <div class="modal fade" id="ModalSuccess01IsLandUpdatedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess02Title">Success!</h2>
                                    <p id="ModalSuccess02Body" class="mt-4 mb-4">Land updated.</p>
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
<script src="dist-assets/js/custom/switch_language.js"></script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsLandNameExistsInDatabaseTrue':
                // alert("Success!");
                $('#ModalError01IsLandNameExistsInDatabaseTrue').modal('show');
                break;
            case 'IsLandUpdatedFalse':
                // alert("Info!");
                $('#ModalError02IsLandUpdatedFalse').modal('show');
                break;
            case 'IsLandUpdatedTrue':
                // alert("Warning!");
                $('#ModalSuccess01IsLandUpdatedTrue').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<script>
    const language =  getLanguage();
    console.log(language);
    if(language=="Sinhala"){
        ToggleLanguageSinhala();
    }
    if(language=="Tamil"){
        ToggleLanguageTamil();
    }
</script>

<%
    }
%>

</body>
</html>