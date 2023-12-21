package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBC {

    private static final String DatabaseUrl = "jdbc:mysql://localhost:3306/kenko_first";
    private static final String DatabaseUsername = "root";
    private static final String DatabasePassword = "121181";

    private static final Connection Connection = null;

    public static Connection DatabaseConnection() throws Exception {
        if (Connection == null) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection JdbcConnnection = DriverManager.getConnection(DatabaseUrl,
                    DatabaseUsername, DatabasePassword);
            return JdbcConnnection;
        } else {
            return Connection;
        }
    }

    public static void PutData(String sqlQuery) throws Exception {
        Connection Connection = DatabaseConnection();
        Statement Statement = Connection.createStatement();
        Statement.executeUpdate(sqlQuery);
    }

    public static ResultSet GetData(String sqlQuery) throws Exception {
        Connection Connection = DatabaseConnection();
        Statement Statement = Connection.createStatement();
        ResultSet ResultSet = Statement.executeQuery(sqlQuery);
        return ResultSet;
    }

}
