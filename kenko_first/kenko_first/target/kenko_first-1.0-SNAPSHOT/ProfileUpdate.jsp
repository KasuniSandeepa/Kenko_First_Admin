<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="models.Profile" %>
<%@ page import="models.Profile" %>
<%@ page import="static services.HttpSession.PROFILE" %>

<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Profile Update - Kenko 1st Agri Business</title>
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
%>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblProfileUpdateProfileUpdate">Profile Update</h1>
            <ul class="ml-2">
                <li><a id="lblProfileUpdateBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><span id="lblProfileUpdateBreadCrumbsProfileUpdate">Profile Update</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="ProfileUpdateServlet" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="farmer_id"
                                           value="<%=Profile.getPkProfiles()%>" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateFirstName">First Name</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Business-ManWoman"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="First Name"
                                               id="txtProfileUpdateFirstName"
                                               value="<%=Profile.getName().split("_")[0]%>"
                                               name="farmer_first_name"
                                               aria-label="FirstName"
                                               aria-describedby="txtProfileUpdateFirstName"
                                               minlength="4" maxlength="30" required autofocus/>
                                    </div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateLastName">Last Name</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Business-ManWoman"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Last Name"
                                               id="txtProfileUpdateLastName"
                                               value="<%=Profile.getName().split("_")[1]%>"
                                               name="farmer_last_name"
                                               aria-label="LastName" aria-describedby="txtProfileUpdateLastName"
                                               minlength="4" maxlength="30" required/>
                                    </div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateMobileNumber">Mobile Number</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Mobile Number"
                                               id="txtProfileUpdateMobileNumber"
                                               value="<%=Profile.getMobileNumber()%>"
                                               name="farmer_mobile_number"
                                               aria-label="MobileNumber"
                                               aria-describedby="txtProfileUpdateMobileNumber"
                                               minlength="10" maxlength="10" required/>
                                    </div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateAddress">Address</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Address"
                                               id="txtProfileUpdateAddress"
                                               value="<%=Profile.getAddress()%>"
                                               name="farmer_address"
                                               aria-label="Address" aria-describedby="txtProfileUpdateAddress"
                                               minlength="10" maxlength="300" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateNIC">NIC</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="NIC"
                                               id="txtProfileUpdateNIC"
                                               value="<%=Profile.getNIC()%>"
                                               name="farmer_nic"
                                               aria-label="NIC" aria-describedby="txtProfileUpdateNIC"
                                               minlength="10" maxlength="12" required/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateDateOfBirth">Date Of Birth</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Pen-3"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Date Of Birth"
                                               id="txtProfileUpdateDateOfBirth"
                                               value="<%=Profile.getDateOfBirth()%>"
                                               name="farmer_dob"
                                               aria-label="DateOfBirth"
                                               aria-describedby="txtProfileUpdateDateOfBirth"
                                               minlength="10" maxlength="10" disabled/>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateGender">Gender</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Bisexual"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="text" placeholder="Gender"
                                               id="txtGender"
                                               value="<%=Profile.getGender()%>"
                                               name="farmer_gender"
                                               aria-label="Gender" aria-describedby="txtGender"
                                               minlength="4" maxlength="6" disabled/>
                                    </div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdatePassword">Password</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="password" placeholder="Password"
                                               id="txtProfileUpdatePassword"
                                               value="<%=Profile.getPassWord()%>"
                                               name="farmer_password"
                                               aria-label="Password"
                                               aria-describedby="txtProfileUpdatePassword"
                                               minlength="6" maxlength="16" required/>
                                        <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="i-Eye-Visible"></i>
                                                </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdatePasswordConfirm">Password Confirm</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Key"></i>
                                                </span>
                                        </div>
                                        <input class="form-control" type="password" placeholder="Password"
                                               id="txtProfileUpdatePasswordConfirm"
                                               value="<%=Profile.getPassWord()%>"
                                               name="farmer_password_confirm"
                                               aria-label="PasswordConfirm"
                                               aria-describedby="txtProfileUpdatePasswordConfirm"
                                               minlength="6" maxlength="16" required/>
                                        <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="i-Eye-Visible"></i>
                                                </span>
                                        </div>
                                    </div>
                                </div>
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

                                            <%-- <%
                                                 for (IdAndName Provinces : ProvincesListGet()) {
                                             %>

                                             <option value="<%=Provinces.getId()%>"><%=Provinces.getName()%>
                                             </option>

                                             <%
                                                 }
                                             %>

                                         --%>

                                            <option value="Select Province" disabled selected hidden>
                                                Select Province
                                            </option>
                                            <option value="Central">Central</option>
                                            <option value="Eastern">Eastern</option>
                                            <option value="Northern">Northern</option>
                                            <option value="North Central">North Central</option>
                                            <option value="North Western">North Western</option>
                                            <option value="Sabaragamuwa">Sabaragamuwa</option>
                                            <option value="Southern">Southern</option>
                                            <option value="Uva">Uva</option>
                                            <option value="Western">Western</option>

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
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateFarmerPhoto">Farmer's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="i-Camera"></i>
                                                </span>
                                        </div>
                                        <div class="custom-file">
                                            <input class="custom-file-input" id="imgProfileUpdateFarmerPhoto"
                                                   type="file" name="farmer_photo"
                                                   aria-describedby="imgProfileUpdateFarmerPhoto"
                                                   onchange="ReadUrl(this)"/>
                                            <label class="custom-file-label"
                                                   id="lblProfileUpdateProfileChoosePhoto"
                                                   for="lblProfileUpdateFarmerPhoto">Choose photo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblProfileUpdateFarmerPhotoSaved">Saved Farmer's Photo</label>
                                    </div>
                                    <div class="input-group">
                                        <img class="form-control" src="#" id="photo_preview"
                                             style="width:100%; height:auto;"
                                             aria-label="FarmerPhotoSaved"
                                             name="farmer_photo_selected"
                                             aria-describedby="imgProfileUpdateFarmerPhotoSaved">
                                    </div>
                                </div>
                                <!-- <div class="col-md-4 form-group">&nbsp;</div> -->
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button id="btnProfileUpdateUpdateProfile"
                                            class="btn btn-primary btn-block">Update Profile</button>
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
            if (request.getParameter("NicPresent") != null &&
                    request.getParameter("NicPresent").equals("true")) {
                //show alert
                Response = "NicPresentTrue";
            } else if (request.getParameter("NicValid") != null &&
                    request.getParameter("NicValid").equals("false")) {
                //show alert
                Response = "NicValidFalse";
            } else if (request.getParameter("IsProfileUpdated") != null &&
                    request.getParameter("IsProfileUpdated").equals("false")) {
                //show alert
                Response = "IsProfileUpdatedFalse";
            } else if (request.getParameter("IsProfileUpdated") != null &&
                    request.getParameter("IsProfileUpdated").equals("true")) {
                //show alert
                Response = "IsProfileUpdatedTrue";
            }
        %>

        <!--row-->
        <div class="row">

            <div class="col-md-12 mb-2">

                <!--modal-error-->
                <div class="modal fade" id="ModalError01NicPresentTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError01Title">Error!</h2>
                                    <p id="ModalError01Body" class="mt-4 mb-4">NIC number already present, try again.</p>
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
                <div class="modal fade" id="ModalError02NicValidFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError02Title">Error!</h2>
                                    <p id="ModalError02Body" class="mt-4 mb-4">Invalid NIC number, try again.</p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError02Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-error-->

                <!--modal-error-->
                <div class="modal fade" id="ModalError03IsProfileUpdatedFalse">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-danger display-3 i-Close"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalError03Title">Error!</h2>
                                    <p id="ModalError03Body" class="mt-4 mb-4">Profile update failed, try again.</p>
                                    <button class="btn btn-lg btn-danger" type="button" data-dismiss="modal">
                                        <span id="ModalError03Footer">Okay</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/modal-error-->

                <!--modal-success-->
                <div class="modal fade" id="ModalSuccess01IsProfileUpdatedTrue">
                    <div class="modal-dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content p-3">
                                <div class="modal-body align-items-center text-center">
                            <span class="text-center">
                                <i class="text-success display-3 i-Yes"></i>
                            </span>
                                    <h2 class="mt-3 mb-3" id="ModalSuccess02Title">Success!</h2>
                                    <p id="ModalSuccess02Body" class="mt-4 mb-4">Profile updated.</p>
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
<script src="dist-assets/js/custom/passwordShowHide.js"></script>
<script src="dist-assets/js/custom/switch_language.js"></script>

<script language="javascript">
    let ResponseValue = '<%=Response%>';
    window.onload = function () {
        console.log(ResponseValue);
        switch (ResponseValue) {
            case 'NicPresentTrue':
                // alert("Success!");
                $('#ModalError01NicPresentTrue').modal('show');
                break;
            case 'NicValidFalse':
                // alert("Info!");
                $('#ModalError02NicValidFalse').modal('show');
                break;
            case 'IsProfileUpdatedFalse':
                // alert("Warning!");
                $('#ModalError03IsProfileUpdatedFalse').modal('show');
                break;
            case 'IsProfileUpdatedTrue':
                // alert("Warning!");
                $('#ModalSuccess01IsProfileUpdatedTrue').modal('show');
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