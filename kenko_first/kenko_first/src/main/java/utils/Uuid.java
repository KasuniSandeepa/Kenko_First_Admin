package utils;

public class Uuid {

//    public static void main(String[] args) {
//        System.out.println(UuidGet() + ": " + UuidGet().length());
//    }

    public static String UuidGet() {
        return new String(java.util.UUID.randomUUID().toString());
    }

}
