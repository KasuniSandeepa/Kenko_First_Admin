package services;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpSession {

    //data
    public static final String PROFILE = "Profile";
    public static final String IP_ADDRESS = "IpAddress";
    //languages
    public static final String LANGUAGE_ENGLISH = "en";
    public static final String LANGUAGE_SINHALESE = "si";
    public static final String LANGUAGE_TAMIL = "ta";
    //
    public static final String OTP_VERIFICATION_DATA_IN_HTTP_SESSION
            = "OTP_VERIFICATION_DATA_IN_HTTP_SESSION";
    //http parameters
    //index.jsp
    public static final String IS_USER_SIGNED_IN = "IsUserSignedIn";
    public static final String IS_USER_SIGNED_UP = "IsUserSignedUp";

    public static BufferedReader GetBufferedReader(HttpURLConnection connection) {

        BufferedReader BufferedReader = null;
        try {
            InputStream InputStream = connection.getInputStream();
            InputStreamReader InputStreamReader = new InputStreamReader(InputStream);
            BufferedReader = new BufferedReader(InputStreamReader);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return BufferedReader;
    }

}