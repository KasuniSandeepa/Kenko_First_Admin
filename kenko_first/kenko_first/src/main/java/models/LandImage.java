package models;

public class LandImage {

    private int _Id;
//    private int _CropCount;
    private String _LandName;
    private String _Address;
    private String _PhotoUrl;

    public int get_Id() {
        return _Id;
    }

    public void set_Id(int _Id) {
        this._Id = _Id;
    }

//    public int get_CropCount() {
//        return _CropCount;
//    }

//    public void set_CropCount(int _CropCount) {
//        this._CropCount = _CropCount;
//    }

    public String get_LandName() {
        return _LandName;
    }

    public void set_LandName(String _LandName) {
        this._LandName = _LandName;
    }

    public String get_Address() {
        return _Address;
    }

    public void set_Address(String _Address) {
        this._Address = _Address;
    }

    public String get_PhotoUrl() {
        return _PhotoUrl;
    }

    public void set_PhotoUrl(String _PhotoUrl) {
        this._PhotoUrl = _PhotoUrl;
    }

//    public LandImage(int _Id, int _CropCount, String _LandName,
    public LandImage(int _Id, String _LandName, String _Address, String _PhotoUrl) {
        this._Id = _Id;
//        this._CropCount = _CropCount;
        this._LandName = _LandName;
        this._Address = _Address;
        this._PhotoUrl = _PhotoUrl;
    }
}
