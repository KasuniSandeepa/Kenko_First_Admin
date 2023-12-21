<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="models.Profile" %>
<%@ page import="services.Cookies" %>
<%@ page import="services.HttpSession" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
</head>

<%--<body class="text-left">--%>
<body>

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profile profileInHeader = (Profile) request.getSession().getAttribute("Profile");
        String Language = HttpSession.LANGUAGE_ENGLISH;
//        System.out.println("Language: " + Language);
%>

<!-- =============== Left side start ================-->

<div class="app-admin-wrap layout-sidebar-large">
    <div class="main-header" style="background-color:#8eb388;">
        <div class="logo">
            <a href="Profile.jsp">
                <img class="logo" src="dist-assets/images/logo.png" alt="#">
            </a>
        </div>

        <div>
            <a href="Profile.jsp">
                <i class="header-icon i-Home1 ml-1" style="background-color:#e3ece1;"></i>
            </a>
        </div>

        <%--<div class="menu-toggle">--%>
            <%--<span class="header-icon" style="background-color:#e3ece1;">--%>
                <%--<div></div>--%>
                <%--<div></div>--%>
                <%--<div></div>--%>
            <%--</span>--%>
        <%--</div>--%>

        <div class="menu-toggle">
        <i class="i-Align-Justify-All text-muted header-icon" style="background-color:#e3ece1;"></i>
        </div>

        <%--<div class="d-flex align-items-center">--%>
        <%--<div class="search-bar">--%>
        <%--<input type="text" placeholder="Search">--%>
        <%--<i class="search-icon text-muted i-Magnifi-Glass1"></i>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div style="margin: auto"></div>
        <div class="header-part-right">
            <!-- Full screen toggle -->
            <i class="i-Full-Screen header-icon d-none d-sm-inline-block"
               data-fullscreen style="background-color:#e3ece1;"></i>

            <div>
                <a href="#"
                   onclick="ToggleLanguageEnglish()">
                    <i class="header-icon"
                       style="background-color:#e3ece1;"><span class="small">E</span></i>
                </a>
            </div>

            <div>
                <a href="#"
                   onclick="ToggleLanguageSinhala(); convertLoop('Sinhala');" id="sinhalad">
                    <i class="header-icon"
                       style="background-color:#e3ece1;"><span class="small">සි</span></i>
                </a>
            </div>

            <div>
                <a href="#"
                   onclick="ToggleLanguageTamil(); convertLoop('Tamil');">
                    <i class="header-icon"
                       style="background-color:#e3ece1;"><span class="small">த</span></i>
                </a>
            </div>

            <%--<!-- Language Start -->--%>
            <%--<div class="dropdown">--%>
            <%--<div class="badge-top-container" role="button" id="dropdownNotification"--%>
            <%--data-toggle="dropdown"--%>
            <%--aria-haspopup="true" aria-expanded="false">--%>
            <%--<i class="i-Pen-5 text-muted header-icon" style="background-color:#e3ece1;"></i>--%>
            <%--</div>--%>
            <%--<!-- Language dropdown -->--%>
            <%--<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownNotification">--%>
            <%--<a class="dropdown-item" href="#"--%>
            <%--onclick="LanguageChange(<%=Language%>, window.Location.href)">--%>
            <%--<i class="i-Pen-5 mr-1"></i>English--%>
            <%--</a>--%>
            <%--<a class="dropdown-item" href="#"--%>
            <%--onclick="LanguageChange(<%=Language%>, window.Location.href)">--%>
            <%--<i class="i-Pen-5 mr-1"></i>සිංහල--%>
            <%--</a>--%>
            <%--<a class="dropdown-item" href="#"--%>
            <%--onclick="LanguageChange(<%=Language%>, window.Location.href)">--%>
            <%--<i class="i-Pen-5 mr-1"></i>தமிழ்--%>
            <%--</a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<!-- Language End -->--%>
            <!-- User avatar dropdown -->
            <div class="dropdown">
                <div class="user col align-self-end">

                    <%
                        if (profileInHeader.getPhotoUrl().contains("/")) {
                            //profile img
                    %>
                    <img src="<%=profileInHeader.getPhotoUrl()%>" id="userDropdown"
                         alt="<%=profileInHeader.getName()%>"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%--<img src="<%=Profile.getPhotoUrl()%>"--%>
                    <%--alt="<%=Profile.getName()%>"/>--%>
                    <%
                    } else {
                        if (profileInHeader.getGender().equals("Female")) {
                            //female img
                    %>
                    <img src="dist-assets/images/faces/4.jpg" id="userDropdown" alt="image_female"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%--<img src="dist-assets/images/faces/4.jpg" alt=""/>--%>
                    <%
                    } else if (profileInHeader.getGender().equals("Male")) {
                        //male img
                    %>

                    <img src="dist-assets/images/faces/2.jpg" id="userDropdown" alt="image_male"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%
                            }
                        }
                    %>

                    <%--<img src="dist-assets/images/faces/2.jpg" id="userDropdown" alt="image"--%>
                    <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="Profile.jsp">
                            <i class="i-Lock-User mr-1"></i><%=profileInHeader.getName().split("_")[0]%>
                        </a>
                        <a class="dropdown-item" href="ProfileUpdate.jsp">
                            <i class="i-Gear mr-1"></i>
                            <span id="lblHeaderAccountDetails">Details</span>
                        </a>
                        <a class="dropdown-item" href="SignOutServlet">
                            <i class="i-Power-2 mr-1"></i>
                            <span id="lblHeaderSignOut">Sign out</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="side-content-wrap">
        <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
            <ul class="navigation-left mainlist" style="background-color: #e3ece1;">
                <li class="nav-item">
                    <a class="nav-item-hold" href="LandAll.jsp">
                        <img class="nav-icon" src="dist-assets/images/custom/map.svg"
                             alt="Lands"/>
                        <span class="nav-text" id="lblHeaderLands">Lands</span>
                    </a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item">
                    <a class="nav-item-hold" href="CropAll.jsp">
                        <img class="nav-icon" src="dist-assets/images/custom/plant.svg"
                             alt="Crops"/>
                        <span class="nav-text" id="lblHeaderCrops">Crops</span>
                    </a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item">
                    <a class="nav-item-hold" href="#">
                        <img class="nav-icon" src="dist-assets/images/custom/crops.svg"
                             alt="History"/>
                        <span class="nav-text" id="lblHeaderHistory">History</span>
                    </a>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <div class="sidebar-overlay"></div>
    </div>

    <!-- =============== Left side End ================-->

    <%--<div class="main-content-wrap sidenav-open d-flex flex-column">--%>

    <%--<!--============ Body content start =============-->--%>
    <%--<!--============ Body content end =============-->--%>

    <%--<!--Footer Start-->--%>
    <%--<!--fotter end-->--%>

    <%--</div>--%>

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
    const lan = getLanguage();
    console.log(lan)
    if (lan == "Sinhala") {
        ToggleLanguageSinhala();
    }
    if (lan == "Tamil") {
        ToggleLanguageTamil();
    }
</script>

<%
    }
%>

</body>
</html>