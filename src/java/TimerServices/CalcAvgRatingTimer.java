package TimerServices;

import DAO.ManageDAO;
import java.sql.SQLException;
import java.util.Date;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CalcAvgRatingTimer extends TimerTask {

    public void run() {
        System.out.println("called------------" + new Date());
        ManageDAO objDAO = new ManageDAO();
        try {
            objDAO.calcAvgRating();
        } catch (SQLException ex) {
            Logger.getLogger(CalcAvgRatingTimer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}