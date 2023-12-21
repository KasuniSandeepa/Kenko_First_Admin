
package utils;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;

import static utils.Strings.StringShorten;

public class DateTime {

//    public static void main(String[] args) {
////        System.out.println(CurrentTimestampGet());
////        //2021-05-27 17:03:43.633
//        System.out.println(DateTruncated("2021-05-27 17:03:43.633"));
//    }

    //dates
    public static String CurrentDateFormattedStringGet() {
        Date Date = new Date();
        SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String FormattedDateString = SimpleDateFormat.format(Date);
        return FormattedDateString;
    }

    public static Date CurrentDateGet() {
        return Calendar.getInstance().getTime();
    }

    public static Date DateTruncatedToSecondsGet(Date Date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Date);
        calendar.set(Calendar.MILLISECOND, 0);
        Date TruncatedDate = calendar.getTime();
        return TruncatedDate;
    }

    public static String DateTruncated(String s) {
        String TruncatedDate = "";
        String Date = s.split(" ")[0];
        String Time = s.split(" ")[1].substring(0, 5);
        TruncatedDate = Date + " " + Time;
        return TruncatedDate;
    }

    public static Date DateGet(String s) {
        Date d = new Date();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            d = sdf.parse(s);
        } catch (Exception e) {
            e.printStackTrace();
//            Log4J.logErrorMessage("Date Validation - String To Date",
//                    e.toString());
        }
        return d;
    }

    public static Date DateValueGet(String s) {
        //note: java.sql.Date
        Date d = java.sql.Date.valueOf(s);
        return d;
    }

    //timestamps
    public static Timestamp CurrentTimestampGet() {
        Timestamp t = new Timestamp(new Date().getTime());
        return t;
    }

    public static Timestamp TimestampGet(String s) {
        Timestamp t = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
            Date d = sdf.parse(s);
            t = new Timestamp(d.getTime());
        } catch (Exception e) {
            e.printStackTrace();
//            Log4J.logErrorMessage("Date Validation - String To Timestamp",
//                    e.toString());
        }
        return t;
    }

    public static String TimestampStringGet(Date d) {
        String s = TimestampGet(d).toString();
        return s;
    }

    public static Timestamp TimestampGet(Date d) {
        Timestamp t = new Timestamp(d.getTime());
        return t;
    }

    public static Timestamp TimestampFormattedGet(String s) {
        Timestamp t = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            Date d = sdf.parse(s);
            t = new Timestamp(d.getTime());
        } catch (Exception e) {
            e.printStackTrace();
//            Log4J.logErrorMessage("Date Validation - String To Timestamp",
//                    e.toString());
        }
        return t;
    }

    public static Timestamp TimestampFormattedGet(Timestamp t) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String s = sdf.format(t);
            Date d = sdf.parse(s);
            t = new Timestamp(d.getTime());
        } catch (Exception e) {
            e.printStackTrace();
//            Log4J.logErrorMessage("Format Timestamp - To Format",
//                    e.toString());
        }
        return t;
    }

    private void DateSaveInDbTest() {
        String x = "x";
        int y = 1;
        String SqlQuery = "UPDATE tableName" +
                " SET column01='" + x + "'" +
                " WHERE tableNamePrimaryKey='" + y + "'";
    }

}
