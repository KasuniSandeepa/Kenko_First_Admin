package controllers;

import services.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

@WebServlet("/ForgotPasswordNewPasswordRegisterServlet")
public class ForgotPasswordNewPasswordRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String MobileNumber = request.getParameter("farmer_contact_number");
        String Password = request.getParameter("farmer_password");
        System.out.println("MobileNumber: " + MobileNumber + ", "
                + "Password: " + Password);
        int MatchedUserId= ProfilesIdGet(MobileNumber);
        //
        UsersPasswordUpdate(Password, MatchedUserId);
        //
        DeleteCookie(request, response);
        //
        response.sendRedirect("index.jsp?IsPasswordUpdated=true");
    }

    private void UsersPasswordUpdate(String Password, int UserId) {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            String SqlQuery = "UPDATE profiles"
                    + " SET Password='" + Password + "'"
                    + " WHERE PkProfiles='" + UserId + "'";

            //use ssh connection to execute a query
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("User logins: " + Password + " saved!");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
    }

    private int ProfilesIdGet(String MobileNumber) {
        int SavedUsersId = 0;

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            String SqlQuery = "SELECT PkProfiles" +
                    " FROM profiles" +
                    " WHERE MobileNumber = '" + MobileNumber + "'";

            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);

            if (ResultSet.next()) {
                SavedUsersId = Integer.parseInt(ResultSet.getString("PkProfiles"));
            }
            System.out.println("SavedUsersId : [" + MobileNumber + "] = " + SavedUsersId);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return SavedUsersId;
    }

    private void DeleteCookie(HttpServletRequest request, HttpServletResponse response){
        for (Cookie Cookie : request.getCookies()
        ) {
            if (Cookie.getName().equals("RememberedProfile")){
                Cookie.setMaxAge(0);
                response.addCookie(Cookie);
            }
        }
    }

}
