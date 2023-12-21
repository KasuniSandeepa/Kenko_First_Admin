package models;

import java.util.List;

public class Location {

    private String LocationName;
    private List<String> LocationList;

    public String getLocationName() {
        return LocationName;
    }

    public void setLocationName(String locationName) {
        LocationName = locationName;
    }

    public List<String> getLocationList() {
        return LocationList;
    }

    public void setLocationList(List<String> locationList) {
        LocationList = locationList;
    }

    public Location(String locationName, List<String> locationList) {
        LocationName = locationName;
        LocationList = locationList;
    }

}
