package services;

import models.*;
import models.IdAndName;
import models.LandImage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class DatabaseTableLists {

//    public static void main(String[] args) {
//        for (IdAndName d : ProvincesListGet()) {
//            System.out.println(d.getId() + ", " + d.getName());
//        }
//        for (IdAndName d : DistrictsListGet()) {
//            System.out.println(d.getId() + ", " + d.getName());
//        }
//        for (IdAndName d : GnDivisionsListGet()) {
//            System.out.println(d.getId() + ", " + d.getName());
//        }
//        for (IdAndName d : LandStatesListGet()) {
//            System.out.println(d.getId() + ", " + d.getName());
//        }
//        for (IdAndName d : CropStatesListGet()) {
//            System.out.println(d.getId() + ", " + d.getName());
//        }
//        for (IdAndName d : ProfilesImagesListGet()) {
//            System.out.println(d.getId() + ", " + d.getName());
//        }
//        for (LandAndCrop d : LandsAndCropsOfProfileGet(7)) {
//            System.out.println(d.get_LandId() + ", " + d.get_LandName()
//                    + ", " + d.get_CropId() + ", " + d.get_CropName());
//        }
//        for (LandImage d : LandsOfProfilePaginatedGet(1)) {
//            System.out.println(d.get_Id() + ", " + d.get_LandName()
//                    + ", " + d.get_Address() + ", " + d.get_PhotoUrl());
//        }
//        for (Status d : StatusOfCropPaginatedGet(3)) {
//            System.out.println(d.get_Id() + ", " + d.get_Status()
//                    + ", " + d.get_Quantity() + ", " + d.get_DateTime());
//        }
//        for (LandAndCrop d : CropsOfLandPaginatedGet(1, 1, 5)) {
//            System.out.println(d.get_LandId() + ", " + d.get_LandName()
//                    + ", " + d.get_CropId() + ", " + d.get_CropName());
//        }
//    }

    public static List<Status> StatusOfCropGet(int PkCrops) {
        List<Status> List = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkProgresses, Status, Quantity, UpdatedDateTime" +
                            " FROM progresses " +
                            " WHERE FkCrops='" + PkCrops + "'");
            while (ResultSet.next()) {
                List.add(new Status(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4)));
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
        return List;
    }

    public static List<Status> StatusOfCropPaginatedGet(int PkCrops,
                                                        int Start, int Total) {
        List<Status> List = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkProgresses, Status, Quantity, UpdatedDateTime" +
                            " FROM progresses " +
                            " WHERE FkCrops='" + PkCrops + "'" +
                            " LIMIT " + (Start - 1) + "," + Total + "");
            while (ResultSet.next()) {
                List.add(new Status(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4)));
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
        return List;
    }

    public static List<LandAndCrop> LandsAndCropsOfProfilePaginatedGet(int PkProfiles,
                                                                       int Start, int Total) {
        List<LandAndCrop> List = new LinkedList<>();

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
                            " WHERE PkProfiles ='" + PkProfiles + "'" +
                            " LIMIT " + (Start - 1) + "," + Total + "");
            while (ResultSet.next()) {
                List.add(new LandAndCrop(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        Integer.parseInt(ResultSet.getString(3)),
                        ResultSet.getString(4)));
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
        return List;
    }

    public static List<LandImage> LandsOfProfilePaginatedGet(int PkProfiles,
                                                             int Start, int Total) {
        List<LandImage> LandsList = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkLandDetails, Name, Address, PhotoUrl" +
                            " FROM landdetails" +
                            " WHERE FkProfiles ='" + PkProfiles + "'" +
                            " LIMIT " + (Start - 1) + "," + Total + "");
            while (ResultSet.next()) {
                LandsList.add(new LandImage(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2), ResultSet.getString(3),
                        ResultSet.getString(4)));
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
        return LandsList;
    }

    public static List<LandAndCrop> CropsOfLandPaginatedGet(int PkLandDetails,
                                                             int Start, int Total) {
        List<LandAndCrop> CropsList = new LinkedList<>();

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
                            " WHERE PkLandDetails ='" + PkLandDetails + "'" +
                            " LIMIT " + (Start - 1) + "," + Total + "");
            while (ResultSet.next()) {
                CropsList.add(new LandAndCrop(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        Integer.parseInt(ResultSet.getString(3)),
                        ResultSet.getString(4)));
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
        return CropsList;
    }

    public static List<IdAndName> ProvincesListGet() {
        List<IdAndName> ProvincesList = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkProvinces, Name FROM provinces");
            while (ResultSet.next()) {
                ProvincesList.add(new IdAndName(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2)));
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
        return ProvincesList;
    }

    public static List<IdAndName> DistrictsListGet() {
        List<IdAndName> DistrictsList = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkDistricts, Name FROM districts");
            while (ResultSet.next()) {
                DistrictsList.add(new IdAndName(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2)));
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
        return DistrictsList;
    }

    public static List<IdAndName> GnDivisionsListGet() {
        List<IdAndName> GnDivisionsList = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkGnDivisions, Name FROM gndivisions");
            while (ResultSet.next()) {
                GnDivisionsList.add(new IdAndName(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2)));
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
        return GnDivisionsList;
    }

    public static List<IdAndName> ProfilesImagesListGet() {
        List<IdAndName> ProfilesImagesList = new LinkedList<>();

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PkProfiles, PhotoUrl FROM profiles");
            while (ResultSet.next()) {
                ProfilesImagesList.add(new IdAndName(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2)));
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
        return ProfilesImagesList;
    }

}

/*

 */
