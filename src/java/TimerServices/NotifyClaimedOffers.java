package TimerServices;

import DAO.ManageDAO;
import java.sql.SQLException;
import java.util.Date;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

public class NotifyClaimedOffers extends TimerTask {

    public void run() {
        System.out.println("called notify claimed offer timer job------------" + new Date());
        ManageDAO objDAO = new ManageDAO();
        try {
            objDAO.updateClaimedOfferStatus();
        } catch (SQLException ex) {
            Logger.getLogger(NotifyClaimedOffers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}