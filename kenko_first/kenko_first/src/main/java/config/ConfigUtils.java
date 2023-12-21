package config;

import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;

public class ConfigUtils {

    public static File getFileFromResource(String FileName) throws URISyntaxException {
        ClassLoader ClassLoader = ConfigUtils.class.getClassLoader();
        URL Resource = ClassLoader.getResource(FileName);
        if (Resource == null) {
            throw new IllegalArgumentException("File not found: " + FileName);
        } else {
            return new File(Resource.toURI());
        }
    }

}
