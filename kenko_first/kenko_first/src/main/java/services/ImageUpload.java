package services;

import org.apache.commons.fileupload.FileItem;
import utils.FilesAndFolders;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class ImageUpload {

    private String DefaultProfilesImagePath = "";

    public String ProfilesImageUploadSave(String ImageName, HttpServletRequest request) {

        String FilePath = DefaultProfilesImagePath;
        try {
//            //--file name
//            ImageName = FileItem.getName();
//            //--replace all whitespace chars
//            ImageName = ImageName.replaceAll("\\s", "_");
//            //--path
//            String Path = request.getServletContext().getRealPath("/");
//            //--MUST
//            Path = Path.replace("\\", "/");
//            //--folder
//            String Folder = FilesAndFolders.PROFILES_IMAGES_FOLDER;
//            //--'File' object to set a file path
//            File f = new File(Path + Folder + ImageName);
//            //--execute 'upload'
//            if (f.exists() && !f.isDirectory()) {
//                System.out.println("File already exists!");
//            } else {
//                //--execute 'upload'
//                FileItem.write(f);
//            }
//            //--sending the total path is useless, therefore
//            FilePath = Folder + ImageName;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return FilePath;
    }

}
