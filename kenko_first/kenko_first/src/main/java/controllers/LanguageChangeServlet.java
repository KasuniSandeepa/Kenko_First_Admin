package controllers;

import services.Cookies;
import services.HttpSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LanguageChangeServlet")
public class LanguageChangeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String Language = request.getParameter("Language");
        System.out.println("Language: " + Language);

        PrintWriter out = response.getWriter();

        if (Language.equals(HttpSession.LANGUAGE_ENGLISH)||
                Language.equals(HttpSession.LANGUAGE_SINHALESE)||
                Language.equals(HttpSession.LANGUAGE_TAMIL)) {

//            if (Language.equals(HttpSession.LANGUAGE_ENGLISH)) {
//                Language = HttpSession.LANGUAGE_ENGLISH;
//            } else if (Language.equals(HttpSession.LANGUAGE_SINHALESE)) {
//                Language = HttpSession.LANGUAGE_SINHALESE;
//            } else if (Language.equals(HttpSession.LANGUAGE_TAMIL)) {
//                Language = HttpSession.LANGUAGE_TAMIL;
//            }

            //add cookie
            services.Cookies.CookieSave(response, Cookies.COOKIE_LANGUAGE, Language);
            out.write("LanguageChangedTo=" + Language);

        } else{
            out.write("Language=" + "Invalid");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
