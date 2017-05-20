/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quickc.pack;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Autocomplete {

    int cnt = 0;
    Statement stmt;
    Connection con;
    ResultSet rs;
    String storeName = "";
    int storeId = 0;

    public String[] GetCustomers(String query) throws Exception {
//        List<String> customers = new List<String>();
        //  List customers = new ArrayList();
        String[] arr = new String[10];
        Class.forName("com.mysql.jdbc.Driver");
        DBConnector dbc = new DBConnector();
        con = DriverManager.getConnection(dbc.getConstr(), "root", "ROOT");
        rs = stmt.executeQuery("Select * from storedetails where location LIKE '%" + query + "%' or storename LIKE '%" + query + "%' or city LIKE '%" + query + "%'");

        while (rs.next()) {
            storeId = rs.getInt("storeid");
            storeName = rs.getString("storename");

            arr[cnt] = rs.getString("storename");
            // .Add(rs.getString("storename"), rs.getInt("storeid"));

            cnt++;
            System.out.print("<a href='storeDetails.jsp?id=" + storeId + "'>" + storeName + "</a>");
        }
        return arr;
    }
}
