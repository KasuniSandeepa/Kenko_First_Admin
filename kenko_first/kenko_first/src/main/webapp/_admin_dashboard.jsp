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
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Admin Dashboard - Kenko 1st Agri Business</title>
    <link rel="shortcut icon" type="image/png" href="dist-assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/metisMenu.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css" />




</head>

<body class="text-left">

<%@include file="CacheControl.jsp" %>

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
<%@include file="_admin_header.jsp" %>
<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content pt-4">
        <div class="breadcrumb">
            <h1 class="mr-2">Administrator</h1>
            <ul>
                <li><a href="">Dashboard</a></li>
              <%--  <li>Version 4</li>--%>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>
        <div class="row mb-4">
            <div class="col-md-3 col-lg-3">
                <div class="card mb-4 o-hidden">
                    <div class="card-body ul-card__widget-chart">
                        <div class="ul-widget__chart-info">
                            <h5 class="heading">TOTAL REGISTERED FARMERS</h5>
                            <div class="ul-widget__chart-number">
                                <h2 class="t-font-boldest">1000</h2><small class="text-muted">46% compared to last year</small>
                            </div>
                        </div>
                        <div id="basicArea-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3">
                <div class="card mb-4 o-hidden">
                    <div class="card-body ul-card__widget-chart">
                        <div class="ul-widget__chart-info">
                            <h5 class="heading">TOTAL REGISTERED LANDS</h5>
                            <div class="ul-widget__chart-number">
                                <h2 class="t-font-boldest">500</h2><small class="text-muted">46% compared to last year</small>
                            </div>
                        </div>
                        <div id="basicArea-chart2"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3">
                <div class="card mb-4 o-hidden">
                    <div class="card-body ul-card__widget-chart">
                        <div class="ul-widget__chart-info">
                            <h5 class="heading">TOTAL VEGETABLES</h5>
                            <div class="ul-widget__chart-number">
                                <h2 class="t-font-boldest">44,909</h2><small class="text-muted">46% compared to last year</small>
                            </div>
                        </div>
                        <div id="basicArea-chart3"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3">
                <div class="card mb-4 o-hidden">
                    <div class="card-body ul-card__widget-chart">
                        <div class="ul-widget__chart-info">
                            <h5 class="heading">TOTAL CROPS</h5>
                            <div class="ul-widget__chart-number">
                                <h2 class="t-font-boldest">500</h2><small class="text-muted">46% compared to last year</small>
                            </div>
                        </div>
                        <div id="basicArea-chart4"></div>
                    </div>
                </div>
            </div>
            <!-- finance-->
         <%--   <div class="col-md-12 col-lg-8 mt-4">
                <div class="card o-hidden h-100">
                    <div class="card-header bg-transparent">
                        <div class="row" style="align-items: center;">
                            <div class="col-md-6">
                                <div class="ul-card-widget__head-label">
                                    <h5 class="text-18 font-weight-700 card-title">Finance Summary</h5>
                                </div>
                            </div>
                            <div class="text-right col-md-6">
                                <button class="btn btn-outline-primary" type="button">Summary View</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h3 class="text-muted text-14 font-weight-500">Final Commission Revenue</h3><span class="text-muted text-18 font-weight-600">$790,420</span>
                            </div>
                            <div class="col-md-6">
                                <h3 class="text-muted text-14 font-weight-500">Final Commission Revenue</h3><span class="text-muted text-18 font-weight-600">July 25,2019</span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div id="spark2"></div>
                    </div>
                </div>
            </div>--%>
           <%-- <div class="col-lg-4 col-md-12 mt-4">
                <div class="card mb-4 h-100">
                    <div class="card-body">
                        <div class="card-title">Sales by Countries</div>
                        <div id="stackedPie" style="height: 250px;"></div>
                    </div>
                </div>
            </div>--%>
            <!-- table-->
           <%-- <div class="col-lg-8 col-xl-8 mt-4">
                <div class="card">
                    <div class="card-body">--%>
                        <div class="col-md-12 mb-4">
                            <div class="card text-left">

                                <div class="card-body w-80 ml-auto mr-auto">

                                    <div class="ul-widget__head v-margin">
                                        <div class="ul-widget__head-label">
                                            <h3 class="ul-widget__head-title">User Table</h3>
                                        </div>
                                        <button class="btn bg-white _r_btn border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="_dot _inline-dot bg-primary"></span><span class="_dot _inline-dot bg-primary"></span><span class="_dot _inline-dot bg-primary"></span></button>
                                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 33px, 0px); top: 0px; left: 0px; will-change: transform;"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Separated link</a>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="table-responsive">
                                        <table class="display nowrap table table-striped table-bordered" id="scroll_horizontal_vertical_table" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>First name</th>
                                                <th>Last name</th>
                                                <th>Position</th>
                                                <th>Office</th>
                                                <th>Age</th>
                                                <th>Start date</th>
                                                <th>Salary</th>
                                                <th>Extn.</th>
                                                <th>E-mail</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>Tiger</td>
                                                <td>Nixon</td>
                                                <td>System Architect</td>
                                                <td>Edinburgh</td>
                                                <td>61</td>
                                                <td>2011/04/25</td>
                                                <td>$320,800</td>
                                                <td>5421</td>
                                                <td>t.nixon@datatables.net</td>
                                            </tr>
                                            <tr>
                                                <td>Garrett</td>
                                                <td>Winters</td>
                                                <td>Accountant</td>
                                                <td>Tokyo</td>
                                                <td>63</td>
                                                <td>2011/07/25</td>
                                                <td>$170,750</td>
                                                <td>8422</td>
                                                <td>g.winters@datatables.net</td>
                                            </tr>
                                            <tr>
                                                <td>Ashton</td>
                                                <td>Cox</td>
                                                <td>Junior Technical Author</td>
                                                <td>San Francisco</td>
                                                <td>66</td>
                                                <td>2009/01/12</td>
                                                <td>$86,000</td>
                                                <td>1562</td>
                                                <td>a.cox@datatables.net</td>
                                            </tr>
                                            <tr>
                                                <td>Cedric</td>
                                                <td>Kelly</td>
                                                <td>Senior Javascript Developer</td>
                                                <td>Edinburgh</td>
                                                <td>22</td>
                                                <td>2012/03/29</td>
                                                <td>$433,060</td>
                                                <td>6224</td>
                                                <td>c.kelly@datatables.net</td>
                                            </tr>
                                            <tr>
                                                <td>Airi</td>
                                                <td>Satou</td>
                                                <td>Accountant</td>
                                                <td>Tokyo</td>
                                                <td>33</td>
                                                <td>2008/11/28</td>
                                                <td>$162,700</td>
                                                <td>5407</td>
                                                <td>a.satou@datatables.net</td>
                                            </tr>




                                            <tr>
                                                <td>Haley</td>
                                                <td>Kennedy</td>
                                                <td>Senior Marketing Designer</td>
                                                <td>London</td>
                                                <td>43</td>
                                                <td>2012/12/18</td>
                                                <td>$313,500</td>
                                                <td>3597</td>
                                                <td>h.kennedy@datatables.net</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                   <%-- </div>
                </div>
            </div>--%>
     <%--       <div class="col-lg-4 col-md-6 col-xl-4 mt-4">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="ul-widget__head">
                            <div class="ul-widget__head-label">
                                <h3 class="ul-widget__head-title">Users</h3>
                            </div>
                            <div class="ul-widget__head-toolbar">
                                <ul class="nav nav-tabs nav-tabs-line nav-tabs-bold ul-widget-nav-tabs-line" role="tablist">
                                    <li class="nav-item"><a class="nav-link active show" data-toggle="tab" href="#__g-widget4-tab1-content" role="tab" aria-selected="true">Today</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#__g-widget4-tab2-content" role="tab" aria-selected="false">Month</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="ul-widget__body">
                            <div class="tab-content">
                                <div class="tab-pane active show" id="__g-widget4-tab1-content">
                                    <div class="ul-widget1">
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/1.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-danger m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/2.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-success m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/3.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-warning m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/2.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-success m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/5.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-info m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="__g-widget4-tab2-content">
                                    <div class="ul-widget1">
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/2.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-danger m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/1.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-success m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/3.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-warning m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                        <div class="ul-widget4__item ul-widget4__users">
                                            <div class="ul-widget4__img"><img id="userDropdown" src="../../dist-assets/images/faces/4.jpg" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" /></div>
                                            <div class="ul-widget2__info ul-widget4__users-info"><a class="ul-widget2__title" href="#">Anna Strong</a><span class="ul-widget2__username" href="#">Visual Designer,Google Inc</span></div>
                                            <div class="ul-widget4__actions">
                                                <button class="btn btn-outline-info m-1" type="button">Follow</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <!-- mask-form-->
            <%--<div class="mt-4 col-md-6">
                <div class="card bg-defualt text-black">
                    <!-- -->
                    <!-- -->
                    <div class="card-body">
                        <!-- -->
                        <!-- -->
                        <div class="d-flex align-items-center mb-4"><i class="i-ID-Card text-22 mr-2"></i>
                            <h5 class="text-18 font-weight-700 card-title m-0">Card Information</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p class="font-weight-400 mb-2">CPF</p>
                                <input class="form-control" type="text" placeholder="999.999.999-99" />
                            </div>
                            <div class="mb-3 col-md-6">
                                <p class="font-weight-400 mb-2">Zip Code</p>
                                <input class="form-control" type="text" placeholder="99999-999" />
                            </div>
                            <div class="mb-3 col-md-6">
                                <p class="font-weight-400 mb-2">Phone</p>
                                <input class="form-control" type="text" placeholder="+9 (999) 999-9999" />
                            </div>
                            <div class="mb-3 col-md-6">
                                <p class="font-weight-400 mb-2">Master Card</p>
                                <input class="form-control" type="text" placeholder="9999 9999 9999 9999" />
                            </div>
                            <div class="mb-3 col-md-6">
                                <p class="font-weight-400 mb-2">Date</p>
                                <input class="form-control" type="text" placeholder="mm/dd/yy" />
                            </div>
                            <div class="mb-3 col-md-6">
                                <p class="font-weight-400 mb-2">CPF/CNPJ</p>
                                <input class="form-control" type="text" placeholder="99.999.999/9999-99" />
                            </div>
                        </div>
                        <button class="btn float-right btn-danger" type="button">Submit</button>
                    </div>
                    <!-- -->
                    <!-- -->
                </div>
            </div>--%>
            <!-- sales-status-->
         <%--   <div class="col-lg-6 col-xl-6 mt-4">
                <div class="card">
                    <div class="card-body">
                        <div class="ul-widget__head __g-support v-margin">
                            <div class="ul-widget__head-label">
                                <h3 class="ul-widget__head-title">Sales Stats</h3>
                            </div>
                            <button class="btn bg-white _r_btn border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="_dot _inline-dot bg-primary"></span><span class="_dot _inline-dot bg-primary"></span><span class="_dot _inline-dot bg-primary"></span></button>
                            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 33px, 0px); top: 0px; left: 0px; will-change: transform;"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                        <div class="ul-widget__body">
                            <div class="ul-widget-s7">
                                <div class="ul-widget-s7__items"><span class="ul-widget-s7__item-time">10:00</span>
                                    <div class="ul-widget-s7__item-circle">
                                        <p class="badge-dot-warning ul-widget7__big-dot"></p>
                                    </div>
                                    <div class="ul-widget-s7__item-text">
                                        Lorem ipsum dolor sit amit,consectetur eiusmdd
                                        tempor<br /> incididunt ut labore et dolore magna
                                    </div>
                                </div>
                            </div>
                            <div class="ul-widget-s7">
                                <div class="ul-widget-s7__items"><span class="ul-widget-s7__item-time">16:00 </span>
                                    <div class="ul-widget-s7__item-circle">
                                        <p class="badge-dot-danger ul-widget7__big-dot"></p>
                                    </div>
                                    <div class="ul-widget-s7__item-text">
                                        Lorem ipsum dolor sit amit,consectetur eiusmdd
                                        tempor<br /> incididunt ut labore et dolore magna elit enim at
                                        minim<br /> veniam quis nostrud
                                    </div>
                                </div>
                            </div>
                            <div class="ul-widget-s7">
                                <div class="ul-widget-s7__items"><span class="ul-widget-s7__item-time">13:00</span>
                                    <div class="ul-widget-s7__item-circle">
                                        <p class="badge-dot-primary ul-widget7__big-dot"></p>
                                    </div>
                                    <div class="ul-widget-s7__item-text">
                                        Lorem ipsum dolor sit amit,consectetur eiusmdd
                                        tempor<br /> incididunt ut labore et dolore magna
                                    </div>
                                </div>
                            </div>
                            <div class="ul-widget-s7">
                                <div class="ul-widget-s7__items"><span class="ul-widget-s7__item-time">08:00</span>
                                    <div class="ul-widget-s7__item-circle">
                                        <p class="badge-dot-success ul-widget7__big-dot"></p>
                                    </div>
                                    <div class="ul-widget-s7__item-text">
                                        Lorem ipsum dolor sit amit,consectetur eiusmdd
                                        tempor<br /> incididunt ut labore et dolore magna
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card o-hidden mb-4">
                    <div class="card-header d-flex align-items-center">
                        <h3 class="w-50 float-left card-title m-0">Lands</h3>
                        <div class="dropdown dropleft text-right w-50 float-right">
                            <button class="btn bg-gray-100" id="dropdownMenuButton_table1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="nav-icon i-Gear-2"></i></button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton_table1"><a class="dropdown-item" href="#">Add new user</a><a class="dropdown-item" href="#">View All users</a><a class="dropdown-item" href="#">Something else here</a></div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered text-center">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Land Type</th>
                                    <th scope="col">Land Extent</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Smith Doe</td>
                                    <td><img class="rounded-circle m-0 avatar-sm-table" src="../../dist-assets/images/faces/1.jpg" alt="" /></td>
                                    <td>Smith@gmail.com</td>
                                    <td><span class="badge badge-success">Active</span></td>
                                    <td><a class="text-success mr-2" href="#"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a><a class="text-danger mr-2" href="#"><i class="nav-icon i-Close-Window font-weight-bold"></i></a></td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jhon Doe</td>
                                    <td><img class="rounded-circle m-0 avatar-sm-table" src="../../dist-assets/images/faces/1.jpg" alt="" /></td>
                                    <td>Jhon@gmail.com</td>
                                    <td><span class="badge badge-info">Pending</span></td>
                                    <td><a class="text-success mr-2" href="#"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a><a class="text-danger mr-2" href="#"><i class="nav-icon i-Close-Window font-weight-bold"></i></a></td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Alex</td>
                                    <td><img class="rounded-circle m-0 avatar-sm-table" src="../../dist-assets/images/faces/1.jpg" alt="" /></td>
                                    <td>Otto@gmail.com</td>
                                    <td><span class="badge badge-warning">Not Active</span></td>
                                    <td><a class="text-success mr-2" href="#"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a><a class="text-danger mr-2" href="#"><i class="nav-icon i-Close-Window font-weight-bold"></i></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of col-->
            <div class="col-md-6">
                <div class="card o-hidden mb-4">
                    <div class="card-header d-flex align-items-center">
                        <h3 class="w-50 float-left card-title m-0">Crops</h3>
                        <div class="dropdown dropleft text-right w-50 float-right">
                            <button class="btn bg-gray-100" id="dropdownMenuButton_table2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="nav-icon i-Gear-2"></i></button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton_table2"><a class="dropdown-item" href="#">Add new user</a><a class="dropdown-item" href="#">View All users</a><a class="dropdown-item" href="#">Something else here</a></div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table text-center">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Cultivated Land Area</th>
                                    <th scope="col">Planted Date</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Watch</td>
                                    <td>12-10-2019</td>
                                    <td>$30</td>
                                    <td><span class="badge badge-success">Delivered</span></td>
                                    <td><a class="text-success mr-2" href="#"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a><a class="text-danger mr-2" href="#"><i class="nav-icon i-Close-Window font-weight-bold"></i></a></td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Iphone</td>
                                    <td>23-10-2019</td>
                                    <td>$300</td>
                                    <td><span class="badge badge-info">Pending</span></td>
                                    <td><a class="text-success mr-2" href="#"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a><a class="text-danger mr-2" href="#"><i class="nav-icon i-Close-Window font-weight-bold"></i></a></td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Watch</td>
                                    <td>12-10-2019</td>
                                    <td>$30</td>
                                    <td><span class="badge badge-warning">Not Delivered</span></td>
                                    <td><a class="text-success mr-2" href="#"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a><a class="text-danger mr-2" href="#"><i class="nav-icon i-Close-Window font-weight-bold"></i></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of col-->
        </div>
        <!-- end of row-->
        <!-- end of main-content -->
    </div>

    <!-- end of main-content -->

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

