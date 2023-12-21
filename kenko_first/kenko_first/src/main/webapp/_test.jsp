<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Profile" %>
<%@ page import="models.LandImage" %>
<%@ page import="java.util.List" %>
<%@ page import="static services.DatabaseCheck.CropCountOfLandGet" %>
<%@ page import="static services.DatabaseCheck.LandCountOfProfilesGet" %>
<%@ page import="static services.DatabaseCheck.CropCountOfProfilesGet" %>
<%@ page import="static services.DatabaseCheck.*" %>
<%@ page import="utils.DateDifference" %>
<%@ page import="static services.HttpSession.PROFILE" %>
<%@ page import="utils.Strings" %>

<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title></title>
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
        Profile Profile = (Profile) request.getSession().getAttribute(PROFILE);
        Profile.ProfilesDetailsGet(Profile);

        String DateRegistered = ProfileRegisteredDateGet(Profile.getPkProfiles());
        String DateDifference = new DateDifference().DateDifferenceGet(DateRegistered);
        String Days = DateDifference.split("_")[1].split("-")[0];

        int j = 0;
%>

<!-- =============== Left side start ================-->
<%@include file="_header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content" style="min-height:500px;">

        <!-- start of main-content -->

        <!-- overview -->
        <div class="row">

            <!-- left-side-->
            <div class="col-lg-8 col-md-12">

                <!-- summary -->
                <div class="row">
                    <!-- ICON BG-->
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon-bg bg-success text-white o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Landscape1 text-white"></i>
                                <div class="content">
                                    <p class="text-24 line-height-1 mb-1">
                                        <%=LandCountOfProfilesGet(Profile.getPkProfiles())%>
                                    </p>
                                    <p id="pProfileLands" class="mt-2 mb-0">Lands</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon-bg bg-success text-white o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Dry text-white"></i>
                                <div class="content">
                                    <p class="text-24 line-height-1 mb-1">
                                        <%=CropCountOfProfilesGet(Profile.getPkProfiles())%>
                                    </p>
                                    <p id="pProfileCrops" class="mt-2 mb-0">Crops</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon-bg bg-success text-white o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Calendar text-white"></i>
                                <div class="content">
                                    <p class="text-24 line-height-1 mb-1">
                                        <%=Days%>
                                    </p>
                                    <p id="pProfileDays" class="mt-2 mb-0">Days</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /summary -->

                <!--all-crops-->
                <div class="row">

                    <div class="col-md-12 mb-4">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h4 class="mb-3" id="lblProfileAllLands">All Lands</h4>
                            </div>
                            <a class="btn btn-info mb-3 m-sm-0 btn-sm"
                               href="LandAdd.jsp" id="lblProfileAddANewLand">Add A New Land</a>
                        </div>
                    </div>

                    <!--land-list-->
                    <%
                        if (services.DatabaseCheck.LandCountOfProfilesGet(Profile
                                .getPkProfiles()) == 0) {
                            //show land reg
                    %>

                    <div class="col-md-12 mb-4">
                        <div class="alert alert-card alert-warning text-center">
                            <span id="lblProfileNoLandsToShow">No lands to show</span>!&nbsp;
                            <a class="btn btn-warning" href="LandAdd.jsp"
                               id="lblProfileAddANewLand2">Add A New Land</a>
                        </div>
                    </div>

                    <%
                    } else {
                        //show current status
                    %>

                    <!--status-list-->
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

                                    List<LandImage> LandList = services.DatabaseTableLists
                                            .LandsOfProfilePaginatedGet(Profile.getPkProfiles(), PageId, Total);

                                    int ResultSize = services.DatabaseCheck
                                            .LandCountOfProfilesGet(Profile.getPkProfiles());

                                    int Pages = 0;
                                    if ((ResultSize % Total) == 0) {
                                        Pages = ResultSize / Total;
                                    } else {
                                        Pages = (ResultSize / Total) + 1;
                                    }

                                    for (LandImage LandImage : LandList) {
                                %>

                                <div class="card mb-4" style="background-color:#f1f6f0;">
                                    <div class="card-body p-2">

                                        <!--widget-->
                                        <div class="ul-widget5 m-0 p-0">

                                            <!--widget_item-->
                                            <div class="ul-widget5__item m-0 p-0">

                                                <div class="ul-widget-s5__content m-0 p-0">
                                                    <div>
                                                        <img class="avatar-lg mb-sm-0 rounded mr-sm-3" id="userDropdown" src="../../dist-assets/images/products/headphone-4.jpg" alt="#"/>
                                                    </div>
                                                    <div class="ul-widget-s5__section text-left">
                                                        <h5 class="lead m-1 pl-1">
                                                            <a href=""><strong><%=LandImage.get_LandName()%></strong></a>
                                                        </h5>
                                                        <p class="m-1 pl-1 text-small text-muted">
                                                            <%=LandImage.get_Address()%>
                                                        </p>
                                                        <p class="text-small text-danger m-1 pl-1">
                                                            <%=CropCountOfLandGet(LandImage.get_Id())%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="ul-widget-s5__content m-0 p-0">
                                                    <a class="btn btn-outline-success mt-3 mr-1 mb-1 ml-1 btn-block"
                                                    href="LandUpdate.jsp?PkLandDetails=<%=LandImage.get_Id()%>">
                                                        Update Land
                                                    </a>
                                                    <a class="btn btn-outline-primary mt-3 mr-1 mb-1 ml-1 btn-block"
                                                    href="LandDetails.jsp?PkLandDetails=<%=LandImage.get_Id()%>">
                                                        All Crops
                                                    </a>
                                                    <a class="btn btn-outline-secondary mt-3 mr-1 mb-1 ml-1 btn-block"
                                                    href="CropAdd.jsp?PkLandDetails=<%=LandImage.get_Id()%>">
                                                        Add A New Crop
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
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#">Pages</a></li>

                                    <%
                                        //--to show number of pages
                                        for (int i = 0; i < Pages; i++) {
                                    %>

                                    <li class="page-item">
                                        <a class="page-link" href="Profile.jsp?page=<%=(i+1)%>">
                                            <%=(i + 1)%>
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
                    <!--/status-list-->

                    <%
                        }
                    %>

                </div>
                <!--/all-crops-->

            </div>
            <!-- /left-side-->

            <!-- right-side-->
            <div class="col-lg-4 col-md-12">

                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-profile-1 mb-4">
                            <div class="card-body text-center">
                                <h2 id="lblProfileProfile" class="mb-3">Profile</h2>
                                <div class="avatar box-shadow-2 mb-3">

                                    <%
                                        if (Profile.getPhotoUrl().contains("/")) {
                                            //profile img
                                    %>
                                    <img src="<%=Profile.getPhotoUrl()%>"
                                         alt="ProfileImage"/>
                                    <%
                                    } else {
                                        if (Profile.getGender().equalsIgnoreCase("Female")) {
                                            //female img
                                    %>
                                    <img src="dist-assets/images/faces/4.jpg" alt="Female"/>
                                    <%
                                    } else if (Profile.getGender().equalsIgnoreCase("Male")) {
                                        //male img
                                    %>
                                    <img src="dist-assets/images/faces/2.jpg" alt="Male"/>
                                    <%
                                            }
                                        }
                                    %>

                                    <%--<img src="dist-assets/images/faces/2.jpg" alt="Male"/></div>--%>

                                </div>
                                <h5 class="m-0">
                                    <%=Strings.UnderscoresReplace(Profile.getName())%>
                                </h5>
                                <p class="mt-0 text-muted"><%=Profile.getMobileNumber()%>
                                </p>
                                <p><%=Profile.getAddress()%>
                                </p>
                                <div class="card-socials-simple mt-4">
                                    <a class="btn btn-large btn-success btn-block"
                                       id="lblProfileUpdateProfile"
                                       href="ProfileUpdate.jsp">Update Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /right-side-->

        </div>
        <!-- /overview -->

    </div>

    <!-- end of main-content -->

    <!-- ============ Body content end ============= -->

    <!--Footer Start-->
    <%@include file="_footer.jsp" %>
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
    const language =  getLanguage();
    console.log(language)
    if(language=="Sinhala"){
        ToggleLanguageSinhala();
        convertLoop("Sinhala");
    }

    if(language=="Tamil"){
        ToggleLanguageTamil();
        convertLoop("Tamil");
    }

    function convertLoop(language){
        var value = "<%=j%>";
        var add_a_new_crop = document.getElementsByName("lblProfileAddNewCropName");
        var all_crops = document.getElementsByName("lblProfileAllCropsName");
        var update_land = document.getElementsByName("lblProfileUpdateLandName");

        switch(language) {
            case "Sinhala":
                for(var x = 0; x < value ; x++){
                    add_a_new_crop[x].innerHTML = "නව බෝගයක් එක් කරන්න";
                    all_crops[x].innerHTML = "සියලුම භෝග";
                    update_land[x].innerHTML = "ඉඩම යාවත්කාලීන කරන්න";
                }
                break;
            case "Tamil":
                for(var x = 0; x < value ; x++){
                    add_a_new_crop[x].innerHTML = "புதிய பயிர் சேர்க்கவும்";
                    all_crops[x].innerHTML = "அனைத்து பயிர்களும்";
                    update_land[x].innerHTML = "நிலத்தை புதுப்பிக்கவும்";
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