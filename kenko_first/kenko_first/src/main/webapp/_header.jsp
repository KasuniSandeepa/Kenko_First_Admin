
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="../../dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="../../dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>

<%--<body class="text-left">--%>
<body>

<!-- =============== Left side start ================-->
<div class="app-admin-wrap layout-sidebar-large">
    <div class="main-header" style="background-color:#8eb388;">
        <div class="logo"><a href="#">
            <img class="logo" src="../../dist-assets/images/logo.png" alt="#">
        </a>
        </div>
        <div class="menu-toggle">
            <i class="i-Arrow-Down-2 text-muted header-icon" style="background-color:#e3ece1;"></i>
        </div>
        <div class="d-flex align-items-center">
            <div class="search-bar">
                <input type="text" placeholder="Search">
                <i class="search-icon text-muted i-Magnifi-Glass1"></i>
            </div>
        </div>
        <div style="margin: auto"></div>
        <div class="header-part-right">
            <!-- Full screen toggle -->
            <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen style="background-color:#e3ece1;"></i>
            <!-- Language -->
            <div class="dropdown">
                <div class="badge-top-container" role="button" id="dropdownLanguage" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false">
                    <i class="i-Bell text-muted header-icon" style="background-color:#e3ece1;"></i>
                </div>
                <!-- Notification dropdown -->
                <div class="dropdown-menu dropdown-menu-right notification-dropdown rtl-ps-none"
                     aria-labelledby="dropdownLanguage" data-perfect-scrollbar data-suppress-scroll-x="true">
                    <div class="dropdown-item d-flex">
                        <div class="notification-icon">
                            <i class="i-Speach-Bubble-6 text-primary mr-1"></i>
                        </div>
                        <div class="notification-details flex-grow-1">
                            <p class="m-0 d-flex align-items-center">
                                <span>New message</span>
                                <span class="badge badge-pill badge-primary ml-1 mr-1">new</span>
                                <span class="flex-grow-1"></span>
                                <span class="text-small text-muted ml-auto">10 sec ago</span>
                            </p>
                            <p class="text-small text-muted m-0">James: Hey! are you busy?</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Language end -->
            <!-- Notificaiton -->
            <div class="dropdown">
                <div class="badge-top-container" role="button" id="dropdownNotification" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false">
                    <span class="badge badge-primary">3</span>
                    <i class="i-Bell text-muted header-icon" style="background-color:#e3ece1;"></i>
                </div>
                <!-- Notification dropdown -->
                <div class="dropdown-menu dropdown-menu-right notification-dropdown rtl-ps-none"
                     aria-labelledby="dropdownNotification" data-perfect-scrollbar data-suppress-scroll-x="true">
                    <div class="dropdown-item d-flex">
                        <div class="notification-icon">
                            <i class="i-Speach-Bubble-6 text-primary mr-1"></i>
                        </div>
                        <div class="notification-details flex-grow-1">
                            <p class="m-0 d-flex align-items-center">
                                <span>New message</span>
                                <span class="badge badge-pill badge-primary ml-1 mr-1">new</span>
                                <span class="flex-grow-1"></span>
                                <span class="text-small text-muted ml-auto">10 sec ago</span>
                            </p>
                            <p class="text-small text-muted m-0">James: Hey! are you busy?</p>
                        </div>
                    </div>
                    <div class="dropdown-item d-flex">
                        <div class="notification-icon">
                            <i class="i-Receipt-3 text-success mr-1"></i>
                        </div>
                        <div class="notification-details flex-grow-1">
                            <p class="m-0 d-flex align-items-center">
                                <span>New order received</span>
                                <span class="badge badge-pill badge-success ml-1 mr-1">new</span>
                                <span class="flex-grow-1"></span>
                                <span class="text-small text-muted ml-auto">2 hours ago</span>
                            </p>
                            <p class="text-small text-muted m-0">1 Headphone, 3 iPhone x</p>
                        </div>
                    </div>
                    <div class="dropdown-item d-flex">
                        <div class="notification-icon">
                            <i class="i-Empty-Box text-danger mr-1"></i>
                        </div>
                        <div class="notification-details flex-grow-1">
                            <p class="m-0 d-flex align-items-center">
                                <span>Product out of stock</span>
                                <span class="badge badge-pill badge-danger ml-1 mr-1">3</span>
                                <span class="flex-grow-1"></span>
                                <span class="text-small text-muted ml-auto">10 hours ago</span>
                            </p>
                            <p class="text-small text-muted m-0">Headphone E67, R98, XL90, Q77</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Notificaiton End -->
            <!-- User avatar dropdown -->
            <div class="dropdown">
                <div class="user col align-self-end">
                    <img src="../../dist-assets/images/faces/1.jpg" id="userDropdown" alt=""
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <div class="dropdown-header">
                            <i class="i-Lock-User mr-1"></i> Timothy Carlson
                        </div>
                        <a class="dropdown-item" href="#">Account settings</a>
                        <a class="dropdown-item" href="#">Sign out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="side-content-wrap">
        <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
            <ul class="navigation-left" style="background-color: #e3ece1;">
                <li class="nav-item"><a class="nav-item-hold" href="_lands.jsp">
                    <i class="nav-icon i-Bar-Chart"></i><span class="nav-text">Lands</span></a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item"><a class="nav-item-hold" href="_crops.jsp">
                    <i class="nav-icon i-Library"></i><span class="nav-text">Crops</span></a>
                    <div class="triangle"></div>
                </li>
                <li class="nav-item"><a class="nav-item-hold" href="_history.jsp">
                    <i class="nav-icon i-Suitcase"></i><span class="nav-text">History</span></a>
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

<script src="../../dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="../../dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="../../dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="../../dist-assets/js/scripts/script.min.js"></script>
<script src="../../dist-assets/js/scripts/sidebar.large.script.min.js"></script>

</body>
</html>