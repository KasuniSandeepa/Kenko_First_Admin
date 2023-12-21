/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.ResultSet;

/**
 * @author NCCS
 */
public class DatabaseCheck {

//    public static void main(String[] args) {
//        System.out.println("ProfileRegisteredDateGet: "
//                + ProfileRegisteredDateGet(1).split(" ")[0]);
//        System.out.println("CropCountOfLandGet: "
//                + CropCountOfLandGet(1));
//        System.out.println("StatusCountOfCropGet: "
//                + StatusCountOfCropGet(1));
//        System.out.println("CropCountOfProfilesGet: "
//                + CropCountOfProfilesGet(1));
//        System.out.println("LandCountOfProfilesGet: "
//                + LandCountOfProfilesGet(1));
//        Profile p = Profile.LandDetailsGet(1);
//        System.out.println(p.getPkProfiles() + ", " + p.getName() + ", "
//                + p.getMobileNumber() + ", " + p.getAddress());
//        System.out.println("LandNameGet: "
//                + LandNameGet(1));
//        System.out.println("CropNameGet: "
//                + CropNameGet(1));
//    }

    public static synchronized String ProfileRegisteredDateGet(int PkProfiles) {
        String SqlQuery = "SELECT RegisteredDate" +
                " FROM profiles " +
                " WHERE PkProfiles='" + PkProfiles + "'";
        String Name = NameGet(SqlQuery);
        return Name;
    }

    //synchronized
    public static synchronized String LandNameGet(int PkLandDetails) {
        String SqlQuery = "SELECT Name" +
                " FROM landdetails " +
                " WHERE PkLandDetails='" + PkLandDetails + "'";
        String Name = NameGet(SqlQuery);
        return Name;
    }

    //synchronized
    public static synchronized String CropNameGet(int PkCrops) {
        String SqlQuery = "SELECT Name" +
                " FROM crops " +
                " WHERE PkCrops='" + PkCrops + "'";
        String Name = NameGet(SqlQuery);
        return Name;
    }

    //synchronized
    public static synchronized String NameGet(String SqlQuery) {
        String MatchingName = "";
        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //assign local variable value
            if (ResultSet.next()) {
                MatchingName = ResultSet.getString(1);
            }
//            System.out.println("Count: " + Count);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return MatchingName;
    }

    //synchronized
    public static synchronized int LandCountOfProfilesGet(int FkProfiles) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM landdetails" +
                " WHERE FkProfiles ='" + FkProfiles + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int CropCountOfProfilesGet(int PkProfiles) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM crops c " +
                " INNER JOIN landdetails l ON c.FkLandDetails=l.PkLandDetails " +
                " INNER JOIN profiles p ON l.FkProfiles=p.PkProfiles " +
                " WHERE PkProfiles ='" + PkProfiles + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int StatusCountOfCropGet(int PkCrops) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM progresses " +
                " WHERE FkCrops='" + PkCrops + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int CropCountOfLandGet(int PkLandDetails) {
        String SqlQuery = "SELECT COUNT(*)" +
                " FROM crops " +
                " WHERE FkLandDetails='" + PkLandDetails + "'";
        int Count = RowCountGet(SqlQuery);
        return Count;
    }

    //synchronized
    public static synchronized int RowCountGet(String SqlQuery) {
        int Count = 0;
        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //assign local variable value
            if (ResultSet.next()) {
                Count = Integer.parseInt(ResultSet.getString("COUNT(*)"));
            }
//            System.out.println("Count: " + Count);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return Count;
    }

    public static void InsertIntoTable(String[] stringArray, String tableName) {
        int Rows = 0;
        if (DatabaseCheck.IsTableEmpty(tableName)) {
            DatabaseConnection Ssh = null;
            try {
                //create ssh connection
                Ssh = new DatabaseConnection();
                Connection Connection = Ssh.ConnectionGet();
                String SqlQuery = "";
                for (String Value : stringArray) {
                    SqlQuery = "INSERT INTO " + tableName + "(Name)" +
                            " VALUES('" + Value + "')";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    Rows++;
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
            System.out.println("affected rows in " + tableName + ": " + Rows);
        } else {
            System.out.println("no of data present in " + tableName + ": "
                    + DatabaseCheck.GetRowCount(tableName));
        }
    }

    public static boolean IsTableEmpty(String tableName) {
        boolean IsTableEmpty = true;
        if (GetRowCount(tableName) > 0) {
            IsTableEmpty = false;
        }
        return IsTableEmpty;
    }

    public static int GetRowCount(String tableName) {
        int RowCount = 0;
        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //use ssh connection to execute a query
            String SqlQuery = "SELECT COUNT(*) FROM " + tableName;
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            if (ResultSet.next()) {
                RowCount = Integer.parseInt(ResultSet.getString("COUNT(*)"));
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
        return RowCount;
    }

}
