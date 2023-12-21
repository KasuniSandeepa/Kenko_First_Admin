package models;

import config.Config;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import static services.HttpSession.LANGUAGE_SINHALESE;
import static services.HttpSession.LANGUAGE_TAMIL;
import static utils.Strings.APPLICATION_NAME;

public class OTP {

    //processes
    public static final String PROCESS_SIGN_UP = "su";
    public static final String PROCESS_FORGOT_PASSWORD = "fp";

//    public static void main(String[] args) {
//        String FarmerContactNumber = "0715512338";
//        IsOtpSent(PROCESS_SIGN_UP, LANGUAGE_SINHALESE, FarmerContactNumber, OtpGet());
//    }

    public static boolean IsOtpSent(String Process, String Language, String MobileNumber, String OTP) {
        boolean IsOtpSent = false;

        String Message = null;
        if (Language.equals("en")) {
            Message = APPLICATION_NAME + " - " + ProcessTranslate(Process, Language) +
                    "\n\nYour OTP code is: " + OTP;
        } else if (Language.equals("si")) {
            Message = APPLICATION_NAME + " - " + ProcessTranslate(Process, Language) +
                    "\n\nඔබගේ OTP රහස් අංකය: " + OTP;
        } else if (Language.equals("ta")) {
            Message = APPLICATION_NAME + " - " + ProcessTranslate(Process, Language) +
                    "\n\nYour OTP code is: " + OTP;
        }
        //updateOtpByMobileNumber(msisdn, otpKey);
//        IsSmsSent(MsiSdn, Message);
        //
        if (IsSmsSent(MobileNumber, Message)) {
            IsOtpSent = true;
        }
        System.out.println("IsOtpSent = " + IsOtpSent);

        return IsOtpSent;
    }

