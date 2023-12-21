package controllers;

import services.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

@WebServlet("/StatusAddServlet")
public class StatusAddServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //validate data and save
        RequestDataInitialize(request, response);
        //redirect response
        ResponseGet(request, response);

    }

    //PkProgresses, UpdatedDateTime, Quantity, Status, FkCrops, FkTypeOfActivities,
    // FkProfiles, FkLandDetails
    private String _Status = "", _UpdatedDateTime = "";
    private String _AddedNumber = "", _AddedUnits = "", _Quantity = "";
    private int _FkCrops = 0, _FkTypeOfActivities = 1, _FkProfiles = 0, _FkLandDetails = 0;

    //filepath is declared below
    boolean _IsStatusSaved = false;

    private void RequestDataInitialize(HttpServletRequest request, HttpServletResponse response) {

        try {

            _UpdatedDateTime = new Timestamp(new java.util.Date().getTime()).toString();
            _AddedNumber = request.getParameter("status_number");
            _AddedUnits = request.getParameter("status_units");
            _Quantity = _AddedNumber + "_" + _AddedUnits;
            _Status = request.getParameter("status_type");
            _FkCrops = Integer.parseInt(request.getParameter("crop_id"));
            _FkTypeOfActivities = PkTypeOfActivityGet(_Status);
            _FkProfiles = Integer.parseInt(request.getParameter("farmer_id"));
            _FkLandDetails = Integer.parseInt(request.getParameter("land_id"));

            //PkProgresses, UpdatedDateTime, Quantity, Status, FkCrops, FkTypeOfActivities,
            // FkProfiles, FkLandDetails
            System.out.println("_FkCrops: " + _FkCrops + ", "
                    + "_Status: " + _Status + ", "
                    + "_UpdatedDateTime: " + _UpdatedDateTime + ", "
                    + "_Quantity: " + _Quantity + ", "
                    + "_FkTypeOfActivities: " + _FkTypeOfActivities + ", "
                    + "_FkProfiles: " + _FkProfiles + ", "
                    + "_FkLandDetails: " + _FkLandDetails);

            //save query - done in a separate method
            StatusSave();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void StatusSave() {

        DatabaseConnection Ssh = null;
        try {
            //create ssh connection
            Ssh = new DatabaseConnection();
            Connection Connection = Ssh.ConnectionGet();

            //use ssh connection to execute a query

            //PkProgresses, UpdatedDateTime, Quantity, Status, FkCrops, FkTypeOfActivities, FkProfiles,
            // FkLandDetails
            String SqlQuery = "INSERT INTO progresses(UpdatedDateTime, Quantity, Status," +
                    " FkCrops, FkTypeOfActivities, FkProfiles, FkLandDetails)"
                    + " VALUES('" + _UpdatedDateTime + "','" + _Quantity + "','" + _Status
                    + "'," + _FkCrops + "," + _FkTypeOfActivities + "," + _FkProfiles
                    + "," + _FkLandDetails + ")";

            //use ssh connection to execute a query
            Connection.createStatement().executeUpdate(SqlQuery);
            System.out.println("Saved: " + _Status);
            _IsStatusSaved = true;


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

            if (_IsStatusSaved) {
                response.sendRedirect("CropDetails.jsp?PkCrops=" + _FkCrops
                        + "&PkLandDetails=" + _FkLandDetails);
            } else {
                System.out.println("IsSatusSaved=false");
//                PkCrops=<%=d.get_CropId()%>&PkLandDetails=<%=d.get_LandId()%>&PkProfiles=<%=ProfilesInCropList.getPkProfiles()%>
                response.sendRedirect("StatusAdd.jsp?PkCrops=" + _FkCrops + "&PkLandDetails="
                        + _FkLandDetails + "&PkProfiles=" + _FkProfiles + "&IsSatusSaved=false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private int PkTypeOfActivityGet(String Status) {
        int TypeOfActivity = 0;
        if (Status.equals("Weeded")) {
            TypeOfActivity = 1;
        } else if (Status.equals("Watered")) {
            TypeOfActivity = 2;
        } else if (Status.equals("Applied Fertilizer")) {
            TypeOfActivity = 3;
        }
        return TypeOfActivity;
    }

}
