package com.quickc.pack;

public class DBConnector {

    private String constr;

    public DBConnector() {
        constr = "jdbc:mysql://localhost:3306/shoppee?useUnicode=yes&characterEncoding=UTF-8&user=root&password=ROOT";
        //constr = "jdbc:mysql://localhost:3306/shoppee?useUnicode=yes&characterEncoding=UTF-8&user=ankush&password=Ankush@02&useInformationSchema=true";

    }

    public String getConstr() {
        return (constr);
    }
}
