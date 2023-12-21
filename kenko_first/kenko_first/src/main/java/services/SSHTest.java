package services;

import java.sql.Connection;
import java.sql.ResultSet;

public class SSHTest {

//    public static void main(String[] args) {
//        LandsAndCropsOfProfileGet(1);
//    }

    public static void LandsAndCropsOfProfileGet(int PkProfiles) {
        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT l.PkLandDetails, l.Name, c.PkCrops, c.Name" +
                            " FROM crops c " +
                            " INNER JOIN landdetails l ON c.FkLandDetails=l.PkLandDetails " +
                            " INNER JOIN profiles p ON l.FkProfiles=p.PkProfiles " +
                            " WHERE PkProfiles ='" + PkProfiles + "'");
            while (ResultSet.next()) {
                System.out.println(ResultSet.getString(1)+", "+
                        ResultSet.getString(2)+", "+
                        ResultSet.getString(3)+", "+
                        ResultSet.getString(4));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
    }

}

/*
1, Home Garden, 1, Carrot
1, Home Garden, 2, Leaks
1, Home Garden, 3, Beans
1, Home Garden, 5, Carrot
1, Home Garden, 7, Carrot
1, Home Garden, 10, Leaks
*/
