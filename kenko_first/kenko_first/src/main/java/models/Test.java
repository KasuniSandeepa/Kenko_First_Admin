/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.File;
import java.util.List;

import static services.DatabaseTableLists.ProfilesImagesListGet;
import static utils.FilesAndFolders.PROFILES_IMAGES_FOLDER;

/**
 * @author NCCS
 */
public class Test {

//    public static void main(String[] args) {
//        LocalImagesGet();
//    }

    private static void LocalImagesGet() {

        List<IdAndName> ProfilesImageList = ProfilesImagesListGet();
        if (ProfilesImageList.isEmpty()) {

            System.out.println("No images to display!");

        } else {

            try {

                int ProfilesId;
                String ProfilesImageFile, ImageDatabaseName, ImageDatabaseUrl, ImageUrl;
                File File;
                String ProfilesImagesUploadedFolder = PROFILES_IMAGES_FOLDER;

                for (IdAndName o : ProfilesImagesListGet()) {
                    ProfilesId = o.getId();
                    ImageDatabaseUrl = o.getName();
                    System.out.println("ImageDatabaseUrl: "+ImageDatabaseUrl);
//                    ProfilesImageFile = ImageDatabaseUrl.split("\\\\\\\\")[3];
//                    ImageDatabaseName = ProfilesImageFile.split("\\.")[0];
                    //--check file
//                    File = new File(ProfilesImagesUploadedFolder + ProfilesImageFile);
//                    File = new File(ImageDatabaseUrl);
//                    if (File.exists() && !File.isDirectory()) {
////                        ImageUrl = "ImageProxyServlet?imgId=" + ProfilesId;
//                        System.out.println("ImageDatabaseUrl: "+ImageDatabaseUrl);
//
//                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }

}
