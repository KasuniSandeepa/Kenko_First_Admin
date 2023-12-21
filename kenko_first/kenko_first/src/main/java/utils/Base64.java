
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 * @author njb
 */
public class Base64 {

//    public static void main(String[] args) {
////        System.out.println(StringEncodedGet("abc"));
////        System.out.println(StringDecodedGet("YWJj"));
//    }

    public static String StringEncodedGet(String Value) {
        String StringEncoded = "";
        try {
            java.util.Base64.Encoder Encoder = java.util.Base64.getEncoder();
            byte[] ByteArray = Encoder.encode(Value.getBytes());
            StringEncoded = new String(ByteArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return StringEncoded;
    }

    public static String StringDecodedGet(String Value) {
        String StringDecoded = "";
        try {
            java.util.Base64.Decoder Decoder = java.util.Base64.getDecoder();
            byte[] ByteArray = Decoder.decode(Value.getBytes());
            StringDecoded = new String(ByteArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return StringDecoded;
    }

}

