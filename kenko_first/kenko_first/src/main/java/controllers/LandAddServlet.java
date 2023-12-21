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

@WebServlet("/LandAddServlet")
public class LandAddServlet extends HttpServlet {

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
    private String _LandType = "Dry_Land", _LandExtent = "", _Measurements = "";
    private String _CultivationState = "Not_Cultivated";
    private String _OwnershipState = "", _Longitude = "_Longitude", _Latitude = "_Latitude";
    private String _PhotoUrl = "PhotoUrl";

    //filepath is declared below
    boolean _IsLandSaved = false;
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
                            //--file name
                            ImageName = FileItem.getName();
                            //--replace all whitespace chars
                            ImageName = ImageName.replaceAll("\\s", "_");
                            //--path
                            String Path = request.getServletContext().getRealPath("/");
                            //--MUST
                            Path = Path.replace("\\", "/");
                            //--folder
                            String Folder = FilesAndFolders.LANDS_IMAGES_FOLDER;
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
//                            TargetFolder = FilesAndFolders.LANDS_IMAGES_FOLDER;
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

                            if (FileItem.getFieldName().equals("farmer_id")) {
                                _FkProfiles = Integer.parseInt(FileItem.getString());

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

                            } else if (FileItem.getFieldName().equals("land_gn_area")) {
                                _GnArea = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_type")) {
                                _LandType = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_photo")) {
                                FilePath = FileItem.getString();
//
//                            } else if (FileItem.getFieldName().equals("land_cultivated_status")) {
//                                _CultivationState = FileItem.getString();

                            } else if (FileItem.getFieldName().equals("land_ownership_status")) {
                                _OwnershipState = FileItem.getString();

                            }

                        }

                    }

                    System.out.println("_FkProfiles: " + _FkProfiles + ", "
                            + "_Name: " + _Name + ", "
                            + "_Address: " + _Address + ", "
                            + "_Province: " + _Province + "\n"
                            + "_District: " + _District + ", "
                            + "_GnArea: " + _GnArea + ", "
                            + "_LandType: " + _LandType + ", "
                            + "_LandExtent: " + _LandExtent + "\n"
                            + "_PhotoUrl: " + _PhotoUrl + "\n"
                            + "_Measurements: " + _Measurements + ", "
                            + "_CultivationState: " + _CultivationState + ", "
                            + "_OwnershipState: " + _OwnershipState + ", "
                            + "_Longitude: " + _Longitude + "\n"
                            + "_Latitude: " + _Latitude);

                    //save query - done in a separate method
                    if (LandDetails.IsLandDetailsNameExistsInDatabase(_FkProfiles, _Name)){
                        _IsLandNameExistsInDatabase=true;
                    }else{
                        LandSave();
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void LandSave() {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query

            //PkLandDetails, Name, Address, Province, District, GNArea, LandType, LandExtent,
            // Measurements, CultivationState, OwnershipState, Longitude, Latitude, PhotoUrl, FkProfiles
            String SqlQuery = "INSERT INTO landdetails(Name, Address, Province, District, GNArea, LandType," +
                    " LandExtent, Measurements, CultivationState, OwnershipState, Longitude, Latitude," +
                    " PhotoUrl, FkProfiles)"
                    + " VALUES('" + _Name + "','" + _Address + "','" + _Province + "','" + _District + "',"
                    + "'" + _GnArea + "','" + _LandType + "','" + _LandExtent + "','_Measurements',"
                    + "'" + _CultivationState + "','" + _OwnershipState + "','" + _Longitude + "',"
                    + "'" + _Latitude + "','" + _PhotoUrl + "'," + _FkProfiles + ")";

            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Saved: " + _Address);
            _IsLandSaved = true;

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
                response.sendRedirect("LandAdd.jsp?IsLandNameExistsInDatabase=true" +
                        "&LandExtentAmount="+_LandExtentAmount+
                        "&LandExtentMeasurement="+_LandExtentMeasurement);
            } else {
                if (_IsLandSaved) {
                    response.sendRedirect("LandAll.jsp");
                } else {
                    System.out.println("IsLandSaved=false");
                    response.sendRedirect("LandAdd.jsp?IsLandSaved=false");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
