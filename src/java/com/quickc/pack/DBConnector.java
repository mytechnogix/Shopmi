package com.quickc.pack;

public class DBConnector {

    private String constr;

    public DBConnector() {
        constr = "jdbc:mysql://localhost:3306/shopmi?user=root&password=ROOT";
        //constr = "jdbc:mysql://mysql32811-rajshree.cloud.hostnet.nl/hca?user=root&password=TRSilk10888";
    }

    public String getConstr() {
        return (constr);
    }
}
