package services;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {

    private static HttpServletRequest request = null;
    private static HttpServletResponse response = null;
    private static int MAX_AGE = 60 * 60 * 24;
    public static final String COOKIE_REMEMBERED_PROFILE = "RememberedProfile";
    public static final String COOKIE_LANGUAGE = "Language";

    public static void CookieSave(HttpServletResponse Response,
                                    String CookieName, String CookieValue) {
        Cookie Cookie = new Cookie(CookieName, CookieValue);
        Cookie.setMaxAge(MAX_AGE);
        Response.addCookie(Cookie);
        System.out.println("Cookie set for: " + CookieValue.split("_")[0]);
    }

    public static void CookieDelete(HttpServletRequest Request, HttpServletResponse Response,
                                    String CookieName) {
        for (javax.servlet.http.Cookie Cookie : Request.getCookies()
                ) {
            if (Cookie.getName().equals(CookieName)) {
                Cookie.setMaxAge(0);
                Response.addCookie(Cookie);
            }
        }
    }

}
