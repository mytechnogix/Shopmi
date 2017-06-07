/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quickc.pack;

import java.util.*;
import java.text.*;

public class demoCalendar1 {

    public final static String[] monthcalender = {
        "January", "February", "March", "April", "May", "June", "July",
        "August", "September", "October", "November", "December"};
    public final static int daysinmonths[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    private void displayMonth(int month, int year) {

        // The number of days to leave blank at
        // the start of this month.

        int blankdays = 0;
        System.out.println("  " + monthcalender[month] + " " + year);

        if (month < 0 || month > 11) {
            throw new IllegalArgumentException(
                    "Month " + month + " is not valid and must lie in between 0 and 11");
        }

        GregorianCalendar cldr = new GregorianCalendar(year, month, 1);
        System.out.println("Sunday Monday Tuesday Wednesday Thursday Friday Saturday");

        // Compute how much to leave before before the first day of the month.
        // getDay() returns 0 for Sunday.

        blankdays = cldr.get(Calendar.DAY_OF_WEEK) - 1;
        int daysInMonth = daysinmonths[month];

        if (cldr.isLeapYear(cldr.get(Calendar.YEAR)) && month == 1) {

            ++daysInMonth;
        }

        // Blank out the labels before 1st day of the month
        for (int i = 0; i < blankdays; i++) {
            System.out.print("   ");
        }

        for (int i = 1; i <= daysInMonth; i++) {

            // This "if" statement is simpler than messing with NumberFormat
            if (i <= 9) {
                System.out.print(" ");
            }
            System.out.print(i);

            if ((blankdays + i) % 7 == 0) { // Wrap if EOL
                System.out.println();
            } else {
                System.out.print(" ");
            }
        }
    }

    public static void main(String[] args) {

        int mon, yr;
        demoCalendar1 moncldr = new demoCalendar1();

//        if (args.length == 2) {
//            moncldr.displayMonth(Integer.parseInt(args[0]) - 1, Integer.parseInt(args[1]));
//        } else {
            Calendar todaycldr = Calendar.getInstance();
            moncldr.displayMonth(todaycldr.get(Calendar.MONTH), todaycldr.get(Calendar.YEAR));
       // }
    }
}