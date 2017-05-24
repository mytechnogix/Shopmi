package DAO;

import BO.ManageAdvBO;
import BO.ManageOfferBO;
import BO.ManageStoreBO;
import BO.ManageUsersBO;
import com.quickc.pack.DBConnector;
import com.quickc.pack.Email;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.spec.KeySpec;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Decoder;
import javax.crypto.spec.SecretKeySpec;

public class ManageDAO {

    String result = "";
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    public void addStoreDetails(ManageStoreBO objBO) throws SQLException {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("insert into storedetails(storename, category, storearea, city, websiteurl, services, workinghours, servicearea, closedon, subtype, maplocation, contact, fulladdress, email, addedBy, hindistorename) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, objBO.getStoreName());
            pst.setString(2, objBO.getStoreCat());
            pst.setString(3, objBO.getStoreArea());
            pst.setString(4, objBO.getCity());
            pst.setString(5, objBO.getUrl());
            pst.setString(6, objBO.getServices());
            pst.setString(7, objBO.getWorkingHours());
            pst.setString(8, objBO.getServiceArea());
            pst.setString(9, objBO.getClosedOn());
            pst.setString(10, objBO.getSubs());
            pst.setString(11, objBO.getMapLocation());
            pst.setString(12, objBO.getContact());
            pst.setString(13, objBO.getAddress());
            pst.setString(14, objBO.getEmail());
            pst.setString(15, objBO.getAddedBy());
            pst.setString(16, objBO.getStoreNameHindi());

            cnt = pst.executeUpdate();
            if (cnt > 0) {
                pst = con.prepareStatement("select storeid from storedetails where storename=? and category=?");
                pst.setString(1, objBO.getStoreName());
                pst.setString(2, objBO.getStoreCat());
                rs = pst.executeQuery();
                while (rs.next()) {
                    objBO.setStoreId(rs.getString("storeid"));
                }
//                String body = "Dear Abhishek/Tejas,\n";
//                body += "\n<b>Event Reminder for you</b>\n\n";
//                body += "Event Type : " + event + "\n";
//                body += "Event Date/Duration : " + start + " - " + end + "\n";
//                body += "Event Location : " + location + "\n";
//                body += "Client Name : " + name + "\n";
//                body += "Client Contact No. : " + mob + "\n\n";
//                body += "Thanks and Regards";
//
//                Email e = new Email();
//                String a[] = {"abkakad7@gmail.com", "tejasmohod@gmail.com"};
//                e.sendFromGMail("hashtagphotocorp@gmail.com", "#photography", a, "New Event Added :" + event, body);
//            
            } else {
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateStoreDetails(ManageStoreBO objBO) throws SQLException {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("update storedetails set storename=?, category=?, storearea=?, city=?, websiteurl=?, services=?, workinghours=?, servicearea=?, closedon=?, subtype=?, contact=?, fulladdress=?, email=?, hindistorename=? where storeid=?");
            pst.setString(1, objBO.getStoreName());
            pst.setString(2, objBO.getStoreCat());
            pst.setString(3, objBO.getStoreArea());
            pst.setString(4, objBO.getCity());
            pst.setString(5, objBO.getUrl());
            pst.setString(6, objBO.getServices());
            pst.setString(7, objBO.getWorkingHours());
            pst.setString(8, objBO.getServiceArea());
            pst.setString(9, objBO.getClosedOn());
            pst.setString(10, objBO.getSubs());
            pst.setString(11, objBO.getContact());
            pst.setString(12, objBO.getAddress());
            pst.setString(13, objBO.getEmail());
            pst.setString(14, objBO.getStoreNameHindi());
            pst.setString(15, objBO.getStoreId());

            cnt = pst.executeUpdate();
            if (cnt > 0) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addOfferDetails(ManageOfferBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_offers(?,?,?,?,?,?,?,?,?,?)}");
            // pst = con.prepareStatement("insert into offers(storeid, discount, discounton, totalcoupons, sDate, eDate, termsandcondition) values(?,?,?,?,?,?,?)");
            stmt.registerOutParameter(10, Types.INTEGER);
            stmt.setString(1, objBO.getStoreId());
            stmt.setString(2, objBO.getDiscount());
            stmt.setString(3, objBO.getDiscountOn());
            stmt.setInt(4, Integer.parseInt(objBO.getTotalCoupons()));
            stmt.setString(5, objBO.getStartOffer());
            stmt.setString(6, objBO.getEndOffer());
            stmt.setString(7, objBO.getTc());
            stmt.setString(8, "");
            stmt.setString(9, "1");
            stmt.setInt(10, 0);
            stmt.execute();
            objBO.setOid(stmt.getInt("_oid"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOfferDetails(ManageOfferBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_offers(?,?,?,?,?,?,?,?,?,?)}");
            // pst = con.prepareStatement("insert into offers(storeid, discount, discounton, totalcoupons, sDate, eDate, termsandcondition) values(?,?,?,?,?,?,?)");
            stmt.registerOutParameter(10, Types.INTEGER);
            stmt.setString(1, "");
            stmt.setString(2, objBO.getDiscount());
            stmt.setString(3, objBO.getDiscountOn());
            stmt.setInt(4, Integer.parseInt(objBO.getTotalCoupons()));
            stmt.setString(5, objBO.getStartOffer());
            stmt.setString(6, objBO.getEndOffer());
            stmt.setString(7, objBO.getTc());
            stmt.setString(8, "");
            stmt.setString(9, "2");
            stmt.setInt(10, objBO.getOid());
            stmt.execute();
            objBO.setOid(stmt.getInt("_oid"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStorePhoto(ManageStoreBO objBO) {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("update storedetails set photo=? where storeid=?");
            pst.setString(1, objBO.getStorePhoto());
            pst.setString(2, objBO.getStoreId());
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                objBO.setAddFlag(true);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateOfferPhoto(ManageOfferBO objBO) {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());

            CallableStatement stmt = con.prepareCall("{call sp_offers(?,?,?,?,?,?,?,?,?,?)}");
            // pst = con.prepareStatement("insert into offers(storeid, discount, discounton, totalcoupons, sDate, eDate, termsandcondition) values(?,?,?,?,?,?,?)");
            stmt.registerOutParameter(10, Types.INTEGER);
            stmt.setString(1, "");
            stmt.setString(2, "");
            stmt.setString(3, "");
            stmt.setInt(4, 0);
            stmt.setString(5, "");
            stmt.setString(6, "");
            stmt.setString(7, "");
            stmt.setString(8, objBO.getOfferPhoto());
            stmt.setString(9, "3");
            stmt.setInt(10, objBO.getOid());
            stmt.execute();
            cnt = stmt.getInt("_oid");
            if (cnt == 1) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void getAllStoreDetails(ManageStoreBO objBO) {
        try {
            String photo = "", photoSm = "", photoLg = "";
            int cnt = 0;

            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            Connection con = DriverManager.getConnection(dbc.getConstr());
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from storedetails where storeid=" + objBO.getStoreId() + "");

            while (rs.next()) {
                objBO.setStoreName(rs.getString("storename"));
                objBO.setStoreArea(rs.getString("storearea"));
                objBO.setContact(rs.getString("contact"));
                objBO.setServiceArea(rs.getString("servicearea"));
                objBO.setServices(rs.getString("services"));
                objBO.setClosedOn(rs.getString("closedon"));
                objBO.setStoreCat(rs.getString("category"));
                objBO.setWorkingHours(rs.getString("workinghours"));
                objBO.setUrl(rs.getString("websiteurl"));
                objBO.setCity(rs.getString("city"));
                objBO.setMapLocation(rs.getString("maplocation"));
                objBO.setRating(rs.getString("rating"));
                objBO.setContact(rs.getString("contact"));
                objBO.setVisitCount(rs.getString("visitcount"));
                objBO.setAddress(rs.getString("fulladdress"));
                objBO.setEmail(rs.getString("email"));
                photoSm = rs.getString("photo");
                System.out.println(">>>>>>> Photo: " + photo);
                if (photoSm.contains("default")) {
                    photoSm = "shopIcon_sm.png";
                    photoLg = "shopIcon_lg.png";
                }
                objBO.setStorePhoto(photoSm);
                objBO.setStorePhotoLg(photoLg);

            }
        } catch (Exception ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ManageOfferBO> getAllOfferDetails() throws Exception {
        int counter = 0;
        ManageOfferBO objBO = new ManageOfferBO();

        ArrayList<ManageOfferBO> myclass = new ArrayList<ManageOfferBO>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("Select * from view_offers where offerstatus='Active' order by timedate desc limit 20");
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO = new ManageOfferBO();
                objBO.setStoreName(rs.getString("storename"));
                objBO.setStoreId(rs.getString("storeid"));
                objBO.setOid(rs.getInt("oid"));
                objBO.setDiscount(rs.getString("discount"));
                objBO.setDiscountOn(rs.getString("discounton"));
                objBO.setTotalCoupons(rs.getString("totalcoupons"));
                objBO.setTc(rs.getString("termsandcondition"));
                objBO.setOfferPhoto(rs.getString("offerimg"));
                objBO.setStartOffer(rs.getString("sDate"));
                objBO.setEndOffer(rs.getString("eDate"));
                objBO.setTimedate(rs.getString("timedate"));
                objBO.setRedeemed(rs.getString("redeemed"));
                myclass.add(objBO);

                counter++;

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return myclass;
    }

    public static byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
        }
        return data;
    }

    public static SecretKey generateKeyFromPasswordWithSalt(String password, byte[] saltBytes) throws GeneralSecurityException {
        KeySpec keySpec = new PBEKeySpec(password.toCharArray(), saltBytes, 100, 128);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        SecretKey secretKey = keyFactory.generateSecret(keySpec);

        return new SecretKeySpec(secretKey.getEncoded(), "AES");
    }

    public static String decryptAESEncryptWithSaltAndIV(String encryptedData, String key, String salt, String iv) throws Exception {

        byte[] saltBytes = hexStringToByteArray(salt);
        byte[] ivBytes = hexStringToByteArray(iv);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);
        SecretKeySpec sKey = (SecretKeySpec) generateKeyFromPasswordWithSalt(key, saltBytes);

        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.DECRYPT_MODE, sKey, ivParameterSpec);
        byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
        byte[] decValue = c.doFinal(decordedValue);
        String decryptedValue = new String(decValue);

        return decryptedValue;
    }
    private static final byte[] keyValue =
            new byte[]{'T', 'h', 'e', 'B', 'e', 's', 't', 'S', 'e', 'c', 'r', 'e', 't', 'K', 'e', 'y'};

    public Key generateSecret() {
        Key key = new SecretKeySpec(keyValue, "AES");
        return key;
    }

    public void getOffer(ManageOfferBO objBO) {
        try {
            String coupon = "abcccdd";

            //coupon code logic here


            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_coupon(?,?,?,?,?,?)}");
            stmt.registerOutParameter(6, Types.INTEGER);
            stmt.setString(1, objBO.getStoreId());
            stmt.setString(2, objBO.getUid());
            stmt.setString(3, coupon);
            stmt.setString(4, "1");
            stmt.setInt(5, objBO.getOid());
            stmt.setInt(6, 0);
            stmt.executeQuery();

            if (stmt.getInt("_cid") == 1) {
                objBO.setCoupon(coupon);
            } else if (stmt.getInt("_cid") == 2) {
                objBO.setCoupon("2");
            } else if (stmt.getInt("_cid") == 3) {
                objBO.setCoupon("3");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addAdvertiseDetails(ManageAdvBO objBO) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_adv(?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(9, Types.INTEGER);
            stmt.setString(1, objBO.getStoreId());
            stmt.setString(2, objBO.getAdvTitle());
            stmt.setString(3, objBO.getAdvDesc());
            stmt.setString(4, objBO.getStartAdv());
            stmt.setString(5, objBO.getEndAdv());
            stmt.setString(6, objBO.getTc());
            stmt.setString(7, "");
            stmt.setString(8, "1");
            stmt.setInt(9, 0);
            stmt.executeQuery();
            objBO.setAid(stmt.getInt("_aid"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAdvertiseDetails(ManageAdvBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_adv(?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(9, Types.INTEGER);
            stmt.setString(1, objBO.getStoreId());
            stmt.setString(2, objBO.getAdvTitle());
            stmt.setString(3, objBO.getAdvDesc());
            stmt.setString(4, objBO.getStartAdv());
            stmt.setString(5, objBO.getEndAdv());
            stmt.setString(6, objBO.getTc());
            stmt.setString(7, "");
            stmt.setString(8, "2");
            stmt.setInt(9, objBO.getAid());
            stmt.executeQuery();
            objBO.setAid(stmt.getInt("_aid"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAdvPhoto(ManageAdvBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_adv(?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(9, Types.INTEGER);
            stmt.setString(1, "");
            stmt.setString(2, "");
            stmt.setString(3, "");
            stmt.setString(4, "");
            stmt.setString(5, "");
            stmt.setString(6, "");
            stmt.setString(7, objBO.getAdvPhoto());
            stmt.setString(8, "3");
            stmt.setInt(9, objBO.getAid());
            stmt.executeQuery();

            if (stmt.getInt("_aid") == 1) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePopularCats() throws SQLException {
        int cnt = 0;
        String[] cats = new String[5];
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("select category, count(*) as frequency from log_popular group by category order by count(*) desc limit 5;");
            rs = pst.executeQuery();
            while (rs.next()) {
                cats[cnt] = rs.getString("category");
                cnt++;
            }
            pst = con.prepareStatement("update popularCats set cat1=?, cat2=?, cat3=?, cat4=?, cat5=? where catid=1");
            pst.setString(1, cats[0]);
            pst.setString(2, cats[1]);
            pst.setString(3, cats[2]);
            pst.setString(4, cats[3]);
            pst.setString(5, cats[4]);
            pst.executeUpdate();
            con.close();
            System.out.println("Cats Updated!!");
        } catch (Exception ex) {
            con.close();
            ex.printStackTrace();
        }
    }

    public long getTimePrecision(String value) throws Exception {
        long l = 0;
        String val = "";
        try {
            if (value.endsWith("d") || value.endsWith("D")) {
                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 24 * 60 * 60 * 1000;
            } else if (value.endsWith("h") || value.endsWith("H")) {

                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 60 * 60 * 1000;

            } else if (value.endsWith("m") || value.endsWith("M")) {
                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 60 * 1000;
            } else if (value.endsWith("s") || value.endsWith("S")) {

                val = value.substring(0, value.length() - 1);
                l = Long.parseLong(val) * 1000;
            } else {

                l = Long.parseLong(value);
            }
        } catch (Exception e) {

            throw new Exception(e);
        }
        return l;
    }

    public void addUser(ManageUsersBO objBO) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_user(?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(7, Types.INTEGER);
            stmt.setString(1, objBO.getEmail());
            stmt.setString(2, objBO.getFnm());
            stmt.setString(3, objBO.getLnm());
            stmt.setString(4, objBO.getPass());
            stmt.setString(5, objBO.getNewsFrom());
            stmt.setString(6, "1");
            stmt.setInt(7, 0);
            stmt.executeQuery();
            objBO.setFlag(stmt.getInt("_flag"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ManageStoreBO> getRecentStores() throws Exception {
        ManageStoreBO objBO = new ManageStoreBO();

        ArrayList<ManageStoreBO> myclass = new ArrayList<ManageStoreBO>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("SELECT storeid,storename, storearea,city, photo FROM storedetails WHERE regDate BETWEEN NOW() - INTERVAL 30 DAY AND NOW() order by regDate desc limit 12");
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO = new ManageStoreBO();
                objBO.setStoreName(rs.getString("storename"));
                objBO.setStoreId(rs.getString("storeid"));
                objBO.setStoreArea(rs.getString("storearea"));
                objBO.setCity(rs.getString("city"));
                objBO.setStorePhotoLg(rs.getString("photo"));
                myclass.add(objBO);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return myclass;
    }
}