<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Profile" %>
<%@ page import="static services.HttpSession.IP_ADDRESS" %>
<%@ page import="static services.HttpSession.PROFILE" %>
<%@ page import="services.GeoLocation" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Land Add - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>

</head>

<body class="text-left">

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute(PROFILE) == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profile Profile = (Profile) request.getSession().getAttribute(PROFILE);
        String IpAddress = String.valueOf(request.getSession().getAttribute(IP_ADDRESS));
        System.out.println("IpAddress: " + IpAddress);

        GeoLocation GeoLocation = new GeoLocation();
        GeoLocation.LocationGet("112.134.92.56");
        String District = GeoLocation.DistrictGet();
        String City = GeoLocation.CityGet();
        System.out.println(District);
        System.out.println(City);

%>

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

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblLandAddLandAdd">Land Add</h1>
            <ul class="ml-2">
                <li><a id="lblLandAddBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><a id="lblLandAddBreadCrumbsAllLands" href="LandAll.jsp">All Lands</a></li>
                <li><span id="lblLandAddBreadCrumbsAddLands">Land Add</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="LandAddServlet" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="farmer_id"
                                           value="<%=Profile.getPkProfiles()%>" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandAddLandName">Land Name</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Land Name"
                                               id="txtLandAddLandName" value="" name="land_name"
                                               aria-label="LandName" aria-describedby="txtLandAddLandName"
                                               minlength="4" maxlength="30" required autofocus/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandAddLandExtentAmount">Land Extent Amount</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="number"
                                               placeholder="Land Extent Amount"
                                               id="txtLandAddLandExtentAmount"
                                               value="<%=LandExtentAmount%>"
                                               name="land_extent_amount"
                                               aria-label="LandExtentAmount"
                                               aria-describedby="txtLandAddLandExtentAmount"
                                               min="1" max="1000" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblLandAddLandExtentMeasurement">Land Extent Measurement</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddLandExtentMeasurement"
                                                name="land_extent_measurement"
                                                aria-label="LandExtentMeasurement"
                                                aria-describedby="cmbLandAddLandExtentMeasurement"
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
                                        &nbsp;
                                    </div>
                                    <label class="switch switch-primary mr-3 pr-5">
                                        <span id="lblLandAddMoreDetails">More Details</span>
                                        <input type="checkbox" id="myCheckbox"
                                               onchange="toggleCheckLand()">
                                        <span class="slider round"></span>
                                    </label>
                                </div>

                                <!--MoreDetails-->
                                <%--<div id="divLandAddMoreDetailsHolder" style="display:none">--%>

                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Land_Address">
                                    <div class="form-group">
                                        <label id="lblLandAddLandAddress">Land Address</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Land Address"
                                               id="txtLandAddLandAddress" value="" name="land_address"
                                               aria-label="LandAddress" aria-describedby="txtLandAddLandAddress"
                                               minlength="4" maxlength="200"/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Land_Type">
                                    <div class="form-group">
                                        <label id="lblLandAddLandType">Land Type</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddLandType" name="land_type"
                                                aria-label="LandType"
                                                aria-describedby="cmbLandAddLandType">
                                            <option value="Wet Land">Wet Land</option>
                                            <option value="Dry Land">Dry Land</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Ownership_State">
                                    <div class="form-group">
                                        <label id="lblLandAddOwnershipState">Ownership State</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddOwnershipState"
                                                name="land_ownership_status"
                                                aria-label="OwnershipState"
                                                aria-describedby="cmbLandAddOwnershipState">
                                            <option value="Rented">Rented</option>
                                            <option value="Owned">Owned</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Province">
                                    <div class="form-group">
                                        <label id="lblLandAddProvince">Province</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control"
                                                id="cmbLandAddProvince" name="land_province"
                                                aria-label="Province" aria-describedby="cmbLandAddProvince"
                                                onchange="SetDistricts()">

                                            <%--  <%
                                                  for (IdAndName Provinces :
                                                          ProvincesListGet()) {
                                              %>
                                              <option value="<%=Provinces.getId()%>">
                                                  <%=Provinces.getName()%>
                                              </option>
                                              <%
                                                  }
                                              %>--%>
                                            <option value="Select Province" disabled selected hidden>Select Province
                                            </option>
                                            <option value="Western">Western</option>
                                            <option value="Central">Central</option>
                                            <option value="Southern">Southern</option>
                                            <option value="Uva">Uva</option>
                                            <option value="Sabaragamuwa">Sabaragamuwa</option>
                                            <option value="North Western ">North Western</option>
                                            <option value="North Central"> North Central</option>
                                            <option value="Northern">Northern</option>
                                            <option value="Eastern">Eastern</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="District">
                                    <div class="form-group">
                                        <label id="lblLandAddDistrict">District</label>
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
                                                aria-describedby="cmbLandAddDistrict"
                                                onchange="SetGNDivisions()"
                                                data-live-search="true">

                                            <%--<%
                                                for (IdAndName Districts :
                                                        DistrictsListGet()) {
                                            %>
                                            <option value="<%=Districts.getId()%>">
                                                <%=Districts.getName()%>
                                            </option>
                                            <%
                                                }
                                            %>--%>

                                            <option value="Select District" disabled selected hidden>Select District
                                            </option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Gn_Division">
                                    <div class="form-group">
                                        <label id="lblLandAddGNDivision">GN Division</label>
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
                                                aria-describedby="cmbLandAddGNDivision">

                                            <%--   <%
                                                   for (IdAndName GnDivisions :
                                                           GnDivisionsListGet()) {
                                               %>
                                               <option value="<%=GnDivisions.getId()%>">
                                                   <%=GnDivisions.getName()%>
                                               </option>
                                               <%
                                                   }
                                               %>--%>
                                            <option value="Select GN Division" disabled selected hidden>Select GN
                                                Division
                                            </option>

                                        </select>
                                    </div>
                                </div>
                                <%--<div class="col-md-4 form-group">--%>
                                <%--<div class="form-group">--%>
                                <%--<label id="lblLandAddCultivationStatus">Cultivated Status</label>--%>
                                <%--</div>--%>
                                <%--<div class="input-group">--%>
                                <%--<div class="input-group-prepend">--%>
                                <%--<span class="input-group-text">--%>
                                <%--<i class="i-Pen-3"></i>--%>
                                <%--</span>--%>
                                <%--</div>--%>
                                <%--<select class="form-control"--%>
                                <%--id="cmbLandAddCultivationStatus"--%>
                                <%--name="land_cultivated_status"--%>
                                <%--aria-label="CultivationStatus"--%>
                                <%--aria-describedby="cmbLandAddCultivationStatus">--%>
                                <%--<option value="Not Cultivated">Not Cultivated</option>--%>
                                <%--<option value="Cultivated">Cultivated</option>--%>
                                <%--</select>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Land_Photo">
                                    <div class="form-group">
                                        <label id="lblLandAddLandPhoto">Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgLandAddLandPhoto"
                                                   type="file" name="land_photo"
                                                   aria-describedby="imgLandAddLandPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblLandAddLandChoosePhoto"
                                                   for="lblLandAddLandPhoto">Choose photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Selected_Land_Photo">
                                    <div class="form-group">
                                        <label id="lblLandAddLandPhotoSelected">Selected Land's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="land_photo_selected" style="width:100%; height:auto;"
                                             aria-label="LandAddLandPhotoSelected"
                                             aria-describedby="imgAddLandPhotoSelected">
                                    </div>
                                </div>

                                <%--</div>--%>
                                <!--/MoreDetails-->

                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnLandAddAddNewLand"
                                            class="btn btn-primary btn-block mt-2">
                                        Add New Land
                                    </button>
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
            } else if (request.getParameter("IsLandSaved") != null &&
                    request.getParameter("IsLandSaved").equals("false")) {
                //show alert
                Response = "IsLandSavedFalse";
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
                <div class="modal fade" id="ModalError02IsLandSavedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                                    <p id="ModalError02Body" class="mt-4 mb-4">Land saving failed.</p>
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
            case 'IsLandSavedFalse':
                // alert("Info!");
                $('#ModalError02IsLandSavedFalse').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<script>
    const language = getLanguage();
    console.log(language);
    if (language == "Sinhala") {
        ToggleLanguageSinhala();
    }
    if (language == "Tamil") {
        ToggleLanguageTamil();
    }
</script>

<%
    }
%>

</body>
</html>