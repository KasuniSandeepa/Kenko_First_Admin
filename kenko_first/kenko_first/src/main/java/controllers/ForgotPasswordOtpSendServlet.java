package controllers;

import models.OTP;
import services.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;

import static models.OTP.*;
import static services.HttpSession.LANGUAGE_SINHALESE;
import static services.HttpSession.OTP_VERIFICATION_DATA_IN_HTTP_SESSION;

@WebServlet("/ForgotPasswordOtpSendServlet")
public class ForgotPasswordOtpSendServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //initialize data
        DataInitialize(request, response);

    }

    private void DataInitialize(HttpServletRequest request, HttpServletResponse response) {

        String OtpSentNumber = request.getParameter("farmer_contact_number");
        String OtpSent = OTP.OtpGet();
        System.out.println(OtpSentNumber + ", " + OtpSent);

        try {

            if (!IsContactNumberExists(OtpSentNumber)) {
                response.sendRedirect("ForgotPasswordMobileNumberRegister.jsp?" +
                        "OtpSentStatus=invalid");
            } else {
                //send otp
                /*
                 * SMS API responses
                 * DELIVRD 2
                 * EXPIRED 3
                 * DELETED 4
                 * UNDELIV 5
                 * UNKNOWN 0
                 * REJECTD 8
                 * ACCEPTD N/A
                 * */
                if (IsOtpSent(PROCESS_FORGOT_PASSWORD, LANGUAGE_SINHALESE, OtpSentNumber, OtpSent)) {
                    //create a map in http session
                    AddOtpDataToMapInHttpSession(request, OtpSentNumber, OtpSent);
                    //send forward
                    response.sendRedirect("ForgotPasswordOtpRegister.jsp?" +
                            "OtpSentNumber=" + OtpSentNumber + "&OtpSent=" + OtpSent);
                } else {
                    //send back
                    response.sendRedirect("ForgotPasswordMobileNumberRegister.jsp?" +
                            "OtpSentNumber=" + OtpSentNumber + "&OtpSent=" + OtpSent +
                            "&OtpSentStatus=false");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void AddOtpDataToMapInHttpSession(HttpServletRequest request,
            String OtpSentNumber, String SentOtp) {
        HashMap<String, String> OtpVerificationDataMap;
        HttpSession HttpSession = request.getSession();
        if (HttpSession.getAttribute(OTP_VERIFICATION_DATA_IN_HTTP_SESSION) == null) {
            //create a new map
            OtpVerificationDataMap = new HashMap<>();
        } else {
            //get existing map
            OtpVerificationDataMap = (HashMap<String, String>) HttpSession
                    .getAttribute(OTP_VERIFICATION_DATA_IN_HTTP_SESSION);
        }
        //add otp data to map
        OtpVerificationDataMap.put(OtpSentNumber, SentOtp);
        //add map to http session
        HttpSession.setAttribute(OTP_VERIFICATION_DATA_IN_HTTP_SESSION,
                OtpVerificationDataMap);
    }

    private boolean IsContactNumberExists(String MobileNumber) {
        boolean IsContactNumberExists = false;

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            String SqlQuery = "SELECT MobileNumber" +
                    " FROM profiles" +
                    " WHERE MobileNumber='" + MobileNumber + "'";

            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);

            if (ResultSet.next()) {
                IsContactNumberExists = true;
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
        return IsContactNumberExists;
    }

    private String SendOtpToFarmer(String FarmerContactNumber, String Otp) {
        return "2";
    }

}
