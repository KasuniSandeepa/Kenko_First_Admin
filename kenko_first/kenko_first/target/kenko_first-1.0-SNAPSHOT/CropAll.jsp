<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Profile" %>
<%@ page import="models.LandAndCrop" %>
<%@ page import="java.util.List" %>
<%@ page import="static services.DatabaseCheck.StatusCountOfCropGet" %>
<%@ page import="static services.HttpSession.PROFILE" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>All Crops - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
</head>

<body class="text-left">

<%
    if (request.getSession().getAttribute(PROFILE) == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profile Profile = (Profile) request.getSession().getAttribute(PROFILE);

        int j = 0;
%>

<%@include file="CacheControl.jsp" %>

<!-- =============== Left side start ================-->
<%@include file="Header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">
        <div class="breadcrumb">
            <h1 id="lblCropAllBreadCrumbsCropsHeading">Crops</h1>
            <ul>
                <li><a id="lblCropAllBreadCrumbsProfile" href="Profile.jsp">Profile</a></li>
                <li><span id="lblCropAllBreadCrumbsCrops">Crops</span></li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <!--all-crops-->
        <div class="row">

            <div class="col-md-12 mb-4">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1">
                        <h4 id="lblCropAllAllCropsHeading" class="mb-3">All Crops</h4>
                    </div>
                    <a class="btn btn-dark mb-3 m-sm-0"
                       href="LandAdd.jsp" id="btnCropAllAddNewCrop">Add A New Crop</a>
                </div>
            </div>

            <%--<a class="btn btn-info mb-3 m-sm-0 btn-sm"--%>
            <%--href="LandAdd.jsp">Add A New Crop</a>--%>

            <%
                if (services.DatabaseCheck.CropCountOfProfilesGet(Profile
                        .getPkProfiles()) == 0) {
                    //show land reg
            %>

            <div class="col-md-12 mb-4">
                <div class="alert alert-card alert-warning text-center">
                    <span id="lblProfileNoLandsToShow">No crops to show</span>!&nbsp;
                    <a class="btn btn-warning" href="LandAdd.jsp"
                       id="btnCropAllAddNewCrop2">Add A New Crop</a>
                </div>
            </div>

            <%
            } else {
                //show current crops
            %>

            <!--crop-list-->
            <div class="col-md-12">

                <!--inner_row-->
                <div class="row">
                    <div class="col-lg-12">

                        <%
                            String PageIdParameter = request.getParameter("Page");
                            if (PageIdParameter == null) {
                                PageIdParameter = "1";
                            }
                            int PageId = Integer.parseInt(PageIdParameter);
                            int Total = 5;
                            if (PageId == 1) {
                            } else {
                                PageId = PageId - 1;
                                PageId = PageId * Total + 1;
                            }

                            List<LandAndCrop> LandAndCropList = services.DatabaseTableLists
                                    .LandsAndCropsOfProfilePaginatedGet(Profile
                                            .getPkProfiles(), PageId, Total);

                            int ResultSize = services.DatabaseCheck
                                    .CropCountOfProfilesGet(Profile.getPkProfiles());

                            int Pages = 0;
                            if ((ResultSize % Total) == 0) {
                                Pages = ResultSize / Total;
                            } else {
                                Pages = (ResultSize / Total) + 1;
                            }
                        %>

                        <%
                            for (LandAndCrop LandAndCrop : LandAndCropList) {
                        %>

                        <div class="card mb-4" style="background-color:#f1f6f0;">
                            <div class="card-body p-2">

                                <!--widget-->
                                <div class="ul-widget5 m-0 p-0">

                                    <!--widget_item-->
                                    <div class="ul-widget5__item m-0 p-0">

                                        <div class="ul-widget-s5__content m-0 p-0">
                                            <div>

                                                <%
                                                    if (LandAndCrop.get_CropName().equalsIgnoreCase("Carrot")) {
                                                %>
                                                <img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"
                                                     src="dist-assets/images/crops/carrot.png" alt="Carrot"/>
                                                <%
                                                } else if (LandAndCrop.get_CropName().equalsIgnoreCase("Leeks")) {
                                                %>
                                                <img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"
                                                     src="dist-assets/images/crops/leaks.png" alt="Leaks"/>
                                                <%
                                                } else if (LandAndCrop.get_CropName().equalsIgnoreCase("Beans")) {
                                                %>
                                                <img class="avatar-lg mb-3 mb-sm-0 rounded mr-sm-3"
                                                     src="dist-assets/images/crops/peas.png" alt="Beans"/>
                                                <%
                                                    }
                                                %>

                                            </div>
                                            <div class="ul-widget-s5__section text-left">
                                                <h5 class="lead m-1">
                                                    <a href="CropDetails.jsp?PkCrops=<%=LandAndCrop.get_CropId()%>&PkLandDetails=<%=LandAndCrop.get_LandId()%>">
                                                        <strong><%=LandAndCrop.get_CropName()%>
                                                        </strong>
                                                    </a>
                                                </h5>
                                                <p class="text-small text-muted m-1">
                                                    <a href="LandDetails.jsp?PkLandDetails=<%=LandAndCrop.get_LandId()%>">
                                                        <%=LandAndCrop.get_LandName()%>
                                                    </a></p>
                                                <p class="text-small text-danger m-1">
                                                    <%=StatusCountOfCropGet(LandAndCrop.get_CropId())%>
                                                    &nbsp;<span>statuses</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a class="btn btn-primary mt-2 mb-1 btn-block"
                                               id="lblCropAllAddANewStatusCrop"
                                               name="lblCropAllAddANewStatusName"
                                               href="StatusAdd.jsp?PkCrops=<%=LandAndCrop.get_CropId()%>&PkLandDetails=<%=LandAndCrop.get_LandId()%>&PkProfiles=<%=Profile.getPkProfiles()%>">
                                                Add A New Status
                                            </a>
                                            <a class="btn btn-outline-secondary mr-1 mb-1 btn-block"
                                               id="lblCropAllUpdateCrop"
                                               name="lblCropAllUpdateCropName"
                                               href="CropUpdate.jsp?PkCrops=<%=LandAndCrop.get_CropId()%>&PkLandDetails=<%=LandAndCrop.get_LandId()%>">
                                                Update Crop
                                            </a>
                                            <a class="btn btn-outline-success mt-2 mb-1 btn-block"
                                               id="lblCropAllAllStatus"
                                               name="lblCropAllAllStatusName"
                                               href="CropDetails.jsp?PkCrops=<%=LandAndCrop.get_CropId()%>&PkLandDetails=<%=LandAndCrop.get_LandId()%>">
                                                All Statuses
                                            </a>
                                        </div>
                                    </div>
                                    <!--/widget_item-->

                                </div>
                                <!--/widget-->

                            </div>
                        </div>

                        <%
                                j++;
                            }
                        %>

                    </div>
                </div>
                <!--/inner_row-->

                <%
                    if (Pages > 1) {
                %>

                <!--inner_row-->
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#">Pages</a></li>

                            <%
                                //--to show number of pages
                                for (int i = 0; i < Pages; i++) {
                            %>

                            <li class="page-item">
                                <a class="page-link" href="CropAll.jsp?Page=<%=(i+1)%>"><%=(i + 1)%>
                                </a>
                            </li>

                            <%
                                }
                            %>

                        </ul>
                    </div>
                </div>
                <!--/inner_row-->

                <%
                    }
                %>

            </div>
            <!--/crop-list-->

            <%
                }
            %>

        </div>
        <!--/all-crops-->

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
<script src="dist-assets/js/custom/switch_language.js"></script>
<script>
    const language = getLanguage();

    if (language == "Sinhala") {
        ToggleLanguageSinhala();
        convertLoop("Sinhala");
    }
    if (language == "Tamil") {
        ToggleLanguageTamil();
        convertLoop("Tamil");
    }

    function convertLoop(language) {
        var value = "<%=j%>";
        var update_crop = document.getElementsByName("lblCropAllUpdateCropName");
        var all_progresses = document.getElementsByName("lblCropAllAllStatusName");
        var add_new_progress = document.getElementsByName("lblCropAllAddANewStatusName");

        switch (language) {

            case "Sinhala":
                for (var x = 0; x < value; x++) {
                    update_crop[x].innerHTML = "බෝග යාවත්කාලීන කරන්න";
                    all_progresses[x].innerHTML = "සියලු ප්‍රගතිය";
                    add_new_progress[x].innerHTML = "නව ප්‍රගතියක් එක් කරන්න";
                }
                break;
            case "Tamil":
                for (var x = 0; x < value; x++) {
                    update_crop[x].innerHTML = "பயிர் புதுப்பிக்கவும்";
                    all_progresses[x].innerHTML = "அனைத்து முன்னேறும்";
                    add_new_progress[x].innerHTML = "புதிய முன்னேற்றத்தைச் சேர்க்கவும்";
                }
                break;
            default:
            // code block
        }
    }
</script>

<%
    }
%>

</body>
</html>