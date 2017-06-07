package com.quickc.pack;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Scanner;

public class demoCalendar2 {

    public static void main(String[] args) {
        // represents the month (1-12)
        int month;
        int year;
        Scanner in = new Scanner(System.in);
        System.out.print("Enter month and year: ");
        String monthText = in.next();
        String yearText = in.next();
        in.close();
        try {
            month = Integer.parseInt(monthText);
            year = Integer.parseInt(yearText);
            if (month < 1 || month > 12) {
                throw new Exception("Invalid index for month: " + month);
            }
            printCalendarMonthYear(month, year);
        } catch (NumberFormatException e) {
            System.err.println("Number Format Error: " + e.getMessage());
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    private static void printCalendarMonthYear(int month, int year) {
        Calendar cal = new GregorianCalendar();
        // set its date to the first day of the month/year given by user
        cal.clear();
        cal.set(year, month - 1, 1);

        // print calendar header
        System.out.println("\n"
                + cal.getDisplayName(Calendar.MONTH, Calendar.LONG,
                Locale.US) + " " + cal.get(Calendar.YEAR));

        // obtain the weekday of the first day of month.
        int firstWeekdayOfMonth = cal.get(Calendar.DAY_OF_WEEK);

        // obtain the number of days in month.
        int numberOfMonthDays = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        // print anonymous calendar month based on the weekday of the first
        // day of the month and the number of days in month:
        printCalendar(numberOfMonthDays, firstWeekdayOfMonth);
    }

    /*
     * 	prints an anonymous calendar month based on the weekday of the first
     *  day of the month and the number of days in month:
     */
    private static void printCalendar(int numberOfMonthDays, int firstWeekdayOfMonth) {

        // reset index of weekday
        int weekdayIndex = 0;

        // print calendar weekday header
        System.out.println("Su  Mo  Tu  We  Th  Fr  Sa");

        // leave/skip weekdays before the first day of month
        for (int day = 1; day < firstWeekdayOfMonth; day++) {
            System.out.print("    ");
            weekdayIndex++;
        }

        // print the days of month in tabular format.
        for (int day = 1; day <= numberOfMonthDays; day++) {
            // print day
            System.out.printf("%1$2d", day);

            // next weekday
            weekdayIndex++;
            // if it is the last weekday
            if (weekdayIndex == 7) {
                // reset it
                weekdayIndex = 0;
                // and go to next line
                System.out.println();
            } else { // otherwise
                // print space
                System.out.print("  ");
            }
        }
        // print a final new-line.
        System.out.println();
    }
}