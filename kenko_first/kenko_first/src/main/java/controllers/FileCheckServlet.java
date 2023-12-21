package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FileCheckServlet")
public class FileCheckServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private int PkProfiles = 0;
    private String PhotoUrlExisting = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PkProfiles = Integer.parseInt(request.getParameter("farmer_id"));
        String Path = request.getServletContext().getRealPath("/");
        boolean IsFileExists =utils.FilesAndFolders.IsFileExists(Path);
        System.out.println("IsFileExists: "+IsFileExists);

    }

}
