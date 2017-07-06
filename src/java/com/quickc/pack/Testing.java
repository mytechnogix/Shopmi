/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quickc.pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Testing extends TimerTask {

    String eventName = "", eventDate = "", location = "", clientName = "", clientContact = "", days = "";
    int cnt = 0, id = 0;
    PreparedStatement pst;
    ResultSet rs, rs1;
    Connection con;

    public void run() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());

            pst = con.prepareStatement("select id from events");
            rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                pst = con.prepareStatement("SELECT DATEDIFF((select sDate from events where id=? ),current_timestamp) AS days;");
                pst.setInt(1, id);
                rs1 = pst.executeQuery();
                while (rs1.next()) {
                    days = rs1.getString("days");
                    if (days.equals("1")) {
                        sendReminder(id);
                    }
                }
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Testing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Testing.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void sendReminder(int id) {

        String sub = "", body = "", name = "", event = "", start = "", end = "", mob = "", location = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());

            pst = con.prepareStatement("select * from events where id=? and  status='Pending' and notify='false'");
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                location = rs.getString("location");
                start = rs.getString("sDate");
                end = rs.getString("eDate");
                name = rs.getString("clientname");
                mob = rs.getString("clientmob");
                event = rs.getString("eventname");
            }
            sub = "Event Reminder!";
            body = "Dear Abhishek/Tejas,\n";
            body += "\n**Event Reminder for you**\n\n";
            body += "Event Type : " + event + "\n";
            body += "Event Date/Duration : " + start + " to " + end + "\n";
            body += "Event Location : " + location + "\n";
            body += "Client Name : " + name + "\n";
            body += "Client Contact No. : " + mob + "\n\n";
            body += "Thanks and Regards";

            GMailServer sender = new GMailServer("hashtagphotocorp@gmail.com", "#photography");

            try {
//                sender.sendMail(sub, body, "hashtagphotocorp@gmail.com", "abkakad7@gmail.com");
                //              sender.sendMail(sub, body, "hashtagphotocorp@gmail.com", "anistane95@gmail.com");

                pst = con.prepareStatement("update events set notify='true' where id=?");
                pst.setInt(1, id);
                pst.executeUpdate();
                
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("Email Sent Succesfully...");

        } catch (SQLException ex) {
            Logger.getLogger(Testing.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Testing.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}