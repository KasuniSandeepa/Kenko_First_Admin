package controllers;

import java.io.IOException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.LogUtil;
import models.User;
import org.apache.log4j.MDC;

//import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;

@WebServlet("/Log4jTestServlet")
public class Log4jTestServlet extends HttpServlet {

	static final Logger LOGGER = Logger.getLogger(Log4jTestServlet.class.getName());

    static String ID = "" + UUID.randomUUID().toString();
    static String logData = "" + ID;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username=request.getParameter("user");
    }

//    private void LoggerSet(String username, HttpServletResponse response) throws Exception{
//
//        LOGGER.info("This is a logging statement from log4j");
//
////        HttpSession session = request.getSession();
////        User user = (User) session.getAttribute("user");
////        System.out.println(user.getId() + user.getName());
//
////        String username = "Nick";
//        MDC.put("username", "1");
//        MDC.getContext().clear();
//        LOGGER.info("Testing");
//
////        LOGGER.debug("Debug");
//        LOGGER.info(username);
//
////        LOGGER.debug("Debug");
//        LOGGER.log(Level.SEVERE, username);
//
//        LogUtil.getLog("Event").debug(logData + "Testing");
//        LogUtil.getLog("Error").debug(logData + " Testing Error");
//        LogUtil.getLog("Console").debug(logData + " Testing Error");
//
//        LogUtil.getLog("Emaillog").debug(logData + " Testing Email");
//
//        LogUtil.getLog("DrugFilterlog").debug(logData + " Testing Drug Filter");
//        String html = "<html><h2>Log4j has been initialized successfully!</h2></html>";
//
//        response.getWriter().println(html);

//    }

}
