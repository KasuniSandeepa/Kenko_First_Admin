package models;

import services.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;

public class LandDetails {

    //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
    // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles

    private int _PkLandDetails;
    private String _Name;
    private String _Address;
    private String _Province;
    private String _District;
    private String _GNArea;
    private String _LandType;
    private String _LandExtent;
    private String _Measurements;
    private String _CultivationState;
    private String _OwnershipState;
    private String _Longitude;
    private String _Latitude;
    private String _PhotoUrl;
    private int _FkProfiles;

    public int get_PkLandDetails() {
        return _PkLandDetails;
    }

    public void set_PkLandDetails(int _PkLandDetails) {
        this._PkLandDetails = _PkLandDetails;
    }

    public String get_Name() {
        return _Name;
    }

    public void set_Name(String _Name) {
        this._Name = _Name;
    }

    public String get_Address() {
        return _Address;
    }

    public void set_Address(String _Address) {
        this._Address = _Address;
    }

    public String get_Province() {
        return _Province;
    }

    public void set_Province(String _Province) {
        this._Province = _Province;
    }

    public String get_District() {
        return _District;
    }

    public void set_District(String _District) {
        this._District = _District;
    }

    public String get_GNArea() {
        return _GNArea;
    }

    public void set_GNArea(String _GNArea) {
        this._GNArea = _GNArea;
    }

    public String get_LandType() {
        return _LandType;
    }

    public void set_LandType(String _LandType) {
        this._LandType = _LandType;
    }

    public String get_LandExtent() {
        return _LandExtent;
    }

    public void set_LandExtent(String _LandExtent) {
        this._LandExtent = _LandExtent;
    }

    public String get_Measurements() {
        return _Measurements;
    }

    public void set_Measurements(String _Measurements) {
        this._Measurements = _Measurements;
    }

    public String get_CultivationState() {
        return _CultivationState;
    }

    public void set_CultivationState(String _CultivationState) {
        this._CultivationState = _CultivationState;
    }

    public String get_OwnershipState() {
        return _OwnershipState;
    }

    public void set_OwnershipState(String _OwnershipState) {
        this._OwnershipState = _OwnershipState;
    }

    public String get_Longitude() {
        return _Longitude;
    }

    public void set_Longitude(String _Longitude) {
        this._Longitude = _Longitude;
    }

    public String get_Latitude() {
        return _Latitude;
    }

    public void set_Latitude(String _Latitude) {
        this._Latitude = _Latitude;
    }

    public String get_PhotoUrl() {
        return _PhotoUrl;
    }

    public void set_PhotoUrl(String _PhotoUrl) {
        this._PhotoUrl = _PhotoUrl;
    }

    public int get_FkProfiles() {
        return _FkProfiles;
    }

    public void set_FkProfiles(int _FkProfiles) {
        this._FkProfiles = _FkProfiles;
    }

    public LandDetails(int _PkLandDetails, String _Name, String _Address, String _Province,
                       String _District, String _GNArea, String _LandType, String _LandExtent,
                       String _Measurements, String _CultivationState, String _OwnershipState,
                       String _Longitude, String _Latitude, String _PhotoUrl, int _FkProfiles) {
        this._PkLandDetails = _PkLandDetails;
        this._Name = _Name;
        this._Address = _Address;
        this._Province = _Province;
        this._District = _District;
        this._GNArea = _GNArea;
        this._LandType = _LandType;
        this._LandExtent = _LandExtent;
        this._Measurements = _Measurements;
        this._CultivationState = _CultivationState;
        this._OwnershipState = _OwnershipState;
        this._Longitude = _Longitude;
        this._Latitude = _Latitude;
        this._PhotoUrl = _PhotoUrl;
        this._FkProfiles = _FkProfiles;
    }

//    public static void main(String[] args) {
//        System.out.println("IsLandDetailsNameExistsInDatabase: "
//                + IsLandDetailsNameExistsInDatabase(1, "front yard"));
////        LandDetailsPrint(1);
//    }

    public static boolean IsLandDetailsNameExistsInDatabase(int PkProfiles, String LandName) {
        boolean IsLandDetailsNameExistsInDatabase = false;

        DatabaseConnection DatabaseConnection = null;
        try {
            DatabaseConnection = new DatabaseConnection();
            Connection Connection = DatabaseConnection.ConnectionGet();

            String SqlQuery = "SELECT Name" +
                    " FROM landdetails" +
                    " WHERE Name='" + LandName + "' AND FkProfiles=" + PkProfiles + "";

            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);

            if (ResultSet.next()) {
                IsLandDetailsNameExistsInDatabase = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DatabaseConnection.ConnectionClose();
            } catch (Exception e) {
            }
        }

        return IsLandDetailsNameExistsInDatabase;
    }

    public static void LandDetailsPrint(int PkLandDetails) {
        LandDetails p = LandDetailsGet(PkLandDetails);
        System.out.println(p.get_PkLandDetails() + ", " + p.get_Name() + ", "
                + p.get_Address() + ", " + p.get_Province() + ", "
                + p.get_District() + ", " + p.get_GNArea() + "\n"
                + p.get_LandType() + ", " + p.get_LandExtent() + ", "
                + p.get_Measurements() + ", " + p.get_CultivationState() + ", "
                + p.get_OwnershipState() + ", " + p.get_Longitude() + "\n"
                + p.get_Latitude() + ", " + p.get_PhotoUrl() + ", "
                + p.get_FkProfiles());
    }

    public static LandDetails LandDetailsGet(int PkLandDetails) {
        LandDetails LandDetails = null;

        DatabaseConnection Ssh = null;
        try {
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
            // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
            String SqlQuery = "SELECT PkLandDetails, Name, Address, Province, District, GNArea," +
                    " LandType, LandExtent, Measurements, CultivationState, OwnershipState, Longitude," +
                    " Latitude, PhotoUrl, FkProfiles" +
                    " FROM landdetails" +
                    " WHERE PkLandDetails=" + PkLandDetails + "";

            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);

            if (ResultSet.next()) {
                LandDetails = new LandDetails(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        ResultSet.getString(9),
                        ResultSet.getString(10),
                        ResultSet.getString(11),
                        ResultSet.getString(12),
                        ResultSet.getString(13),
                        ResultSet.getString(14),
                        Integer.parseInt(ResultSet.getString(15))
                );
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
        return LandDetails;
    }

}
