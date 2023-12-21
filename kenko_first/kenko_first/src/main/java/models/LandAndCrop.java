package models;

public class LandAndCrop {

    private int _LandId;
    private String _LandName;
    private int _CropId;
    private String _CropName;

    public int get_LandId() {
        return _LandId;
    }

    public void set_LandId(int _LandId) {
        this._LandId = _LandId;
    }

    public String get_LandName() {
        return _LandName;
    }

    public void set_LandName(String _LandName) {
        this._LandName = _LandName;
    }

    public int get_CropId() {
        return _CropId;
    }

    public void set_CropId(int _CropId) {
        this._CropId = _CropId;
    }

    public String get_CropName() {
        return _CropName;
    }

    public void set_CropName(String _CropName) {
        this._CropName = _CropName;
    }

    public LandAndCrop(int _LandId, String _LandName,
                       int _CropId, String _CropName) {
        this._LandId = _LandId;
        this._LandName = _LandName;
        this._CropId = _CropId;
        this._CropName = _CropName;
    }
}
