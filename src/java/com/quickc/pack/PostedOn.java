package com.quickc.pack;

import java.util.Date;

public class PostedOn {

    public static int years;
    public static int months;
    public static int days;
    public static int hours;
    public static int minutes;
    public static int seconds;
    public static String differenceString;

    public static String PostedOnDates(Date curdate, Date olddate) {
        String res = "";
        float diff = curdate.getTime() - olddate.getTime();
        if (diff >= 0) {
            int yearDiff = Math.round((diff / (365l * 2592000000f)) >= 1 ? (diff / (365l * 2592000000f)) : 0);
            if (yearDiff > 0) {
                years = yearDiff;
                res = years + (years == 1 ? " Year" : " Years") + " Ago";
            } else {
                int monthDiff = Math.round((diff / 2592000000f) >= 1 ? (diff / 2592000000f) : 0);
                if (monthDiff > 0) {
                    if (monthDiff > 11) {
                        monthDiff = 11;
                    }

                    months = monthDiff;
                    res = months + (months == 1 ? " Month" : " Months") + " Ago";
                } else {
                    int dayDiff = Math.round((diff / (86400000f)) >= 1 ? (diff / (86400000f)) : 0);
                    if (dayDiff > 0) {
                        days = dayDiff;
                        if (days == 30) {
                            days = 29;
                        }
                        res = days + (days == 1 ? " Day" : " Days") + " Ago";
                    } else {
                        int hourDiff = Math.round((diff / (3600000f)) >= 1 ? (diff / (3600000f)) : 0);
                        if (hourDiff > 0) {
                            hours = hourDiff;
                            res = hours + (hours == 1 ? " Hour" : " Hours") + " Ago";
                        } else {
                            int minuteDiff = Math.round((diff / (60000f)) >= 1 ? (diff / (60000f)) : 0);
                            if (minuteDiff > 0) {
                                minutes = minuteDiff;
                                res = minutes + (minutes == 1 ? " Minute" : " Minutes") + " Ago";
                            } else {
                                int secondDiff = Math.round((diff / (1000f)) >= 1 ? (diff / (1000f)) : 0);
                                if (secondDiff > 0) {
                                    seconds = secondDiff;
                                } else {
                                    seconds = 1;
                                }
                                res = seconds + (seconds == 1 ? " Second" : " Seconds") + " Ago";
                            }
                        }
                    }
                }
            }
        }
        return res;
    }
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        Date date1 = new Date();
//        Date date2 = null;
//        PreparedStatement pst;
//        Connection con;
//        ResultSet rs;
//        Class.forName("com.mysql.jdbc.Driver");
//        DBConnector dbc = new DBConnector();
//        con = DriverManager.getConnection(dbc.getConstr());
//        pst = con.prepareStatement("SELECT regDate from hostel where hostid=28;");
//        rs = pst.executeQuery();
//        if (rs.next()) {
//            Timestamp t = rs.getTimestamp("regDate");
//            long milliseconds = t.getTime() + (t.getNanos() / 1000000);
//            date2 = new java.util.Date(milliseconds);
//        }
//
//        String res = PostedOnDates(date1, date2);
//        System.out.println(res);
//    }
}
