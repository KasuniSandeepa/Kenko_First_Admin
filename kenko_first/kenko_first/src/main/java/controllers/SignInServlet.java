package controllers;

import models.Profile;
import services.Cookies;
import services.DatabaseConnection;
import services.GeoLocation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import static services.HttpSession.PROFILE;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private String MobileNumber = "";
    private String Password = "";
    private boolean IsRememberMeChecked = false;
    private ResultSet ResultSetSignIn = null, ResultSetMatchedProfile = null;
    private int ProfilesId = 0;
    private Profile Profile = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MobileNumber = request.getParameter("farmer_contact_number");
        Password = request.getParameter("farmer_password");
        System.out.println(MobileNumber + ", " + Password);

        IsRememberMeChecked = request.getParameter("remember_me") != null;

//        //set language cookie
//        if (request.getSession().getAttribute(Cookies.COOKIE_LANGUAGE) == null) {
//            services.Cookies.CookieSave(response, Cookies.COOKIE_LANGUAGE,
//                    services.HttpSession.LANGUAGE_ENGLISH);
//        }

        //sign in
        UserSignIn(request, response);
        //get matching profile
        Profile = Profile.ProfilesGet(ProfilesId);
        //clear existing cookie
        services.Cookies.CookieDelete(request, response, Cookies.COOKIE_REMEMBERED_PROFILE);
        //set ip-address
        IpAddressSave(request, response);
        //set new cookie and redirect response
        ResponseGet(request, response);

    }

    private void IpAddressSave(HttpServletRequest Request, HttpServletResponse Response) {
//        String IpAddress = Request.getRemoteHost();
        String IpAddress = "112.134.92.56";
        System.out.println("IpAddress: " + IpAddress);
        //geo-location data
        try {
//            GeoLocation GeoLocation = new GeoLocation();
//            GeoLocation.LocationGet("112.134.92.56");
////            GeoLocation.LocationGet(IpAddress);
//            System.out.println(GeoLocation.CountryGet());
//            System.out.println(GeoLocation.DistrictGet());
//            System.out.println(GeoLocation.CityGet());
//            System.out.println(GeoLocation.PostalCodeGet());
//            System.out.println(GeoLocation.LatitudeAndLongitudeGet());

            //set ip-address in session
            HttpSession HttpSession = Request.getSession();
            HttpSession.setAttribute(services.HttpSession.IP_ADDRESS, IpAddress);

        } catch (Exception e) {
            System.out.println(e);
            RedirectForInvalidIpAddress(Response);
        }

    }

    private void RedirectForInvalidIpAddress(HttpServletResponse Response) {
        try {
            Response.sendRedirect("index.jsp?IsIpValid=false");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void UserSignIn(HttpServletRequest Request, HttpServletResponse Response) {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //use ssh connection to execute a query
            String SqlQuery = "SELECT PkProfiles, MobileNumber," +
                    " Password" +
                    " FROM profiles" +
                    " WHERE MobileNumber='" + MobileNumber + "'" +
                    " AND Password='" + Password + "'";

            ResultSetSignIn = Connection.createStatement().executeQuery(SqlQuery);
            //assign local variable value
            if (ResultSetSignIn.next()) {
                ProfilesId = Integer.parseInt(ResultSetSignIn.getString(1));
            }

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

    private void ResponseGet(HttpServletRequest Request, HttpServletResponse Response) {

        try {

            if (ProfilesId != 0) {

                if (Profile == null) {
                    //user NOT matched with db records
                    System.out.println("IsUserFound=false");
                    Response.sendRedirect("index.jsp?IsUserFound=false");
                } else {
                    //user matched with db records
                    HttpSession HttpSession = Request.getSession();
                    //set user
                    HttpSession.setAttribute(PROFILE, Profile);
                    //add cookie
                    if (IsRememberMeChecked) {
                        Cookies.CookieSave(Response,
                                Cookies.COOKIE_REMEMBERED_PROFILE,
                                MobileNumber + "_" + Password);
                    }
                    System.out.println("IsUserFound=true");
                    Response.sendRedirect("AdminDashboard.jsp");
                }

            } else {
                System.out.println("IsUserSignedIn=false");
                Response.sendRedirect("index.jsp?IsUserSignedIn=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
