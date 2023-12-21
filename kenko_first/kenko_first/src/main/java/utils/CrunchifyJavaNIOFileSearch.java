package utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CrunchifyJavaNIOFileSearch {

//    public static void main(String[] args) {
//        FileSearch();
//    }

    private static void FileSearch() {

        try {

            String directory = "/Users/appshah/Desktop/screenshots";
            Path crunchifyPath = Paths.get(directory);

            // Let's get all .png files
            String crunchifyExtension = "*.png";
            CrunchifyFileSearchPattern crunchifyPattern = new CrunchifyFileSearchPattern(
                    crunchifyExtension);

            // Walks a file tree.
            Files.walkFileTree(crunchifyPath, crunchifyPattern);
            CrunchifyFileSearchPattern.log(
                    "\nYou have total " + crunchifyPattern.crunchifyTotalCount()
                            + " .png files under directory " + directory + "\n");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
