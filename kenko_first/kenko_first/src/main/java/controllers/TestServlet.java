package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String Name = request.getParameter("crop_type_name");
        String NameHidden = request.getParameter("crop_type_h_name");
        System.out.println(Name + ", " + NameHidden);
        response.sendRedirect("_carousel-2.jsp");

    }
}
