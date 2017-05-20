/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quickc.pack;

import java.util.Timer;

public class DBScheduler {

    Timer timer = new Timer();

    public void callScheduler() throws Exception {
        System.out.println("Scheduler Starterd...");
        timer.scheduleAtFixedRate(new Testing(), getTimePrecision("12h"), getTimePrecision("12h"));
    }

    public void stopScheduler() throws Exception {
        System.out.println("Scheduler stopped...");
        timer.cancel();
        timer.purge();
    }

    public long getTimePrecision(String value) throws Exception {
        long l = 0;
        String val = "";
        try {
            if (value.endsWith("d") || value.endsWith("D")) {
                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 24 * 60 * 60 * 1000;
            } else if (value.endsWith("h") || value.endsWith("H")) {

                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 60 * 60 * 1000;

            } else if (value.endsWith("m") || value.endsWith("M")) {
                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 60 * 1000;
            } else if (value.endsWith("s") || value.endsWith("S")) {

                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 1000;
            } else {

                l = Long.parseLong(value);
            }

        } catch (Exception e) {

            throw new Exception(e);
        }

        return l;
    }
//
//    public static void main(String a[]) throws Exception {
//        DBScheduler dbs = new DBScheduler();
//        dbs.callScheduler();
//    }
}