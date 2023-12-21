package services;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.*;
import utils.FilesAndFolders;

import java.io.File;
import java.net.InetAddress;

public class GeoLocation {

    public GeoLocation GeoLocation = null;

    private final File database = new File(FilesAndFolders.GEO_LOCATION_DATABASE);
    private DatabaseReader reader = null;
    private InetAddress inetAddress = null;
    private CityResponse response = null;

    private Country Country = null;
    private Subdivision District = null;
    private City City = null;
    private Postal PostalCode = null;
    private Location Location = null;

//    public static void main(String[] args) {
//        GeoLocation GeoLocation = new GeoLocation();
//        GeoLocation.LocationGet("112.134.92.56");
////        GeoLocation.LocationGet("0.0.0.1");
//        System.out.println(GeoLocation.CountryGet());
//        System.out.println(GeoLocation.DistrictGet());
//        System.out.println(GeoLocation.CityGet());
//        System.out.println(GeoLocation.PostalCodeGet());
//        System.out.println(GeoLocation.LatitudeAndLongitudeGet());

//        GeoLocation GeoLocation = new GeoLocation().GeoLocationGet("112.134.92.56");
//        final String District = GeoLocation.DistrictGet();
//        final String City = GeoLocation.CityGet();
//        System.out.println(District);
//        System.out.println(City);
//    }

    private GeoLocation GeoLocationGet(String IpAddress) {
        GeoLocation = new GeoLocation();
        GeoLocation.LocationGet(IpAddress);
        return GeoLocation;
    }

    public void LocationGet(String ipAddress) {

        try {

            // This creates the DatabaseReader object. To improve performance, reuse
            // the object across lookups. The object is thread-safe.
            reader = new DatabaseReader.Builder(database).build();
            inetAddress = InetAddress.getByName(ipAddress);
            // Replace "City" with the appropriate method for your database, e.g.,
            // "Country".
            response = reader.city(inetAddress);

            Country = response.getCountry();
//            System.out.println(Country.getIsoCode());
//            System.out.println(Country.getName());
//            System.out.println(Country.getNames().get("zh-CN"));

            District = response.getMostSpecificSubdivision();
//            System.out.println(District.getName());
//            System.out.println(District.getIsoCode());

            City = response.getCity();
//            System.out.println(City.getName());

            PostalCode = response.getPostal();
//            System.out.println(PostalCode.getCode());

            Location = response.getLocation();
//            System.out.println(Location.getLatitude());
//            System.out.println(Location.getLongitude());

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

    }

    public String CountryGet() {
        return Country.getName();
    }

    public String DistrictGet() {
        return District.getName().split(" ")[0];
    }

    public String CityGet() {
        return City.getName();
    }

    public String PostalCodeGet() {
        return PostalCode.getCode();
    }

    public String LatitudeAndLongitudeGet() {
        return Location.getLatitude() + "," + Location.getLongitude();
    }

}
