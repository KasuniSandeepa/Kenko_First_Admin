<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Carousel 2</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/custom/main.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="dist-assets/slick/slick.css"/>

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

<!-- =============== Left side start ================-->

<!-- =============== Left side End ================-->

<div class="main-content-wrap sidenav-open d-flex flex-column">

    <!-- ============ Body content start ============= -->

    <div class="main-content">
        <div class="breadcrumb">
            <h1>Blank</h1>
            <ul class="ml-2">
                <li><a href="">Pages</a></li>
                <li>Blank</li>
            </ul>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <!-- start of main-content -->

        <div class="row">
            <div class="col-md-12">

                <p class="mb-2"><strong>Carousel 2</strong></p>

            </div>
        </div>

        <!-- form-->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="TestServlet" method="post">

                            <!--land-id-->
                            <div class="row">
                                <div class="col-12">
                                    <input type="hidden" name="land_id"
                                           value="">
                                </div>
                            </div>
                            <!--/land-id-->

                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        <label id="lblCropAddCropType">Crop Type</label>
                                    </div>
                                    <!--                                         <div class="input-group"> -->

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

                                    <input class="form-control" type="text"
                                           placeholder="Crop Type"
                                           id="crop_type"
                                           value="crop_type"
                                           name="crop_type_name"
                                           required/>

                                    <!--crop-type-->
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="hidden" id="crop_type_h"
                                                   name="crop_type_h_name"
                                                   value="crop_type_h">
                                        </div>
                                    </div>
                                    <!--/crop-type-->

                                    <!--                                         </div> -->
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="form-group">
                                        &nbsp;
                                    </div>
                                    <button class="btn btn-primary">Add new Crop</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /form-->


        <!-- end of main-content -->

    </div>

    <!-- ============ Body content end ============= -->

    <!-- Footer Start -->

    <!-- fotter end -->

</div>

<!-- ============ Search UI Start ============= -->

<!-- ============ Search UI End ============= -->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
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

</body>
</html>