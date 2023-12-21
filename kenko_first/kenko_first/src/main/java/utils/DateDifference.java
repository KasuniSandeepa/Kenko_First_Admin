package utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateDifference {

//    public static void main(String[] args) {
//        String s = new DateDifference().DateDifferenceGet("2021-05-27 17:03:43");
//        String d = s.split("_")[1].split("-")[0];
//        System.out.println(d);
////        DateDifference: 0-Years_33-Days_22-Hours_31-Minutes_21-Seconds
////        33
//    }

    public String DateDifferenceGet(String DateSavedInDatabase) {

        String DateDifference = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            Date DateStarted = sdf.parse(DateSavedInDatabase);
            Date DateEnded = sdf.parse(new DateDifference().CurrentDateFormattedStringGet());

            long DifferenceInTime = DateEnded.getTime() - DateStarted.getTime();
            long DifferenceInSeconds = (DifferenceInTime / 1000) % 60;
            long DifferenceInMinutes = (DifferenceInTime / (1000 * 60)) % 60;
            long DifferenceInHours = (DifferenceInTime / (1000 * 60 * 60)) % 24;
            long DifferenceInYears = (DifferenceInTime / (1000l * 60 * 60 * 24 * 365));
            long DifferenceInDays = (DifferenceInTime / (1000 * 60 * 60 * 24)) % 365;

            DateDifference = DifferenceInYears + "-Years_" +
                    DifferenceInDays + "-Days_" +
                    DifferenceInHours + "-Hours_" +
                    DifferenceInMinutes + "-Minutes_" +
                    DifferenceInSeconds + "-Seconds";

//            System.out.println("DateDifference: " + DateDifference);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return DateDifference;

    }

    public String CurrentDateFormattedStringGet() {
        String FormattedDateString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                .format(Calendar.getInstance().getTime());
        return FormattedDateString;
    }

}
