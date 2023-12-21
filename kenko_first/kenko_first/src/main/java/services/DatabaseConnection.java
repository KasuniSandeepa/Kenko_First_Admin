package services;

import config.Config;
import utils.LogUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DatabaseConnection {

    private Connection Connection = null;
//    private Session Session;

    public Connection ConnectionGet() {
        String DatabaseUrl = "jdbc:mysql://localhost:3306/kenk_first_admin?allowPublicKeyRetrieval=true&useSSL=false";
        String DatabaseUserName = "root";
//        String DatabasePassword = Config.Read("DatabasePassword");
        //String DatabasePassword = Config.Read("LocalDatabasePassword");
        String DatabasePassword = "kasuni123*";
        String DriverName = "com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(DriverName);
            Connection = DriverManager.getConnection(DatabaseUrl, DatabaseUserName,
                    DatabasePassword);
        } catch (Exception e) {
            e.printStackTrace();
//            LogUtil.getEventLog().debug("ERR:DB Connection opening failed," + e);
//            LogUtil.getErrorLog().error("ERR:DB Connection opening failed", e);
        }
        return Connection;
    }

    public void ConnectionClose() {
        try {
            if (Connection != null && !Connection.isClosed()) {
                Connection.close();
//                System.out.println("Database Connection Closed");
            }
//            if (Session != null && Session.isConnected()) {
//                Session.disconnect();
////                System.out.println("Session Disconnected");
//            }
        } catch (Exception e) {
            e.printStackTrace();
//            LogUtil.getEventLog().debug("ERR:DB Connection closing failed," + e);
//            LogUtil.getErrorLog().error("ERR:DB Connection closing failed", e);
        }
    }

}
