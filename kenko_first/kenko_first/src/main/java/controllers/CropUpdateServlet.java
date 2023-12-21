package controllers;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import services.DatabaseConnection;
import utils.FilesAndFolders;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/CropUpdateServlet")
public class CropUpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDataInitialize(request, response);
        ResponseGet(request, response);

    }

    //PkCrops, Name, Duration, NurseryTime, PlantedDate, WaterRequirement, ClimateRequirement,
    // CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes, FkFertilizers, FkSeedTypes,
    // FkSeeds, FkYields
    private String _Name = "", _PlantedDate = "";
    private String _CropExtentNumber = "", _CropExtentUnit = "", _CultivatedLandArea = "";
    private String _NurseryGrownNumber = "", _NurseryGrownUnit = "", _NurseryTime = "";
    private String _WaterRequirement = "_WaterRequirement", _ClimateRequirement = "_ClimateRequirement";
    private String _CropCycleDuration = "_CropCycleDuration";
    private String _PhotoUrl = "src/images/_PhotoUrl";
    private int _PkLandDetails = 0, _PkCrops = 0, _FkCropTypes = 1, _FkFertilizers = 1, _FkSeedTypes = 1;
    private int _FkSeeds = 1, _FkYields = 1;

    //filepath is declared below
    boolean _IsCropUpdated = false;

    private void RequestDataInitialize(HttpServletRequest request, HttpServletResponse response) {

        try {
            //checks if the uploaded file is of 'multipart' type
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart == true) {
                try {
                    FileItemFactory fi = new DiskFileItemFactory();
                    ServletFileUpload uploadFile = new ServletFileUpload(fi);
                    //--set a 'FileItem' list for uploaded files to get ANY type of file
                    List<FileItem> li = uploadFile.parseRequest(request);

                    String TargetFolder = "", ImageName = "", FilePath = "";
                    File TargetFile;

                    //--iterate the list
                    for (FileItem FileItem : li) {
                        if (!FileItem.isFormField()) {
                            //--file name
                            ImageName = FileItem.getName();
                            //--replace all whitespace chars
                            ImageName = ImageName.replaceAll("\\s", "_");
                            //--path
                            String Path = request.getServletContext().getRealPath("/");
                            //--MUST
                            Path = Path.replace("\\", "/");
                            //--folder
                            String Folder = FilesAndFolders.CROPS_IMAGES_FOLDER;
                            //--'File' object to set a file path
                            File f = new File(Path + Folder + ImageName);
                            //--execute 'upload'
                            if (f.exists() && !f.isDirectory()) {
                                System.out.println("File already exists!");
                            } else {
                                //--execute 'upload'
                                FileItem.write(f);
                            }
                            //--sending the total path is useless, therefore
                            FilePath = Folder + ImageName;

//                            //--file name
//                            ImageName = FileItem.getName();
//                            //--replace all whitespace chars
//                            ImageName = ImageName.replaceAll("\\s", "_");
//
//                            //--path - outside the project
//                            TargetFolder = FilesAndFolders.CROPS_IMAGES_FOLDER;
//
//                            //--'File' write to target folder
//                            TargetFile = new File((TargetFolder + ImageName).trim());
//                            if (TargetFile.exists() && !TargetFile.isDirectory()) {
//                                System.out.println("File already exists!");
//                            } else {
//                                //--execute 'upload'
//                                FileItem.write(TargetFile);
//                            }
//
//                            //--sending the total path is useless, therefore
//                            FilePath = TargetFolder + ImageName;
//                            //--
//                            FilePath = FilePath.replaceAll("\\\\", "\\\\\\\\");
                            _PhotoUrl = FilePath;

                        } else {

                            if (FileItem.getFieldName().equals("crop_id")) {
                                _PkCrops = Integer.parseInt(FileItem.getString());

                            } else if (FileItem.getFieldName().equals("land_id")) {
                                _PkLandDetails = Integer.parseInt(FileItem.getString());

                            } else if (FileItem.getFieldName().equals("crop_type")) {
                                _Name = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("crop_extent_number")) {
                                _CropExtentNumber = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("crop_extent_unit")) {
                                _CropExtentUnit = FileItem.getString();
                                //concat both names
                                _CultivatedLandArea = _CropExtentNumber + "_" + _CropExtentUnit;

                            } else if (FileItem.getFieldName().equals("crop_nursery_grown_number")) {
                                _NurseryGrownNumber = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("crop_nursery_grown_unit")) {
                                _NurseryGrownUnit = FileItem.getString();
                                //concat both names
                                _NurseryTime = _NurseryGrownNumber + "_" + _NurseryGrownUnit;

                            } else if (FileItem.getFieldName().equals("crop_planted_date")) {
                                _PlantedDate = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("crop_photo")) {
                                FilePath = FileItem.getString();

                            }

                        }

                    }

                    //_Name, _PlantedDate, _CultivatedLandArea, _NurseryTime, _WaterRequirement, _ClimateRequirement,
                    //_CropCycleDuration, _PhotoUrl, _PkCrops, _FkCropTypes, _FkFertilizers,
                    //_FkSeedTypes, _FkSeeds, _FkYields

                    System.out.println("_PkCrops: " + _PkCrops + ", "
                            + "_Name: " + _Name + ", "
                            + "_PlantedDate: " + _PlantedDate + ", "
                            + "_CultivatedLandArea: " + _CultivatedLandArea + ", "
                            + "_NurseryTime: " + _NurseryTime + "\n"
                            + "_WaterRequirement: " + _WaterRequirement + ", "
                            + "_ClimateRequirement: " + _ClimateRequirement + ", "
                            + "_CropCycleDuration: " + _CropCycleDuration + "\n"
                            + "_PhotoUrl: " + _PhotoUrl + "\n"
                            + "_FkCropTypes: " + _FkCropTypes + ", "
                            + "_FkFertilizers: " + _FkFertilizers + ", "
                            + "_FkSeedTypes: " + _FkSeedTypes + ", "
                            + "_FkSeeds: " + _FkSeeds + "\n"
                            + "_FkYields: " + _FkYields);

                    //save query - done in a separate method
                    CropUpdate();

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void CropUpdate() {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query

            //PkCrops, Name, CultivatedLandArea, NurseryTime, PlantedDate, WaterRequirement,
            // ClimateRequirement, CropCycleDuration, PhotoUrl, FkLandDetails, FkCropTypes,
            // FkFertilizers, FkSeedTypes, FkSeeds, FkYields
            String SqlQuery = "UPDATE crops SET Name='" + _Name + "', CultivatedLandArea='" + _CultivatedLandArea + "'," +
                    " NurseryTime='" + _NurseryTime + "', PlantedDate='" + _PlantedDate + "'," +
                    " WaterRequirement='" + _WaterRequirement + "', ClimateRequirement='" + _ClimateRequirement + "'," +
                    " CropCycleDuration='" + _CropCycleDuration + "', PhotoUrl='" + _PhotoUrl + "'," +
                    " FkCropTypes=" + _FkCropTypes + ", FkFertilizers=" + _FkFertilizers + "," +
                    " FkSeedTypes=" + _FkSeedTypes + ", FkSeeds=" + _FkSeeds + ", FkYields=" + _FkYields + "" +
                    " WHERE PkCrops=" + _PkCrops + "";

            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Saved: " + _Name);
            _IsCropUpdated = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //close ssh connection
                Ssh.ConnectionClose();
            } catch (Exception e) {
            }
        }

    }

    private void ResponseGet(HttpServletRequest request, HttpServletResponse response) {

        try {

            if (_IsCropUpdated) {
                response.sendRedirect("CropUpdate.jsp?PkLandDetails=" + _PkCrops
                        + "&IsCropUpdated=true");
            } else {
                System.out.println("IsCropSaved=false");
                response.sendRedirect("CropUpdate.jsp?PkLandDetails=" + _PkLandDetails +
                        "&PkCrops=" + _PkCrops + "&IsCropUpdated=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
