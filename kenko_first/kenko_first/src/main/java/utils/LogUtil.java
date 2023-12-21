package utils;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
import org.w3c.dom.Document;

public class LogUtil {

    public static String LOG4J_DEFAULT_FILE = "log4j.xml";

    public LogUtil() {
    }

    public static void init(String fileName) {
        if (!(new File(fileName)).exists()) {
            fileName = !(new File("./" + LOG4J_DEFAULT_FILE)).exists() ? "./conf/"
                    + LOG4J_DEFAULT_FILE : "./" + LOG4J_DEFAULT_FILE;
        }
        try {
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document doc = builder.parse(new File(fileName));
            DOMConfigurator.configure(doc.getDocumentElement());
        } catch (Exception e) {
            System.out.println("Error in initializing logs:" + e);
        }

    }

    public static Logger getLog(String logName) {
        return Logger.getLogger(logName);
    }

    public static Logger getEventLog() {
        return Logger.getLogger("Event");
    }

    public static Logger getErrorLog() {
        return Logger.getLogger("Error");
    }
}
