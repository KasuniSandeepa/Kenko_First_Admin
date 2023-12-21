<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Profile" %>
<%@ page import="static services.HttpSession.PROFILE" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Crop Add - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>

    <link href="dist-assets/css/custom/font-awesome.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
    <link href="dist-assets/slick/slick.css" rel="stylesheet"/>

    <!-- icons -->
    <link rel="stylesheet" href="dist-assets/css/custom/font-awesome.min.css">

    <style type="text/css">
        .opaque {
            background-color: rgba(245, 245, 245, 0.5);
        }
        .slider-item{
            cursor: pointer;
            border: solid 2px #e3ece1;
        }
    </style>

</head>

<body class="text-left">

<%
    if (request.getSession().getAttribute(PROFILE) == null) {
        response.sendRedirect("index.jsp");
    } else {
//        Profile Profile = (Profile) request.getSession().getAttribute(PROFILE);

        int PkLandDetails = 0;
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));

%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content">
        <div class="breadcrumb">
            <h1 id="lblCropAddBreadCrumbsCropAddHeading">Crop Add</h1>
            <ul>
                <li><a id="lblCropAddBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><a id="lblCropAddBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>
                <li><a id="lblCropAddBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li><span id="lblCropAddBreadCrumbsCropAdd">Crop Add</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="CropAddServlet" method="post" enctype="multipart/form-data">

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
                                        <label id="lblCropAddCropType">Crop Type</label>
                                    </div>
                                    <%--<div class="input-group">--%>

                                        <%--<div class="input-group-prepend">--%>
                                        <%--<span class="input-group-text">--%>
                                        <%--<i class="i-Dry"></i>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<select class="form-control"--%>
                                        <%--id="cmbCropAddCropType" name="crop_type"--%>
                                        <%--aria-label="CropType"--%>
                                        <%--aria-describedby="cmbCropAddCropType"--%>
                                        <%--required>--%>
                                        <%--<option value="Carrot">Carrot</option>--%>
                                        <%--<option value="Leeks">Leeks</option>--%>
                                        <%--<option value="Beans">Beans</option>--%>
                                        <%--</select>--%>

                                            <!--carousel-->
                                            <div class="slider parent">
                                                <div id="Onion" class="col-md-4 p-2 m-1 rounded slider-item border">
                                                    <img class="d-block w-100"
                                                         src="dist-assets/images/crops/onion.png">
                                                    <div class="carousel-caption p-0">
                                                        <div class="p-1 rounded opaque">
                                                            <p class="m-0 p-0 text-dark small">onion</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Banana" class="col-md-4 p-2 m-1 rounded slider-item border">
                                                    <img class="d-block w-100"
                                                         src="dist-assets/images/crops/banana.png">
                                                    <div class="carousel-caption p-0">
                                                        <div class="p-1 rounded opaque">
                                                            <p class="m-0 p-0 text-dark small">banana</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Beans" class="col-md-4 p-2 m-1 rounded slider-item border">
                                                    <img class="d-block w-100"
                                                         src="dist-assets/images/crops/peas.png">
                                                    <div class="carousel-caption p-0">
                                                        <div class="p-1 rounded opaque">
                                                            <p class="m-0 p-0 text-dark small">beans</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Papaya" class="col-md-4 p-2 m-1 rounded slider-item border">
                                                    <img class="d-block w-100"
                                                         src="dist-assets/images/crops/papaya.png">
                                                    <div class="carousel-caption p-0">
                                                        <div class="p-1 rounded opaque">
                                                            <p class="m-0 p-0 text-dark small">papaya</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Tomato" class="col-md-4 p-2 m-1 rounded slider-item border">
                                                    <img class="d-block w-100"
                                                         src="dist-assets/images/crops/tomato.png">
                                                    <div class="carousel-caption p-0">
                                                        <div class="p-1 rounded opaque">
                                                            <p class="m-0 p-0 text-dark small">tomato</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Leeks" class="col-md-4 p-2 m-1 rounded slider-item border">
                                                    <img class="d-block w-100"
                                                         src="dist-assets/images/crops/leaks.png">
                                                    <div class="carousel-caption p-0">
                                                        <div class="p-1 rounded opaque">
                                                            <p class="m-0 p-0 text-dark small">leeks</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt-3 mb-3">
                                                <div class="col-md-12 text-center">
                                            <span class="arrow_prev mr-5">
                                                <i class="fa fa-chevron-left fa-2x text-success"></i>
                                            </span>
                                                    <span class="arrow_next ml-5">
                                                <i class="fa fa-chevron-right fa-2x text-success"></i>
                                            </span>
                                                </div>
                                            </div>

                                            <!-- <div id="Badge" class="badge-top-container m-1" style="display: none;">
                                                <span class="badge badge-primary">
                                                    <i class="i-Yes"></i>
                                                </span>
                                            </div> -->
                                            <!--/carousel-->

                                            <!--crop-type-->
                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="hidden" id="crop_type"
                                                           name="crop_type_name"
                                                           value="crop_type" required>
                                                </div>
                                            </div>
                                            <!--/crop-type-->

                                    <%--</div>--%>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropExtentAmount">Cultivated Land Area - Number</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="number"
                                               placeholder="Planted Land Area - Number"
                                               id="txtCropAddCropExtentNumber" value=""
                                               name="crop_extent_number"
                                               aria-label="CropExtentNumber"
                                               aria-describedby="txtCropAddCropExtentNumber"
                                               min="1" max="1000" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropExtentMeasurement">
                                            Cultivated Land Area - Unit</label>
                                    </div>
                                    <div class="input-group mt-2 mb-3">

                                        <%--<div class="input-group-prepend">--%>
                                        <%--<span class="input-group-text">--%>
                                        <%--<i class="i-Pen-3"></i>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<select class="form-control"--%>
                                        <%--id="cmbCropAddCropExtentMeasurement"--%>
                                        <%--name="crop_extent_unit"--%>
                                        <%--aria-label="CropExtentMeasurement"--%>
                                        <%--aria-describedby="cmbCropAddCropExtentMeasurement"--%>
                                        <%--required>--%>
                                        <%--<option value="Plots">Plots</option>--%>
                                        <%--<option value="Square Metres">Square Metres</option>--%>
                                        <%--<option value="Square Feet">Square Feet</option>--%>
                                        <%--<option value="Perches">Perches</option>--%>
                                        <%--<option value="Acres">Acres</option>--%>
                                        <%--</select>--%>

                                        <div class="btn-group-vertical" role="group">
                                            <%--<label class="radio radio-primary">--%>
                                            <%--<input type="radio" name="radio3" value="Plots"/>--%>
                                            <%--<span>Plots</span>--%>
                                            <%--<span class="checkmark"></span>--%>
                                            <%--</label>--%>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_extent_unit" value="Square Metres"
                                                       required/>
                                                <span id="lblCropAddCropExtentUnitSquareMetres">Square Metres</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_extent_unit" value="Square Feet"/>
                                                <span id="lblCropAddCropExtentUnitSquareFeet">Square Feet</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_extent_unit" value="Perches"/>
                                                <span id="lblCropAddCropExtentUnitPerches">Perches</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_extent_unit" value="Acres"/>
                                                <span id="lblCropAddCropExtentUnitAcres">Acres</span>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropPlantedDate">Planted Date</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="date" placeholder="Planted Date"
                                               id="txtCropAddCropPlantedDate" value="" name="crop_planted_date"
                                               aria-label="CropPlantedDate"
                                               aria-describedby="txtCropAddCropPlantedDate" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <label class="switch switch-primary mr-3 pr-5">
                                        <span id="lblCropAddMoreDetails">More Details</span>
                                        <input type="checkbox" id="myCheckbox"
                                               onchange="toggleCheckCrop()">
                                        <span class="slider round"></span>
                                    </label>
                                </div>

                                <!--MoreDetails-->
                                <%--<div id="divCropAddMoreDetailsHolder" style="display:none">--%>

                                <%--<div class="col-md-4 form-group">--%>
                                <%--<div class="form-group">--%>
                                <%--<label id="lblCropAddNurseryGrown">Nursery Grown</label>--%>
                                <%--</div>--%>
                                <%--<div class="input-group">--%>
                                <%--<div class="input-group-prepend">--%>
                                <%--<span class="input-group-text">--%>
                                <%--<i class="i-Pen-3"></i>--%>
                                <%--</span>--%>
                                <%--</div>--%>
                                <%--<select class="form-control"--%>
                                <%--id="cmbCropAddNurseryGrown" name="nursery_grown"--%>
                                <%--aria-label="NurseryGrown"--%>
                                <%--aria-describedby="cmbCropAddNurseryGrown"--%>
                                <%--onchange="Show(this.value)"--%>
                                <%--required>--%>
                                <%--<option value="No">No</option>--%>
                                <%--<option value="Yes">Yes</option>--%>
                                <%--</select>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Nursery_Grown_Number">
                                    <div class="form-group">
                                        <label id="lblCropAddNurseryGrownNumber">Nursery Grown - Number</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="number"
                                               placeholder="Nursery Grown - Number"
                                               id="txtCropAddNurseryGrownNumber" value="0"
                                               name="crop_nursery_grown_number"
                                               aria-label="NurseryGrownNumber"
                                               aria-describedby="txtCropAddNurseryGrownNumber"
                                               min="0" max="99"/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Nursery_Grown_Measurement">
                                    <div class="form-group">
                                        <label id="lblCropAddNurseryGrownMeasurement">
                                            Nursery Grown - Measurement</label>
                                    </div>
                                    <div class="input-group mt-2 mb-3">
                                        <%--<div class="input-group-prepend">--%>
                                        <%--<span class="input-group-text">--%>
                                        <%--<i class="i-Pen-3"></i>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--<select class="form-control"--%>
                                        <%--id="cmbCropAddNurseryGrownMeasurement"--%>
                                        <%--name="crop_nursery_grown_unit"--%>
                                        <%--aria-label="NurseryGrownMeasurement"--%>
                                        <%--aria-describedby="cmbCropAddNurseryGrownMeasurement">--%>
                                        <%--<option value="Days" selected>Days</option>--%>
                                        <%--<option value="Weeks">Weeks</option>--%>
                                        <%--<option value="Months">Months</option>--%>
                                        <%--</select>--%>
                                        <div class="btn-group-vertical" role="group">
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_nursery_grown_unit" value="Days"/>
                                                <span id="lblCropAddCropNurseryGrownUnitDays">Days</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_nursery_grown_unit" value="Weeks"/>
                                                <span id="lblCropAddCropNurseryGrownUnitDaysWeeks">Weeks</span>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio radio-primary">
                                                <input type="radio" name="crop_nursery_grown_unit" value="Months"/>
                                                <span id="lblCropAddCropNurseryGrownUnitMonths">Months</span>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Crop_Photo">
                                    <div class="form-group">
                                        <label id="lblCropAddCropPhoto">Crop's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgCropAddCropPhoto"
                                                   type="file" name="crop_photo"
                                                   aria-describedby="imgCropAddCropPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblCropAddChoosePhoto"
                                                   for="lblCropAddCropPhoto">Choose photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                     style="display:none;" id="Selected_Crop_Photo">
                                    <div class="form-group">
                                        <label id="lblCropAddCropPhotoSelected">Selected Crop's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="crop_photo_selected" style="width:100%; height:auto;"
                                             aria-label="CropAddCropPhotoSelected"
                                             aria-describedby="imgAddCropPhotoSelected">
                                    </div>
                                </div>

                                <%--</div>--%>
                                <!--/MoreDetails-->

                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnCropAddAddNewCrop" class="btn btn-primary btn-block">Add New Crop
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
            if (request.getParameter("IsCropSaved") != null &&
                    request.getParameter("IsCropSaved").equals("false")) {
                //show alert
                Response = "IsCropSavedFalse";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsCropSavedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01Body" class="mt-4 mb-4">Crop saving failed.</p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError01Footer">Okay</span>
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
<script src="dist-assets/slick/slick.min.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $('.slider').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            prevArrow: '.arrow_prev',
            nextArrow: '.arrow_next'
        });
    });
</script>

<script>
    $('.slider-item').click(function(){
        $(this)
            .css('background-color','#e3ece1')
            .siblings()
            .css('background-color','#ffffff');
        console.log(this.id);
        $("#crop_type").val(this.id);
        $("#crop_type_h").val(this.id);
    });
</script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'IsCropSavedFalse':
                // alert("Success!");
                $('#ModalError01IsCropSavedFalse').modal('show');
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