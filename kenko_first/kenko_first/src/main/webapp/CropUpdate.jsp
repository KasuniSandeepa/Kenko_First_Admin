<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Crop" %>
<%@ page import="static services.HttpSession.PROFILE" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Crop Update - Kenko 1st Agri Business</title>
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

        int PkCrops = 0, PkLandDetails = 0;
        PkCrops = Integer.parseInt(request.getParameter("PkCrops"));
        PkLandDetails = Integer.parseInt(request.getParameter("PkLandDetails"));
        Crop Crop=models.Crop.CropGet(PkCrops);

%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblCropUpdateBreadCrumbsCropUpdateHeading">Crop Update</h1>
            <ul class="ml-2">
                <li><a id="lblCropUpdateBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><a id="lblCropUpdateBreadCrumbsLands" href="LandAll.jsp">Lands</a></li>
                <li><a id="lblCropUpdateBreadCrumbsLandDetails"
                       href="LandDetails.jsp?PkLandDetails=<%=PkLandDetails%>">Land Details</a></li>
                <li>
                    <a id="lblCropUpdateBreadCrumbsCropDetails"
                       href="CropDetails.jsp?PkCrops=<%=PkCrops%>&PkLandDetails=<%=PkLandDetails%>">
                        Crop Details
                    </a>
                </li>
                <li id="lblCropUpdateBreadCrumbsUpdate">Crop Update</li>
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

                            <!--land-crop-id-->
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="crop_id"
                                           value="<%=PkCrops%>" required>
                                    <input type="hidden" name="land_id"
                                           value="<%=PkLandDetails%>" required>
                                </div>
                            </div>
                            <!--/land-crop-id-->

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropType">Crop Type</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Dry"></i>
                                                </span>
                                        </div>
                                        <select class="form-control" placeholder="Crop Type"
                                                id="cmbCropUpdateCropType" value="" name="crop_type"
                                                aria-label="CropType" aria-describedby="cmbCropUpdateCropType"
                                                required>
                                            <option value="Carrot">Carrot</option>
                                            <option value="Leeks">Leeks</option>
                                            <option value="Beans">Beans</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCultivationExtentAmount">
                                            Cultivated Land Area - Number</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="number"
                                               placeholder="Planted Land Area - Number"
                                               id="txtCropUpdateCultivationExtentAmount"
                                               value="<%=Crop.get_CultivatedLandArea().split("_")[0]%>"
                                               name="cultivation_extent_amount"
                                               aria-label="CultivationExtentAmount"
                                               aria-describedby="txtCropUpdateCultivationExtentAmount"
                                               min="1" max="1000" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCultivationExtentMeasurement">
                                            Cultivated Land Area - Unit</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control" placeholder="Cultivation Extent Measurement"
                                                id="cmbCropUpdateCultivationExtentMeasurement" value=""
                                                name="cultivation_extent_measurement"
                                                aria-label="CultivationExtentMeasurement"
                                                aria-describedby="cmbCropUpdateCultivationExtentMeasurement"
                                                required>
                                            <option value="Plots">Plots</option>
                                            <option value="Square Metres">Square Metres</option>
                                            <option value="Square Feet">Square Feet</option>
                                            <option value="Perches">Perches</option>
                                            <option value="Acres">Acres</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateNurseryGrown">Nursery Grown</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <select class="form-control" placeholder="Nursery Grown"
                                                id="cmbCropUpdateNurseryGrown" value=""
                                                name="nursery_grown"
                                                aria-label="NurseryGrown" aria-describedby="cmbCropUpdateNurseryGrown"
                                                onchange="Show(this.value)"
                                                required>
                                            <option value="No">No</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div style="display:none" id="Nursery_Grown_Number">
                                        <div class="form-group">
                                            <label id="lblCropUpdateNurseryGrownNumber">Nursery Grown - Number</label>
                                        </div>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                            </div>
                                            <input class="form-control" type="number"
                                                   placeholder="Nursery Grown - Number"
                                                   id="txtCropUpdateNurseryGrownNumber" value="0"
                                                   name="nursery_grown_number"
                                                   aria-label="NurseryGrownNumber"
                                                   aria-describedby="txtCropUpdateNurseryGrownNumber"
                                                   min="0" max="99"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div style="display:none" id="Nursery_Grown_Measurement">
                                        <div class="form-group">
                                            <label id="lblCropUpdateNurseryGrownMeasurement">Nursery Grown -
                                                Measurement</label>
                                        </div>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                            </div>
                                            <select class="form-control" placeholder="Nursery Grown - Measurement"
                                                    id="cmbCropUpdateNurseryGrownMeasurement" value=""
                                                    name="nursery_grown_measurement"
                                                    aria-label="NurseryGrownMeasurement"
                                                    aria-describedby="cmbCropUpdateNurseryGrownMeasurement">
                                                <option value="Days" selected>Days</option>
                                                <option value="Weeks">Weeks</option>
                                                <option value="Months">Months</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropPlantedDate">Planted Date</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="date" placeholder="Planted Date"
                                               id="txtCropUpdateCropPlantedDate" value="" name="crop_planted_date"
                                               aria-label="CropPlantedDate"
                                               aria-describedby="txtCropUpdateCropPlantedDate"
                                               required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropPhoto">Crop's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgCropUpdateCropPhoto"
                                                   type="file"
                                                   aria-describedby="imgCropUpdateCropPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblCropUpdateChoosePhoto"
                                                   for="lblCropUpdateCropPhoto">Choose photo</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="col-md-4 form-group">&nbsp;</div> -->
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnCropUpdateUpdateCrop"
                                            class="btn btn-primary btn-block">Update Crop</button>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropUpdateCropPhotoSelected">Selected Crop's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             name="Crop_photo_selected" style="width:100%; height:auto;"
                                             aria-label="CropUpdateCropPhotoSelected" display="hide"
                                             aria-describedby="imgUpdateCropPhotoSelected">
                                    </div>
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
            if (request.getParameter("IsCropUpdated") != null &&
                    request.getParameter("IsCropUpdated").equals("true")) {
                //show alert
                Response = "IsCropUpdatedTrue";
            } else if (request.getParameter("IsCropUpdated") != null &&
                    request.getParameter("IsCropUpdated").equals("false")) {
                //show alert
                Response = "IsCropUpdatedFalse";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01IsCropUpdatedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01Body" class="mt-4 mb-4">Crop updating failed.</p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError01Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-error-->

                <!--modal-success-->
                <div class="modal fade" id="ModalSuccess01IsCropUpdatedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess02Title">Success!</h2>
                                    <p id="ModalSuccess02Body" class="mt-4 mb-4">Crop updated.</p>
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

        <!-- ============ Body content end ============= -->

        <!--Footer Start-->
        <%@include file="FooterKenkoFirst.jsp" %>
        <!--Footer end-->

    </div>
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
            case 'IsCropUpdatedFalse':
                // alert("Success!");
                $('#ModalError01IsCropUpdatedFalse').modal('show');
                break;
            case 'IsCropUpdatedTrue':
                // alert("Info!");
                $('#ModalSuccess01IsCropUpdatedTrue').modal('show');
                break;
            default:
                break;
        }
    }
</script>

<script>
    const language =  getLanguage();
    console.log(language)
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