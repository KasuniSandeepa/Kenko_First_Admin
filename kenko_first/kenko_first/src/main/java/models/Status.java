package models;

public class Status {

    private int _Id;
    private String _Status;
    private String _Quantity;
    private String _DateTime;

    public int get_Id() {
        return _Id;
    }

    public void set_Id(int _Id) {
        this._Id = _Id;
    }

    public String get_Status() {
        return _Status;
    }

    public void set_Status(String _Status) {
        this._Status = _Status;
    }

    public String get_DateTime() {
        return _DateTime;
    }

    public void set_DateTime(String _DateTime) {
        this._DateTime = _DateTime;
    }

    public String get_Quantity() {
        return _Quantity;
    }

    public void set_Quantity(String _Quantity) {
        this._Quantity = _Quantity;
    }

    public Status(int id, String status, String quantity, String dateTime) {
        _Id = id;
        _Status = status;
        _DateTime = dateTime;
        _Quantity = quantity;
    }

}
