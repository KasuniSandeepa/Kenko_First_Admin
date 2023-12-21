package utils;

import config.Config;

public class Strings {

    //variables
    public static String APPLICATION_NAME = Config.Read("ApplicationName");

    //Modal Texts
    public static final String INDEX_MODAL_ERROR_USER_DISABLED=
            "";
    public static final String INDEX_MODAL_ERROR_USER_INVALID=
            "";
    public static final String INDEX_MODAL_SUCCESS_SIGNED_UP=
            "";

    //getters and setters

    //constructors

    //operators
    public static String RenamePrimaryKey(String tableName) {
        String TrimmedName = RemoveFirstTwoLetters(tableName);
        int Index = 0;
        char CharacterToUppercase = Character.toUpperCase(tableName.charAt(0));
        String RenamedPrimaryKey = TrimmedName.replace(TrimmedName.charAt(Index),
                CharacterToUppercase);
        return RenamedPrimaryKey;
    }

//    public static void main(String[] args) {
//        System.out.println(StringShorten("2021-05-27 17:03:43.633"));
//    }

    public static String UppercaseFirstLetter(String tableName) {
        int Index = 0;
        char CharacterToUppercase = Character.toUpperCase(tableName.charAt(Index));
        String UppercasedName = tableName.replace(tableName.charAt(Index),
                CharacterToUppercase);
        return UppercasedName;
    }

    public static String RemoveFirstTwoLetters(String tableName) {
        String TrimmedName = tableName.substring(3, tableName.length() - 1);
        return TrimmedName;
    }

    public static String UnderscoresReplace(String Name) {
        String NewName = Name.replaceAll("_", " ");
        return NewName;
    }

    public static String StringShorten(String DateString) {
        //2021-05-27 17:03:43.633
        return new String(DateString.substring(0, 16));
    }

    public static String PhotoUrlRename(String PhotoUrl) {
        return PhotoUrl.replaceAll("\\\\", "\\\\\\\\");
    }

}
