package models;

import services.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;

public class Crop {

//    public static void main(String[] args) {
//        Crop Crop = CropGet(1);
//        System.out.println(Crop.get_PkCrops() + ", " + Crop.get_Name() + "\n" +
//                Crop.get_CultivatedLandArea() + ", " + Crop.get_PlantedDate() + "\n" +
//                Crop.get_NurseryTime() + ", " + Crop.get_WaterRequirement() + "\n" +
//                Crop.get_ClimateRequirement() + ", " + Crop.get_CropCycleDuration() + "\n" +
//                Crop.get_PhotoUrl() + ", " + Crop.get_FkLandDetails() + "\n" +
//                Crop.get_FkCropTypes() + ", " + Crop.get_FkFertilizers() + "\n" +
//                Crop.get_FkSeedTypes() + ", " + Crop.get_FkSeeds() + "\n" +
//                Crop.get_FkYields()
//        );
//    }

    //PkCrops, Name, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement,
    // ClimateRequirement, CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes,
    // FkFertilizers, FkSeedTypes, FkSeeds, FkYields

    private int _PkCrops;
    private String _Name;
    private String _CultivatedLandArea;
    private String _NurseryTime;
    private String _PlantedDate;
    private String _WaterRequirement;
    private String _ClimateRequirement;
    private String _CropCycleDuration;
    private String _PhotoUrl;
    private int _FkLandDetails;
    private int _FkCropTypes;
    private int _FkFertilizers;
    private int _FkSeedTypes;
    private int _FkSeeds;
    private int _FkYields;

    public int get_PkCrops() {
        return _PkCrops;
    }

    public void set_PkCrops(int _PkCrops) {
        this._PkCrops = _PkCrops;
    }

    public String get_Name() {
        return _Name;
    }

    public void set_Name(String _Name) {
        this._Name = _Name;
    }

    public String get_CultivatedLandArea() {
        return _CultivatedLandArea;
    }

    public void set_CultivatedLandArea(String _CultivatedLandArea) {
        this._CultivatedLandArea = _CultivatedLandArea;
    }

    public String get_NurseryTime() {
        return _NurseryTime;
    }

    public void set_NurseryTime(String _NurseryTime) {
        this._NurseryTime = _NurseryTime;
    }

    public String get_PlantedDate() {
        return _PlantedDate;
    }

    public void set_PlantedDate(String _PlantedDate) {
        this._PlantedDate = _PlantedDate;
    }

    public String get_WaterRequirement() {
        return _WaterRequirement;
    }

    public void set_WaterRequirement(String _WaterRequirement) {
        this._WaterRequirement = _WaterRequirement;
    }

    public String get_ClimateRequirement() {
        return _ClimateRequirement;
    }

    public void set_ClimateRequirement(String _ClimateRequirement) {
        this._ClimateRequirement = _ClimateRequirement;
    }

    public String get_CropCycleDuration() {
        return _CropCycleDuration;
    }

    public void set_CropCycleDuration(String _CropCycleDuration) {
        this._CropCycleDuration = _CropCycleDuration;
    }

    public String get_PhotoUrl() {
        return _PhotoUrl;
    }

    public void set_PhotoUrl(String _PhotoUrl) {
        this._PhotoUrl = _PhotoUrl;
    }

    public int get_FkLandDetails() {
        return _FkLandDetails;
    }

    public void set_FkLandDetails(int _FkLandDetails) {
        this._FkLandDetails = _FkLandDetails;
    }

    public int get_FkCropTypes() {
        return _FkCropTypes;
    }

    public void set_FkCropTypes(int _FkCropTypes) {
        this._FkCropTypes = _FkCropTypes;
    }

    public int get_FkFertilizers() {
        return _FkFertilizers;
    }

    public void set_FkFertilizers(int _FkFertilizers) {
        this._FkFertilizers = _FkFertilizers;
    }

    public int get_FkSeedTypes() {
        return _FkSeedTypes;
    }

    public void set_FkSeedTypes(int _FkSeedTypes) {
        this._FkSeedTypes = _FkSeedTypes;
    }

    public int get_FkSeeds() {
        return _FkSeeds;
    }

    public void set_FkSeeds(int _FkSeeds) {
        this._FkSeeds = _FkSeeds;
    }

    public int get_FkYields() {
        return _FkYields;
    }

    public void set_FkYields(int _FkYields) {
        this._FkYields = _FkYields;
    }

    public Crop(int _PkCrops, String _Name, String _CultivatedLandArea, String _NurseryTime,
                String _PlantedDate, String _WaterRequirement, String _ClimateRequirement,
                String _CropCycleDuration, String _PhotoUrl, int _FkLandDetails,
                int _FkCropTypes, int _FkFertilizers, int _FkSeedTypes, int _FkSeeds,
                int _FkYields) {
        this._PkCrops = _PkCrops;
        this._Name = _Name;
        this._CultivatedLandArea = _CultivatedLandArea;
        this._NurseryTime = _NurseryTime;
        this._PlantedDate = _PlantedDate;
        this._WaterRequirement = _WaterRequirement;
        this._ClimateRequirement = _ClimateRequirement;
        this._CropCycleDuration = _CropCycleDuration;
        this._PhotoUrl = _PhotoUrl;
        this._FkLandDetails = _FkLandDetails;
        this._FkCropTypes = _FkCropTypes;
        this._FkFertilizers = _FkFertilizers;
        this._FkSeedTypes = _FkSeedTypes;
        this._FkSeeds = _FkSeeds;
        this._FkYields = _FkYields;
    }

    public static Crop CropGet(int PkCrops) {
        Crop Crop = null;
        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();
            //use ssh connection to execute a query
            String SqlQuery = "SELECT PkCrops, Name, CultivatedLandArea, NurseryTime," +
                    " PlantedDate, WaterRequirement, ClimateRequirement, CropCycleDuration," +
                    " PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes," +
                    " FkSeeds, FkYields" +
                    " FROM crops " +
                    " WHERE PkCrops='" + PkCrops + "'";
            ResultSet ResultSet = Connection.createStatement().executeQuery(SqlQuery);
            //assign local variable value
            if (ResultSet.next()) {
                Crop = new Crop(
                        Integer.parseInt(ResultSet.getString(1)),
                        ResultSet.getString(2),
                        ResultSet.getString(3),
                        ResultSet.getString(4),
                        ResultSet.getString(5),
                        ResultSet.getString(6),
                        ResultSet.getString(7),
                        ResultSet.getString(8),
                        ResultSet.getString(9),
                        Integer.parseInt(ResultSet.getString(10)),
                        Integer.parseInt(ResultSet.getString(11)),
                        Integer.parseInt(ResultSet.getString(12)),
                        Integer.parseInt(ResultSet.getString(13)),
                        Integer.parseInt(ResultSet.getString(14)),
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
        return Crop;
    }


}
