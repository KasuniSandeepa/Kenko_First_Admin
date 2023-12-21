package controllers;

import models.LandDetails;
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

@WebServlet("/LandUpdateServlet")
public class LandUpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDataInitialize(request, response);
        ResponseGet(request, response);

    }

    //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
    // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
    private String _LandExtentAmount = "", _LandExtentMeasurement = "";
    private int _FkProfiles = 0;
    private String _Name = "", _Address = "";
    private String _Province = "", _District = "", _GnArea = "";
    private String _LandType = "", _LandExtent = "", _Measurements = "";
    private String _CultivationState = "Not_Cultivated";
    private String _OwnershipState = "", _Longitude = "_Longitude", _Latitude = "_Latitude";
    private int _PkLandDetails = 0;
    private String _PhotoUrl = "src/images/_PhotoUrl";

    //image filepath is declared below
    boolean _IsLandUpdated = false;
    boolean _IsLandNameExistsInDatabase = false;

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
//                            //--file name
//                            ImageName = FileItem.getName();
//                            System.out.println("ImageName: "+ImageName);
//                            //--replace all whitespace chars
//                            ImageName = ImageName.replaceAll("\\s", "_");
//                            //--path
//                            String Path = request.getServletContext().getRealPath("/");
//                            System.out.println("Path: "+Path);
//                            //--MUST
//                            Path = Path.replace("\\", "/");
//                            //--folder
////                            String folder = "images/delivery_notices/";
//                            String Folder = FilesAndFolders.LANDS_IMAGES_FOLDER;
//                            System.out.println("Folder: "+Folder);
//                            //--'File' object to set a file path
//                            File File = new File(Path + Folder + ImageName);
//                            System.out.println("File > Path: "+File.getPath());
//                            //--execute 'upload'
//                            if (File.exists() && !File.isDirectory()) {
//                                System.out.println("File already exists!");
//                            } else {
//                                //--execute 'upload'
//                                FileItem.write(File);
//                            }
//                            //--sending the total path is useless, therefore
//                            FilePath = Folder + ImageName;

                            //need to replace the existing image

                            //--file name
                            ImageName = FileItem.getName();
                            //--replace all whitespace chars
                            ImageName = ImageName.replaceAll("\\s", "_");

                            //--path - outside the project
                            TargetFolder = FilesAndFolders.LANDS_IMAGES_UPLOAD_FOLDER;

                            //--'File' write to target folder
                            TargetFile = new File((TargetFolder + ImageName).trim());
                            if (TargetFile.exists() && !TargetFile.isDirectory()) {
                                System.out.println("File already exists!");
                            } else {
                                //--execute 'upload'
                                FileItem.write(TargetFile);
                            }

                            //--sending the total path is useless, therefore
                            FilePath = TargetFolder + ImageName;
                            //--
                            FilePath = FilePath.replaceAll("\\\\", "\\\\\\\\");
                            _PhotoUrl = FilePath;

                        } else {

                            if (FileItem.getFieldName().equals("land_id")) {
                                _PkLandDetails = Integer.parseInt(FileItem.getString());

                            } else if (FileItem.getFieldName().equals("land_extent_amount")) {
                                _LandExtentAmount = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_extent_measurement")) {
                                _LandExtentMeasurement = FileItem.getString();
                                //concat both names
                                _LandExtent = _LandExtentAmount + "_" + _LandExtentMeasurement;

                            } else if (FileItem.getFieldName().equals("land_name")) {
                                _Name = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_address")) {
                                _Address = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_province")) {
                                _Province = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_district")) {
                                _District = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_gn_division")) {
                                _GnArea = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_type")) {
                                _LandType = FileItem.getString();

//                            } else if (FileItem.getFieldName().equals("land_photo")) {
//                                FilePath = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_cultivated_status")) {
                                _CultivationState = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_ownership_status")) {
                                _OwnershipState = FileItem.getString();

                            }

                        }

                    }

                    System.out.println("_PkLandDetails: " + _PkLandDetails + ", "
                            + "_Name: " + _Name + ", "
                            + "_Address: " + _Address + ", "
                            + "_FkProvince: " + _Province + "\n"
                            + "_FkDistrict: " + _District + ", "
                            + "_FkGnDivision: " + _GnArea + ", "
                            + "_LandType: " + _LandType + ", "
                            + "_LandExtent: " + _LandExtent + "\n"
                            + "_PhotoUrl: " + _PhotoUrl + "\n"
                            + "_Measurements: " + _Measurements + ", "
                            + "_CultivationState: " + _CultivationState + ", "
                            + "_OwnershipState: " + _OwnershipState + ", "
                            + "_Longitude: " + _Longitude + "\n"
                            + "_Latitude: " + _Latitude);

                    //update query - done in a separate method
                    if (LandDetails.IsLandDetailsNameExistsInDatabase(_FkProfiles, _Name)) {
                        _IsLandNameExistsInDatabase = true;
                    } else {
                        LandUpdate();
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void LandUpdate() {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query

            //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
            // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
            String SqlQuery = "UPDATE landdetails SET Name='" + _Name + "', Address='" + _Address + "'," +
                    " Province='" + _Province + "', District='" + _District + "'," +
                    " GNArea='" + _GnArea + "', LandType='" + _LandType + "'," +
                    " LandExtent='" + _LandExtent + "', Measurements='_Measurements'," +
                    " CultivationState='" + _CultivationState + "', OwnershipState='" + _OwnershipState + "'," +
                    " Longitude='" + _Longitude + "', Latitude='" + _Latitude + "', PhotoUrl='" + _PhotoUrl + "'," +
                    " WHERE PkLandDetails=" + _PkLandDetails + "";

            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Updated: " + _Name);
            _IsLandUpdated = true;

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

            if (_IsLandNameExistsInDatabase) {
                response.sendRedirect("Update.jsp?IsLandNameExistsInDatabase=true" +
                        "&LandExtentAmount=" + _LandExtentAmount +
                        "&LandExtentMeasurement=" + _LandExtentMeasurement);
            } else {
                if (_IsLandUpdated) {
                    response.sendRedirect("LandUpdate.jsp?PkLandDetails=" + _PkLandDetails +
                            "&IsLandUpdated=true");
                } else {
                    System.out.println("IsLandUpdated=false");
                    response.sendRedirect("LandUpdate.jsp?PkLandDetails=" + _PkLandDetails +
                            "&IsLandUpdated=false");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