<script src="dist-assets/js/scripts/tooltip.script.min.js"></script>
<script src="dist-assets/js/plugins/datatables.min.js"></script>
<script src="dist-assets/js/scripts/datatables.script.min.js"></script>
<script src="dist-assets/js/scripts/script_2.min.js"></script>
<script src="dist-assets/js/plugins/feather.min.js"></script>
<script src="dist-assets/js/plugins/metisMenu.min.js"></script>
<script src="dist-assets/js/scripts/layout-sidebar-vertical.min.js"></script>




<script src="dist-assets/js/plugins/echarts.min.js"></script>
<script src="dist-assets/js/scripts/echart.options.min.js"></script>

<script src="dist-assets/js/scripts/dashboard.v4.script.min.js"></script>
<%--<script src="dist-assets/js/scripts/widgets-statistics.min.js"></script>--%>
<script src="dist-assets/js/plugins/apexcharts.min.js"></script>
<script src="dist-assets/js/scripts/apexSparklineChart.script.min.js"></script>

<%--<script src="../../dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="../../dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="../../dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="../../dist-assets/js/scripts/tooltip.script.min.js"></script>
<script src="../../dist-assets/js/scripts/script.min.js"></script>
<script src="../../dist-assets/js/scripts/script_2.min.js"></script>
<script src="../../dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="../../dist-assets/js/plugins/feather.min.js"></script>
<script src="../../dist-assets/js/plugins/metisMenu.min.js"></script>
<script src="../../dist-assets/js/scripts/layout-sidebar-vertical.min.js"></script>--%>
<script>
    const language =  getLanguage();
    console.log(language);
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