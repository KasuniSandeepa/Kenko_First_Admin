/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import utils.DateTime;

import java.sql.Connection;

/**
 * @author NCCS
 */
public class PrerequisitesSave {

    private static String[] StringArray;
    private static String TableName;

//    public static void main(String[] args) {
//        //--for users save
//        UsersSave();
//
//        //--for crops save
//        CropTypesSave();
//        FertilizersSave();
//        SeedTypesSave();
//        //needs SeedTypes
//        SeedsSave();
//        //needs seed types
//        YieldsSave();
//
//        //--for progresses save
//        TypeOfActivitiesSave();
//    }

    private static void CropStatesSave() {
        TableName = "cropstates";
        StringArray = new String[]{"Grown", "Not Grown"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void LandStatesSave() {
        TableName = "landstates";
        StringArray = new String[]{"Dry Land", "Wet Land"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void ProvincesSave() {
        TableName = "provinces";
        StringArray = new String[]{"Western", "Central"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void UsersSave() {
        TableName = "profiles";
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;
            try {
                //create ssh connection
                Ssh = new DatabaseConnection();
                Connection Connection = Ssh.ConnectionGet();

                //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, PassWord, Address,
                // PhotoUrl, Province, District, GnArea, LandState, CropState, RegisteredDate,
                // Uuid

                String SqlQuery01 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " PassWord, Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid)"
                        + " VALUES('John_Doe','903625148V','1990-02-03','Male','0712222222','"
                        + "john123','Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGet() + "')";
                //use ssh connection to execute a query
                Connection.createStatement().executeUpdate(SqlQuery01);
                System.out.println("Saved in " + TableName);

                String SqlQuery02 = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender, MobileNumber," +
                        " PassWord, Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                        " RegisteredDate, Uuid)"
                        + " VALUES('Mary_Jane','915869347V','1991-04-27','Female','0723333333','"
                        + "mary123', 'Address','PhotoUrl','Province','District','GnArea'"
                        + ",'Not_Cultivated','Not_Grown','"
                        + utils.DateTime.CurrentTimestampGet() + "','" + utils.Uuid.UuidGet() + "')";
                //use ssh connection to execute a query
                Connection.createStatement().executeUpdate(SqlQuery02);
                System.out.println("Saved in " + TableName);

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    //close ssh connection
                    Ssh.ConnectionClose();
                } catch (Exception e) {
                }
            }

        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void CropTypesSave() {
        TableName = "croptypes";
        StringArray = new String[]{"Carrot", "Leeks", "Beans"};
        String[] GrowthDays = new String[]{"90 Days", "115 Days", "45 Days"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length && i < GrowthDays.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    String SqlQuery = "INSERT INTO " + TableName
                            + "(Name, GrowthDuration) VALUES('" + StringArray[i]
                            + "','" + GrowthDays[i] + "')";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    System.out.println("Saved in " + TableName + ": 1," + i);

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

        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void FertilizersSave() {
        TableName = "fertilizers";
        StringArray = new String[]{"Urea", "Ammonium Sulphate"};
        String[] Reasons = new String[]{"Yellow Leaves", "Root Rotting"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length && i < Reasons.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    String SqlQuery = "INSERT INTO " + TableName
                            + "(Name, Reason) VALUES('" + StringArray[i]
                            + "','" + Reasons[i] + "')";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    System.out.println("Saved in " + TableName + ": 1," + i);

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

        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void SeedTypesSave() {
        TableName = "seedtypes";
        StringArray = new String[]{"Carrot", "Beans"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

    private static void SeedsSave() {
        TableName = "seeds";
        StringArray = new String[]{"B612-D", "G1FG-3"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    String SqlQuery = "INSERT INTO " + TableName
                            + "(Name, FkSeedTypes) VALUES('" + StringArray[i] + "',1)";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    System.out.println("Saved in " + TableName + ": 1," + i);

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
        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void YieldsSave() {
        TableName = "yields";
        StringArray = new String[]{"2021-10-31", "2021-09-31"};
        String[] TillTimes = new String[]{"2021-06-31", "2021-03-31"};
        if (DatabaseCheck.IsTableEmpty(TableName)) {

            DatabaseConnection Ssh = null;

            for (int i = 0; i < StringArray.length && i < TillTimes.length; i++) {

                try {
                    //create ssh connection
                    Ssh = new DatabaseConnection();
                    Connection Connection = Ssh.ConnectionGet();
                    String SqlQuery = "INSERT INTO " + TableName
                            + "(YieldDuration, DurationTillYield, FkSeedTypes)" +
                            " VALUES('" + DateTime.TimestampFormattedGet(StringArray[i])
                            + "','" + DateTime.TimestampFormattedGet(TillTimes[i]) + "',1)";
                    //use ssh connection to execute a query
                    Connection.createStatement().executeUpdate(SqlQuery);
                    System.out.println("Saved in " + TableName + ": 1," + i);

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
        } else {
            System.out.println("Data already present in " + TableName);
        }
    }

    private static void TypeOfActivitiesSave() {
        TableName = "typeofactivities";
        StringArray = new String[]{"Weeded", "Watered", "Added Fertilizer"};
        DatabaseCheck.InsertIntoTable(StringArray, TableName);
    }

}