    private static boolean IsSmsSent(String MsiSdn, String Msg) {
        boolean IsSmsSent = false;

        String Encode = null;
        String ConvertedResponse = "";
        int ConvertedResponseId = 0;

//        final String SMS_URL = "https://sms.textware.lk:5001/sms/send_sms.php";
//        final String SMS_USERNAME = "mobios_alert";
//        final String SMS_SRC = "MobiOsOTP";
//        final String SMS_PASSWORD = "Mo321Ar";
//        final String SMS_ACTION = "bulk_put";
//        final String SMS_CAMP = "bulk";

        final String SMS_URL = Config.Read("SMS_URL");
        final String SMS_USERNAME = Config.Read("SMS_USERNAME");
        final String SMS_SRC = Config.Read("SMS_SRC");
        final String SMS_PASSWORD = Config.Read("SMS_PASSWORD");
        final String SMS_ACTION = Config.Read("SMS_ACTION");
        final String SMS_CAMP = Config.Read("SMS_CAMP");

        try {
            Encode = URLEncoder.encode(Msg, "UTF-8");
            /* System.out.print("encode"+encode); */

            String SmsUrl = SMS_URL + "?" +
                    "username=" + SMS_USERNAME +
                    "&password=" + SMS_PASSWORD +
                    "&src=" + SMS_SRC +
                    "&dst=" + MsiSdn +
                    "&msg=" + Encode +
                    "&dr=1" +
                    "&lan=u";

            URL Url = new URL(SmsUrl);
            HttpURLConnection Connection = (HttpURLConnection) Url.openConnection();
            StringBuffer StringBuffer = null;

            // optional default is GET
            Connection.setRequestMethod("GET");

            int ResponseCode = Connection.getResponseCode();
            System.out.println("Sending 'GET' request to URL: " + SmsUrl);
            System.out.println("Response code: " + ResponseCode);

            BufferedReader BufferedReader = new BufferedReader(new InputStreamReader(Connection
                    .getInputStream()));
            String InputLine;
            StringBuffer = new StringBuffer();

            while ((InputLine = BufferedReader.readLine()) != null) {
                StringBuffer.append(InputLine);
//                Response.append(ResponseCode);
//                System.out.println("ResponseCode: "+Response.toString());
            }

            BufferedReader.close();

            ConvertedResponse = StringBuffer.toString();

            //set flag
            IsSmsSent = true;

            // print result
            System.out.println("Response: " + ConvertedResponse);
            ConvertedResponseId = ResponseIdGet(ConvertedResponse);
            System.out.println("ConvertedResponseId: " + ConvertedResponseId);

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("IsSmsSent = " + IsSmsSent);
//        return ConvertedResponse;
        return IsSmsSent;
    }

    private static String ProcessTranslate(String Process, String Language) {
        String[] ProcessesInEnglish = {"Sign Up", "Forgot Password"};
        String[] ProcessesInSinhalese = {"ලියාපදිංචි වීම", "මුරපදය අමතක වීම"};
        String[] ProcessesInTamil = {"பதிவுபெறுக", "கடவுச்சொல் மறந்துவிட்டது"};
        String ProcessTranslated = "";

        if (Language.equalsIgnoreCase(LANGUAGE_SINHALESE)) {
            if (Process.equalsIgnoreCase(PROCESS_SIGN_UP)) {
                ProcessTranslated = ProcessesInSinhalese[0];
            } else if (Process.equalsIgnoreCase(PROCESS_FORGOT_PASSWORD)) {
                ProcessTranslated = ProcessesInSinhalese[1];
            } else {
                System.out.println("Invalid process." +
                        " Use 'su' for Sign Up or 'fp' for Forgot Password");
            }
        } else if (Language.equalsIgnoreCase(LANGUAGE_TAMIL)) {
            if (Process.equalsIgnoreCase(PROCESS_SIGN_UP)) {
                ProcessTranslated = ProcessesInTamil[0];
            } else if (Process.equalsIgnoreCase(PROCESS_FORGOT_PASSWORD)) {
                ProcessTranslated = ProcessesInTamil[1];
            } else {
                System.out.println("Invalid process." +
                        " Use 'su' for Sign Up or 'fp' for Forgot Password");
            }
        } else if (Language.equalsIgnoreCase(LANGUAGE_TAMIL)) {
            if (Process.equalsIgnoreCase(PROCESS_SIGN_UP)) {
                ProcessTranslated = ProcessesInEnglish[0];
            } else if (Process.equalsIgnoreCase(PROCESS_FORGOT_PASSWORD)) {
                ProcessTranslated = ProcessesInEnglish[1];
            } else {
                System.out.println("Invalid process." +
                        " Use 'su' for Sign Up or 'fp' for Forgot Password");
            }
        } else {
            System.out.println("Invalid language." +
                    " Use 'si' for Sinhalese, 'ta' for Tamil, or 'en' for English");
        }
        return ProcessTranslated;
    }

    private static int ResponseIdGet(String Response) {
        String ResponseSorted = "";
        int ResponseSortedId = 0;
        /*
        1	Operation success: 2753537885	Successful submission (with SMS ID)
        2	403 Forbidden			Invalid user credentials
        3	Internal_error			Internal server / internet or network errors
        4	Credit_over			No credit available in the account
        5	Bad Request			Invalid Sender ID
        6	Restrict / 10			Sender ID is not whitelist
        7	Connection_timeout		Connectivity drop between systems
        8	No_routes			Invalid destination number length
        */

        //tested-works
        final String OPERATION_SUCCESS = "Operation success";
        //tested-response-mismatches
        final String _403_FORBIDDEN = "403 Forbidden";
        final String INTERNAL_ERROR = "Internal_error";
        final String CREDIT_OVER = "Credit_over";
        final String BAD_REQUEST = "Bad Request";
        final String RESTRICT_10 = "Restrict / 10";
        final String CONNECTION_TIMEOUT = "Connection_timeout";
        //tested-works
        final String NO_ROUTES = "No_routes";

        //contains
        if (Response.contains(OPERATION_SUCCESS)) {
            ResponseSortedId = 1;
            System.out.println(OPERATION_SUCCESS);

        } else if (Response.contains(_403_FORBIDDEN)) {
            ResponseSortedId = 2;
            System.out.println(_403_FORBIDDEN);

        } else if (Response.equalsIgnoreCase(INTERNAL_ERROR)) {
            ResponseSortedId = 3;
            System.out.println(INTERNAL_ERROR);

        } else if (Response.equalsIgnoreCase(CREDIT_OVER)) {
            ResponseSortedId = 4;
            System.out.println(CREDIT_OVER);

        } else if (Response.equalsIgnoreCase(BAD_REQUEST)) {
            ResponseSortedId = 5;
            System.out.println(BAD_REQUEST);

        } else if (Response.equalsIgnoreCase(RESTRICT_10)) {
            ResponseSortedId = 6;
            System.out.println(RESTRICT_10);

        } else if (Response.equalsIgnoreCase(CONNECTION_TIMEOUT)) {
            ResponseSortedId = 7;
            System.out.println(CONNECTION_TIMEOUT);

            //equalsIgnoreCase
        } else if (Response.equalsIgnoreCase(NO_ROUTES)) {
            ResponseSortedId = 8;
            System.out.println(NO_ROUTES);

        } else {
            System.out.println("Invalid response");
        }

        return ResponseSortedId;
    }

    public static String OtpGet() {
        String GeneratedOtp = "123456";
        String Numbers = "123456789";
        Random Random = new Random();
        StringBuilder StringBuilder = new StringBuilder();
        for (int NumberCount = 1; NumberCount <= 6; NumberCount++) {
            int NumberIndex = Random.nextInt(Numbers.length());
            StringBuilder.append(Numbers.charAt(NumberIndex));
        }
        try {
            GeneratedOtp = StringBuilder.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return GeneratedOtp;
    }

}
