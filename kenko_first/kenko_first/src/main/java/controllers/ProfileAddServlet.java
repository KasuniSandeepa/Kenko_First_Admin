package controllers;

import models.Profile;
import services.Cookies;
import services.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import static services.Cookies.CookieDelete;
import static utils.NicDetails.GetNicDetails;

@WebServlet("/ProfileAddServlet")
public class ProfileAddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private String FirstName = "", LastName = "", Name = "", NIC = "";
    private String DateOfBirth = "", Gender = "", MobileNumber = "", Password = "";
    private Profile Profile = null;
    private boolean IsSignedUp = false, NicIsExists = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FirstName = request.getParameter("farmer_first_name");
        LastName = request.getParameter("farmer_last_name");
        Name = FirstName + "_" + LastName;
        NIC = request.getParameter("farmer_nic");
        MobileNumber = request.getParameter("farmer_contact_number");
        Password = request.getParameter("farmer_password");
        System.out.println(MobileNumber + ", " + Password);

        if (IsNicValid()) {
            if (services.NIC.IsNicExistsInDatabase(NIC)) {
                System.out.println("NicPresent=true");
                response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                        "&NicPresent=true");
            } else {
                if (IsSignedUp(request, response)) {
                    CookieDelete(request, response, Cookies.COOKIE_REMEMBERED_PROFILE);
                    response.sendRedirect("index.jsp");
                    System.out.println("UserSaved=true");
                } else {
                    System.out.println("UserSaved=false");
                    response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                            "&UserSaved=false");
                }
            }
        } else {
            System.out.println("NicValid=false");
            response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                    "&NicValid=false");
        }

    }

    private boolean IsNicValid() {
        boolean NicIsValid = false;
        String[] NicDetails = {"0", "0", "0", "0"};
        if (!GetNicDetails(NIC)[0].equals("0")) {
            //change flag
            NicIsValid = true;
            //assign local variable values
            NicDetails = GetNicDetails(NIC);
            DateOfBirth = NicDetails[0] + "-" + NicDetails[1] + "-" + NicDetails[2];
            Gender = NicDetails[3];
//            System.out.println(DateOfBirth + ", " + Gender);
        }
        return NicIsValid;
    }

    private boolean IsSignedUp(HttpServletRequest request, HttpServletResponse response) {
        boolean IsSignedUp = false;

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            String SqlQuery = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender,"
                    + " MobileNumber, PassWord, Address, PhotoUrl, Province, District, GnArea,"
                    + " LandState, CropState, RegisteredDate, Uuid)"
                    + " VALUES('" + Name + "','" + NIC + "','" + DateOfBirth + "','" + Gender + "',"
                    + " '" + MobileNumber + "','" + Password + "','Address','PhotoUrl','Province'," +
                    " 'District','GnArea','Not_Cultivated','Not_Grown','"
                    + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGet() + "')";

            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Signed Up: " + Name);
            IsSignedUp = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return IsSignedUp;
    }

    private void ResponseGet(HttpServletRequest request, HttpServletResponse response) {

        try {
//            if (IsNicValid == false) {
//                System.out.println("NicValid=false");
//                response.sendRedirect("ProfileAdd.jsp?NicValid=false");
//            } else

            if (NicIsExists) {
                System.out.println("NicPresent=true");
                response.sendRedirect("ProfileAdd.jsp?NicPresent=true");
            } else if (IsSignedUp) {
                System.out.println("UserSaved=true");
                response.sendRedirect("index.jsp?IsUserSignedUp=true");
            } else {
                System.out.println("UserSaved=false");
                response.sendRedirect("ProfileAdd.jsp?VerifiedNumber=" + MobileNumber +
                        "&UserSaved=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
