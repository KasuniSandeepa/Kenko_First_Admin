package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcProxy {

    private final String DatabaseUrl = "jdbc:mysql://localhost:3306/kenko_first";
    private final String DatabaseUsername = "root";
    private final String DatabasePassword = "121181";

    public Connection DatabaseConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection JdbcConnnection = DriverManager.getConnection(DatabaseUrl,
                DatabaseUsername, DatabasePassword);
        return JdbcConnnection;
    }

    public void DataSet(String sqlQuery) {
        Connection Connection = null;
        Statement Statement = null;
        try {
            Connection = DatabaseConnection();
            Statement = Connection.createStatement();
            Statement.executeUpdate(sqlQuery);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Statement.close();
                Connection.close();
            } catch (Exception e) {
            }
        }
    }

    public ResultSet DataGet(String sqlQuery) {
        Connection Connection = null;
        Statement Statement = null;
        ResultSet ResultSet = null;
        try {
            Connection = DatabaseConnection();
            Statement = Connection.createStatement();
            ResultSet = Statement.executeQuery(sqlQuery);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ResultSet.close();
                Statement.close();
                Connection.close();
            } catch (Exception e) {
            }
        }
        return ResultSet;
    }

}
