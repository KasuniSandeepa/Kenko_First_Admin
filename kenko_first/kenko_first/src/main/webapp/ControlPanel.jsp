
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>

    <link rel="stylesheet" type="text/css" href="src/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="src/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="src/css/main.css">

    <%--<script type="text/javascript" src="src/js/jquery-3.2.1.min.js"></script>--%>
    <%--<script type="text/javascript" src="src/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript" src="src/js/main.js"></script>

</head>
<body>

<%
    if (!(request.getSession().getAttribute("Profile") == null)) {
//                show_page_body
//        User UserInControlPanel = (User) request.getSession().getAttribute("User");
//        int UserId = UserInControlPanel.ge;
//        HashMap<String, String> hm = UserControl
//                .getUserInterfaces(UserId);
%>

<!--control-panel-->
<div class="container-fluid bg-dark text-light">
    <div class="container navbar navbar-expand-md navbar-dark bg-dark">
        <div class="row">
            <div class="col-lg-12">
                <ul class="navbar-nav mr-auto">
                    <!--for_loop-->
                    <%
//                        if (UserInControlPanel.getUserType() == 1) {
//                            for (Map.Entry<String, String> e : hm.entrySet()) {
                    %>
                    <li class="nav-item"><a class="nav-link"
<%--                                            href="<%=e.getKey()%>"><%=e.getValue()%>--%>
                    &nbsp;
                    </li>
                    <%
//                            }
                        }
                    %>
                    <!--/for_loop-->
                </ul>
            </div>
        </div>
    </div>
</div>
<!--/control-panel-->

<%
//    } else {
//                hide_page_body
//    }
%>

</body>
</html>
