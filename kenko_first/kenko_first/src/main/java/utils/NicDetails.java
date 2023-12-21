package utils;

public class NicDetails {

    private static String nic;
    private static int month[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    private static boolean isNewFormat = false;
    private static String[] NicDetails = new String[4];

    public static String[] GetNicDetails(String InputNIC) {
        nic = InputNIC;
        if (nic.length() == 12) {
            isNewFormat = true;
        }
        try {
            //for valid nic
            NicDetails[0] = String.valueOf(getYear());
            NicDetails[1] = getMonth().split(",")[0];
            NicDetails[2] = getMonth().split(",")[1];
            NicDetails[3] = getGender();
        } catch (Exception e) {
            //for invalid nic
            NicDetails[0] = "0";
            NicDetails[1] = "0";
            NicDetails[2] = "0";
            NicDetails[3] = "0";
        }
        return NicDetails;
    }

    private static int getYear() {
        if (isNewFormat) {
            return (Integer.parseInt(nic.substring(0, 4)));
        }
        return (1900 + Integer.parseInt(nic.substring(0, 2)));
    }

    private static int getDay() {
        int d;
        if (isNewFormat) {
            d = Integer.parseInt(nic.substring(4, 7));
        } else {
            d = Integer.parseInt(nic.substring(2, 5));
        }
        if (d > 500) {
//            System.out.println("Day : " + d);
            return (d - 500);
        } else {
//            System.out.println("Day : " + d);
            return d;
        }
    }

    private static String getMonth() {
        int mo = 0, da = 0;
        int days = getDay();

        for (int i = 0; i < month.length; i++) {
            if (days < month[i]) {
                mo = i + 1;
                da = days;
                break;
            } else {
                days = days - month[i];
            }
        }
        return (mo + "," + da);
//        System.out.println("Month : " + mo);

    }

    private static String getGender() {
        String M = "Male", F = "Female";
        int d;
        if (isNewFormat) {
            d = Integer.parseInt(nic.substring(4, 7));
        } else {
            d = Integer.parseInt(nic.substring(2, 5));
        }
        if (d > 500) {
            return F;
        } else {
            return M;
        }
    }

//    public static void main(String[] args) {
//        for (String Detail:EnterYourNIC("x")
//        ) {
//            System.out.println(Detail);
//        }
//    }

}