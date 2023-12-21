package services;

import java.sql.Connection;
import java.sql.ResultSet;

public class NIC {

//    public static void main(String[] args) {
//        String Nic = "915869347V";
//        System.out.println("IsNicExistsInDatabase: " + IsNicExistsInDatabase(Nic));
//        System.out.println("IsNicExistsInDatabaseWithAnotherUser: "
//                + IsNicExistsInDatabaseWithAnotherUser(Nic, 1));
//    }

    public static boolean IsNicExistsInDatabase(String NIC) {
        boolean IsNicExistsInDatabase = false;
        String SqlQuery = "SELECT NIC FROM profiles WHERE NIC='" + NIC + "'";
        IsNicExistsInDatabase = NicCheckInDatabase(SqlQuery);
        return IsNicExistsInDatabase;
    }

    public static boolean IsNicExistsInDatabaseWithAnotherUser(String NIC, int PkProfiles) {
        boolean IsNicExistsInDatabaseWithAnotherUser = false;
        String SqlQuery = "SELECT NIC FROM profiles WHERE NOT NIC='" + NIC + "'" +
                " AND NOT PkProfiles='" + PkProfiles + "'";
        IsNicExistsInDatabaseWithAnotherUser = NicCheckInDatabase(SqlQuery);
        return BooleanInvert(IsNicExistsInDatabaseWithAnotherUser);
    }

    //synchronized
    private static synchronized boolean NicCheckInDatabase(String SqlQuery) {
        boolean IsNICExists = false;
        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                IsNICExists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return IsNICExists;
    }

    private static boolean BooleanInvert(boolean Input) {
        boolean BooleanInverted = false;
        if (Input == true) {
            BooleanInverted = false;
        } else if (Input == false) {
            BooleanInverted = true;
        }
        return BooleanInverted;
    }

}
