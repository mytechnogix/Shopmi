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

    public void CalcAvgRating() throws Exception {
        TimerTask tasknew = new CalcAvgRatingTimer();
        Timer timer = new Timer();
        //runs after every 12 hours from starting time
        timer.scheduleAtFixedRate(tasknew, 500, 43200000);

    }

    public void updateClaimedOfferStatusJob() throws Exception {
        TimerTask tasknew = new NotifyClaimedOffers();
        Timer timer = new Timer();
        //runs after every 1 hours from starting time
        timer.scheduleAtFixedRate(tasknew, 500, 3600000);

    }
}