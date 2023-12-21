package utils;

import config.ConfigUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.net.URL;
import java.security.Key;
import java.util.Properties;

public class WebXmlData {

//    public static void main(String[] args) {
//        String Value = DataGet("env_entry_name");
////        new WebXmlData().FileInStaticFolderRead("test_param_name");
//    }

    private static String DataGet(String WebXmlEnvEntryName) {
//    private static String DataGet(String WebXmlEnvEntryName) {
        String Value = "";
        try {
            Properties props = new Properties();
            props.setProperty(Context.INITIAL_CONTEXT_FACTORY,
                    "org.apache.activemq.jndi.ActiveMQInitialContextFactory");
            props.setProperty(Context.PROVIDER_URL,"tcp://localhost:61616");
            Context ctx = (Context)new InitialContext(props).lookup("java:comp/env");
            final String fileName = (String) ctx.lookup(WebXmlEnvEntryName);
//            InitialContext initialContext = new InitialContext();
//            String fileName = (String) initialContext.lookup("java:comp/env/"
//                    + WebXmlEnvEntryName);
//            System.out.println("fileName: " + fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Value;
    }

    private void FileInStaticFolderRead(String WebXmlContextParamName) {
        URL Url = this.getClass().getClassLoader().getResource(WebXmlContextParamName);
        System.out.println(Url.getPath());
    }

    private String XmlFileRead(){
        String Value = "";
        try {
            File ConfigFile = ConfigUtils.getFileFromResource("web");
            DocumentBuilderFactory DBFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder Builder = DBFactory.newDocumentBuilder();
            Document Doc = Builder.parse(ConfigFile);
            Doc.getDocumentElement().normalize();
            NodeList Nodes = Doc.getElementsByTagName("context-param");

            for(int Counter = 0; Counter < Nodes.getLength(); ++Counter) {
//                Element Elements = (Element)Nodes.item(Counter);
//                if (Key.equals(Elements.getAttribute("param-name"))) {
//                    Value = Elements.getAttribute("param-value");
//                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Value;
    }

}
