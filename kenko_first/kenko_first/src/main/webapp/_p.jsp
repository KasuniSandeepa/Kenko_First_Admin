<%@ page import="models.Profile" %>
<%@ page import="models.LandAndCrop" %>
<%@ page import="static services.DatabaseTableLists.LandsAndCropsOfProfilePaginatedGet" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>pagination</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
          rel="stylesheet"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
</head>

<body>

<%@include file="CacheControl.jsp" %>

<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profile profileInCropList = (Profile) request.getSession().getAttribute("Profile");
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
                int Total = 6;
                if (PageId == 1) {
                } else {
                    PageId = PageId - 1;
                    PageId = PageId * Total + 1;
                }

                List<LandAndCrop> List = services.DatabaseTableLists
                        .LandsAndCropsOfProfilePaginatedGet(profileInCropList
                                .getPkProfiles(), PageId, Total);

                int ResultSize = services.DatabaseCheck
                        .CropCountOfProfilesGet(profileInCropList.getPkProfiles());

                int Pages = 0;
                if ((ResultSize % Total) == 0) {
                    Pages = ResultSize / Total;
                } else {
                    Pages = (ResultSize / Total) + 1;
                }
            %>

            <h1>Page No: <%=PageIdParameter%></h1>
            <table border="1" cellpadding="5">
                <tr>
                    <th>Id</th>
                    <th>Land</th>
                    <th>Id</th>
                    <th>Crop</th>
                </tr>

                <%
                    for (LandAndCrop e : List) {
                %>

                <tr>
                    <td><%=e.get_LandId()%>
                    </td>
                    <td><%=e.get_LandName()%>
                    </td>
                    <td><%=e.get_CropId()%>
                    </td>
                    <td><%=e.get_CropName()%>
                    </td>
                </tr>

                <%
                    }
                %>

            </table>
        </div>
    </div>
    <!--/inner_row-->

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
                    <a class="page-link" href="_p.jsp?Page=<%=(i+1)%>"><%=(i+1)%>
                    </a>
                </li>

                <%
                    }
                %>

            </ul>
        </div>
    </div>
    <!--/inner_row-->

</div>
<!--/crop-list-->

<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/custom/main.js"></script>

<%
    }
%>

</body>
</html>
