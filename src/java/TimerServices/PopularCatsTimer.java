package TimerServices;

import DAO.ManageDAO;
import com.quickc.pack.DBConnector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PopularCatsTimer extends TimerTask {

    @Override
    public void run() {
        System.out.println("called------------"+new Date());
        ManageDAO objDAO = new ManageDAO();
        try {
            objDAO.updatePopularCats();
        } catch (SQLException ex) {
            Logger.getLogger(PopularCatsTimer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}