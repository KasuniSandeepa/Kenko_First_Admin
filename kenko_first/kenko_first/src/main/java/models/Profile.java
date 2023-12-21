package models;

import services.DatabaseConnection;
import utils.Strings;

import java.sql.Connection;
import java.sql.ResultSet;

public class Profile {

    //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, PassWord, Address,
    // PhotoUrl, Province, District, GnArea, LandState, CropState, RegisteredDate,
    // Uuid

    private int PkProfiles;
    private String Name;
    private String NIC;
    private String DateOfBirth;
    private String Gender;
    private String MobileNumber;
    private String PassWord;
    private String Address;
    private String PhotoUrl;
    private String Province;
    private String District;
    private String GnArea;
    private String LandState;
    private String CropState;
    private String RegisteredDate;
    private String Uuid;

    public int getPkProfiles() {
        return PkProfiles;
    }

    public void setPkProfiles(int pkProfiles) {
        PkProfiles = pkProfiles;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getMobileNumber() {
        return MobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        MobileNumber = mobileNumber;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String passWord) {
        PassWord = passWord;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPhotoUrl() {
        return PhotoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        PhotoUrl = photoUrl;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String province) {
        Province = province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        District = district;
    }

    public String getGnArea() {
        return GnArea;
    }

    public void setGnArea(String gnArea) {
        GnArea = gnArea;
    }

    public String getLandState() {
        return LandState;
    }

    public void setLandState(String landState) {
        LandState = landState;
    }

    public String getCropState() {
        return CropState;
    }

    public void setCropState(String cropState) {
        CropState = cropState;
    }

    public String getRegisteredDate() {
        return RegisteredDate;
    }

    public void setRegisteredDate(String registeredDate) {
        RegisteredDate = registeredDate;
    }

    public String getUuid() {
        return Uuid;
    }

    public void setUuid(String uuid) {
        Uuid = uuid;
    }

    public Profile(int pkProfiles, String name, String NIC, String dateOfBirth, String gender,
                   String mobileNumber, String passWord, String address, String photoUrl,
                   String province, String district, String gnArea, String landState,
                   String cropState, String registeredDate, String uuid) {
        this.PkProfiles = pkProfiles;
        this.Name = name;
        this.NIC = NIC;
        this.DateOfBirth = dateOfBirth;
        this.Gender = gender;
        this.MobileNumber = mobileNumber;
        this.PassWord = passWord;
        this.Address = address;
        this.PhotoUrl = photoUrl;
        this.Province = province;
        this.District = district;
        this.GnArea = gnArea;
        this.LandState = landState;
        this.CropState = cropState;
        this.RegisteredDate = registeredDate;
        this.Uuid = uuid;
    }

//    public static void main(String[] args) {
//        Profile p = Profile.ProfilesGet(1);
//        System.out.println(p.getPkProfiles() + ", " + p.getName() + ", "
//                + p.getMobileNumber() + ", " + p.getAddress());
//    }

    public static Profile ProfilesGet(int PkProfiles) {
        Profile Profile = null;

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //use ssh connection to execute a query

            //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, PassWord, Address,
            // PhotoUrl, Province, District, GnArea, LandState, CropState, RegisteredDate,
            // Uuid
            String SqlQuery = "SELECT PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber," +
                    " PassWord, Address, PhotoUrl, Province, District, GnArea, LandState, CropState," +
                    " RegisteredDate, Uuid" +
                    " FROM profiles" +
                    " WHERE PkProfiles=" + PkProfiles + "";

            //use ssh connection to execute a query
            ResultSet ResultSetMatchedProfile = Connection.createStatement().executeQuery(SqlQuery);

            //close ssh connection - done @ finally block

            if (ResultSetMatchedProfile.next()) {
                Profile = new Profile(Integer.parseInt(
                        ResultSetMatchedProfile.getString(1)),
                        ResultSetMatchedProfile.getString(2),
                        ResultSetMatchedProfile.getString(3),
                        ResultSetMatchedProfile.getString(4),
                        ResultSetMatchedProfile.getString(5),
                        ResultSetMatchedProfile.getString(6),
                        ResultSetMatchedProfile.getString(7),
                        ResultSetMatchedProfile.getString(8),
                        ResultSetMatchedProfile.getString(9),
                        ResultSetMatchedProfile.getString(10),
                        ResultSetMatchedProfile.getString(11),
                        ResultSetMatchedProfile.getString(12),
                        ResultSetMatchedProfile.getString(13),
                        ResultSetMatchedProfile.getString(14),
                        ResultSetMatchedProfile.getString(15),
                        ResultSetMatchedProfile.getString(16));
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
        return Profile;
    }

    public static boolean IsProfilesSaved(String Name, String NIC, String DateOfBirth,
                                          String Gender, String MobileNumber, String Password) {
        boolean IsUserSaved = false;

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query

            //PkProfiles, Name, NIC, DateOfBirth, Gender, MobileNumber, PassWord, Address,
            // PhotoUrl, Province, District, GnArea, LandState, CropState, RegisteredDate,
            // Uuid
            String SqlQuery = "INSERT INTO profiles(Name, NIC, DateOfBirth, Gender," +
                    " MobileNumber, PassWord, Address, PhotoUrl, FkLandStates, FkCropStates," +
                    " FkProvinces, FkDistricts, FkGnDivisions)"
                    + " VALUES('" + Name + "','" + NIC + "','" + DateOfBirth + "','" + Gender + "',"
                    + "'" + MobileNumber + "','" + Password + "','Address','PhotoUrl',1,1,1,1,1)";
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("User: " + Name + " saved!");

            //set flag
            IsUserSaved = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }
        return IsUserSaved;
    }

    public static void ProfilesDetailsGet(Profile Profile) {
        System.out.println(Profile.getPkProfiles() + "\n" +
                Strings.UnderscoresReplace(Profile.getName()) + ", " +
                Profile.getNIC() + "\n" +
                Profile.getDateOfBirth() + ", " + Profile.getGender() + "\n" +
                Profile.getMobileNumber() + ", " + Profile.getAddress() + "\n" +
                Profile.getPhotoUrl());
    }

    public static String ProfilePhotoUrlCurrentlyExistingGet(int PkProfiles) {
        String ProfilePhotoUrlCurrentlyExisting="";

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query
            ResultSet ResultSet = Connection.createStatement()
                    .executeQuery("SELECT PhotoUrl" +
                            " FROM profiles " +
                            " WHERE PkProfiles='" + PkProfiles + "'");
            if (ResultSet.next()) {
                ProfilePhotoUrlCurrentlyExisting=ResultSet.getString(1);
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
        return ProfilePhotoUrlCurrentlyExisting;
    }

}
