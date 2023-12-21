/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.File;

/**
 * @author njb
 */
public class FilesAndFolders {

    //--
    private FilesAndFolders() {
    }

    //--
    public static FilesAndFolders FilesAndFolders;

    //--
    public static FilesAndFolders getFilesAndFolders() {
        if (FilesAndFolders == null) {
            FilesAndFolders = new FilesAndFolders();
        }
        return FilesAndFolders;
    }

    public static void FolderVerify(String file_src) {
        File file = new File(file_src);
        String fileName = file.getName();
        if (file.exists()) {
            System.out.println("Directory: '" + fileName + "' exists!");
        } else {
            file.mkdir();
            System.out.println("Directory: '" + fileName + "' created!");
        }
    }

    public static void FileVerify(String file_src) {
        File file = new File(file_src);
        String fileName = file.getName();
        if (file.exists() && !file.isDirectory()) {
            System.out.println("File: '" + fileName + "' exists!");
        } else {
            System.out.println("File: '" + fileName + "' not found!");
        }
    }

    //storage location of images in local pc
    public static final String PROFILES_IMAGES_UPLOAD_FOLDER
            = "E:\\Tests\\KF\\Uploaded_Images\\Profiles\\";
    public static final String LANDS_IMAGES_UPLOAD_FOLDER
            = "E:\\Tests\\KF\\Uploaded_Images\\Lands\\";
    public static final String CROPS_IMAGES_UPLOAD_FOLDER
            = "E:\\Tests\\KF\\Uploaded_Images\\Crops\\";

    //storage location of json files in local pc
    public static final String FILE_UPLOAD_DIRECTORY
            = "E:\\Work\\Projects\\Kenko-First\\KF-Upload-Directory\\";
    public static final String JSON_TEST_FILE = FILE_UPLOAD_DIRECTORY
            + "contents\\json\\test.json";
    public static final String JSON_APPLICATION_DATA = FILE_UPLOAD_DIRECTORY
            + "contents\\json\\JasonArraysForApplicationData.json";
    public static final String JSON_LOCATION_DATA = FILE_UPLOAD_DIRECTORY
            + "contents\\json\\JasonArraysForLocations.json";

    //storage location of geo-lite database in local pc
    public static final String GEO_LOCATION_DATABASE = FILE_UPLOAD_DIRECTORY
            + "contents\\databases\\GeoLite2-City.mmdb";

    //storage location of images in project
    public static final String PROFILES_IMAGES_FOLDER = "/contents/profiles/";
    public static final String CROPS_IMAGES_FOLDER = "/contents/crops/";
    public static final String LANDS_IMAGES_FOLDER = "/contents/lands/";

//    public static void main(String[] args) {
//       System.out.println("IsFileExists: "+IsFileExists(PROFILES_IMAGES_FOLDER));
//       System.out.println("IsFileExists: "+IsFileExists(JSON_LOCATION_DATA));
//    }

    public static boolean IsFileExists(String FilePath) {
        boolean IsFileExists = false;
        File File;
        try {
            File = new File(FilePath);
            IsFileExists = File.exists();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return IsFileExists;
    }

    public static boolean FileDelete(String FilePath) {
        boolean IsFileDeleted = false;
        try {
            File f = new File(FilePath);
            if (f.delete()) {
                System.out.println(f.getName() + " deleted");
            } else {
                System.out.println("failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return IsFileDeleted;
    }

}
