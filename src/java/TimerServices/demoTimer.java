/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TimerServices;

import java.util.*;

public class demoTimer {
   public static void main(String[] args) {
      TimerTask tasknew = new PopularCatsTimer();
      Timer timer = new Timer();
      timer.scheduleAtFixedRate(tasknew,500,30000);      
   }
}