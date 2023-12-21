<%@ page import="models.Profile" %>
<html>
<head>
    <title>File Check</title>
    <style>

        .img-responsive {
            width: 100%;
            height: auto;
        }
        .div-box {
            width: 500px;
            border: 1px solid green;
            padding: 10px;
            margin: 10px;
        }
    </style>
</head>
<body>
<h2>Profile Image</h2>
<%
    if (request.getSession().getAttribute("Profile") == null) {
        response.sendRedirect("index.jsp");
    } else {
        Profile Profile = (Profile) request.getSession().getAttribute("Profile");
%>
<br>
<a href="FileCheckServlet?farmer_id=<%=Profile.getPkProfiles()%>">Check Profile Image</a>
<br>
<img class="img-responsive" id="preview" src="#" alt="image"/>
<br>
<%
    }
%>


</body>
</html>
