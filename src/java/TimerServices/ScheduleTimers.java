package TimerServices;

import DAO.ManageDAO;
import java.util.Timer;
import java.util.TimerTask;

public class ScheduleTimers {

    ManageDAO objDAO = new ManageDAO();

    public void PopularCats() throws Exception {
        TimerTask tasknew = new PopularCatsTimer();
        Timer timer = new Timer();
        //runs after every 24 hours from starting time
        timer.scheduleAtFixedRate(tasknew, 500, 86400000);
        
    }
}