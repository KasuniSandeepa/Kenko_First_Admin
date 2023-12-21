package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ForgotPasswordOtpVerificationServlet")
public class ForgotPasswordOtpVerificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String SentNumber = request.getParameter("sent_number");
            String SentOtp = request.getParameter("sent_otp");
            String SubmittedOtp = request.getParameter("submitted_otp");
            System.out.println("SentNumber: " + SentNumber + ", "
                    + "SentOtp: " + SentOtp + ", "
                    + "SubmittedOtp: " + SubmittedOtp);

            //verify otp
            if (SubmittedOtp.equals(SentOtp)) {
                //send forward
                response.sendRedirect("ForgotPasswordNewPasswordRegister.jsp?VerifiedNumber="
                        .concat(SentNumber));
            } else {
                //send back
                response.sendRedirect("SignUpOtpRegister.jsp?IsOtpVerified=false");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

}
