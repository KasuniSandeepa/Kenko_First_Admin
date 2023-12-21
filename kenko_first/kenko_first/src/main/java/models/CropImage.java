package models;

public class CropImage {

    private int id;
    private String _Name;
    private String _PhotoUrl;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String get_Name() {
        return _Name;
    }

    public void set_Name(String _Name) {
        this._Name = _Name;
    }

    public String get_PhotoUrl() {
        return _PhotoUrl;
    }

    public void set_PhotoUrl(String _PhotoUrl) {
        this._PhotoUrl = _PhotoUrl;
    }

    public CropImage(
            int id, String _Name, String _PhotoUrl) {
        this.id = id;
        this._Name = _Name;
        this._PhotoUrl = _PhotoUrl;
    }

}
