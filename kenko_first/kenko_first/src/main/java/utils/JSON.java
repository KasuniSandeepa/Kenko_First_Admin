package utils;

import com.google.gson.*;

import java.io.FileReader;
import java.util.LinkedList;
import java.util.List;

public class JSON {

//    public static void main(String[] args) {
        //--
//        JsonArray JsonArray = new JSON().JsonArrayObjectGet("Districts");
//        com.google.gson.JsonObject ObjectDistrict = null;
//        for (JsonElement e : JsonArray) {
//            System.out.println(e.getAsString());
//        }
        //--
//        for (String e : new JSON().JsonArrayListGet("LandTypes")) {
//            System.out.println(e);
//        }
        //--
//        for (JsonElement e : new JSON().JsonArrayGet("LandTypes")) {
//            System.out.println(e.getAsString());
//        }
//        //--
//        new JSON().JsonGet();
//    }

    public JsonArray JsonArrayObjectGet(String JsonArrayName) {
        //get a specific string array .json file
        JsonArray JsonArray = null;
        JsonParser JsonParser = new JsonParser();
        try {
            //'.json' file exists in the 'project' directory as a peer of 'src' folder
            Object Object = JsonParser
                    .parse(new FileReader("JasonArraysForLocations.json"));
            //get cast object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //get a specific string array .json file
            JsonArray = JsonObject.getAsJsonArray(JsonArrayName);
            if (JsonArray == null) {
                JsonArray = JsonObject.getAsJsonArray("FallBack");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JsonArray;
    }

    public List<String> JsonArrayListGet(String JsonArrayName) {
        //get a specific string array .json file
        List<String> listdata = null;
        JsonParser JsonParser = new JsonParser();
        try {
            //'.json' file exists in the 'project' directory as a peer of 'src' folder
            Object Object = JsonParser
                    .parse(new FileReader("JasonArraysForApplicationData.json"));
            //get cast object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //get a specific string array .json file
            JsonArray jArray = JsonObject.getAsJsonArray(JsonArrayName);
            listdata = new LinkedList<>();
            if (jArray == null) {
                jArray = JsonObject.getAsJsonArray("FallBack");
            }
            for (JsonElement e : jArray) {
                listdata.add(e.getAsString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listdata;
    }

    private JsonArray JsonArrayGet(String JsonArrayName) {
        //get a specific string array .json file
        JsonArray JsonArray = null;
        JsonParser JsonParser = new JsonParser();
        try {
            //'.json' file exists in the 'project' directory as a peer of 'src' folder
            Object Object = JsonParser
                    .parse(new FileReader("JasonArraysForApplicationData.json"));
            //get cast object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //get a specific string array .json file
            JsonArray = JsonObject.getAsJsonArray(JsonArrayName);
            if (JsonArray == null) {
                JsonArray = JsonObject.getAsJsonArray("FallBack");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JsonArray;
    }

    private void JsonGet() {
        JsonParser JsonParser = new JsonParser();
        try {
            //'.json' file exists in the 'project' directory as a peer of 'src' folder
            Object Object = JsonParser
                    .parse(new FileReader("JasonArraysForApplicationData.json"));
            //get cast object file to a json-object
            JsonObject JsonObject = (com.google.gson.JsonObject) Object;
            //get a specific string .json file
            String LandTypes = JsonObject.get("LandTypes").toString();
            System.out.println("LandTypes: " + LandTypes);
            //get a specific string array .json file
            JsonArray JsonArray = JsonObject.getAsJsonArray("LandTypes");
            if (JsonArray == null) {
                JsonArray = JsonObject.getAsJsonArray("FallBack");
            }
            for (JsonElement e : JsonArray
                    ) {
                System.out.println(e.getAsString());
            }
            /*
            LandTypes: ["Wet Land","Dry Land"]
            Wet Land
            Dry Land
            */
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
