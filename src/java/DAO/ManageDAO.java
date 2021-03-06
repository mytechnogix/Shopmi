package DAO;

import BO.*;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;
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
    PreparedStatement pst, pst1;
    ResultSet rs;

    public int updatePhotos(String id, String type, String imgName, String imgCount) {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            if (type.equals("store")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update storedetails set photo=? where storeid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update storedetails set photo2=? where storeid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update storedetails set photo3=? where storeid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            } else if (type.equals("mes")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update mes set photo=? where mesid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update mes set photo2=? where mesid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update mes set photo3=? where mesid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            } else if (type.equals("hall")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update halls set photo=? where hallid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update halls set photo2=? where hallid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update halls set photo3=? where hallid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            } else if (type.equals("hostel")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update hostel set photo=? where hostid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update hostel set photo2=? where hostid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update hostel set photo3=? where hostid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            }
            cnt = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return cnt;
    }

    public int busUpdatePhotos(String id, String type, String imgName, String imgCount) {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            if (type.equals("store")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update storedetails set photo=?, storestatus='Data Changed' where storeid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update storedetails set photo2=?, storestatus='Data Changed'  where storeid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update storedetails set photo3=?, storestatus='Data Changed' where storeid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            } else if (type.equals("mes")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update mes set photo=?, messtatus='Data Changed' where mesid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update mes set photo2=?, messtatus='Data Changed' where mesid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update mes set photo3=?, messtatus='Data Changed' where mesid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            } else if (type.equals("hall")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update halls set photo=?, status='Data Changed' where hallid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update halls set photo2=?, status='Data Changed' where hallid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update halls set photo3=?, status='Data Changed' where hallid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            } else if (type.equals("hostel")) {
                if (imgCount.equals("1")) {
                    pst = con.prepareStatement("update hostel set photo=?, hoststatus='Data Changed' where hostid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("2")) {
                    pst = con.prepareStatement("update hostel set photo2=?, hoststatus='Data Changed' where hostid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                } else if (imgCount.equals("3")) {
                    pst = con.prepareStatement("update hostel set photo3=?, hoststatus='Data Changed' where hostid=?");
                    pst.setString(1, imgName);
                    pst.setString(2, id);
                }
            }
            cnt = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return cnt;
    }

    public void addStoreDetails(ManageStoreBO objBO) throws SQLException {
        int cnt = 0;
        String storeid = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("insert into storedetails(storename, category, storearea, city, websiteurl, services, workinghours, servicearea, closedon, subtype, maplocation, contact, fulladdress, email, addedBy, hindistorename, phone, pass) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
            pst.setString(17, objBO.getPhone());
            pst.setString(18, objBO.getContact());
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                pst = con.prepareStatement("select storeid, gurkha from storedetails where storename=? and email=?;");
                pst.setString(1, objBO.getStoreName());
                pst.setString(2, objBO.getEmail());
                rs = pst.executeQuery();
                if (rs.next()) {
                    storeid = rs.getString("storeid");
                    pst1 = con.prepareStatement("insert into search values(?,?,?,?,?,?,?);");
                    pst1.setInt(1, Integer.parseInt(storeid));
                    pst1.setString(2, "store");
                    pst1.setString(3, objBO.getStoreName());
                    pst1.setString(4, objBO.getStoreArea());
                    pst1.setString(5, objBO.getMetadata());
                    pst1.setString(6, "Pending");
                    pst1.setString(7, rs.getString("gurkha"));
                    pst1.executeUpdate();
                    objBO.setStoreId(storeid);
                }
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
            pst = con.prepareStatement("update storedetails set storename=?, category=?, storearea=?, city=?, websiteurl=?, services=?, workinghours=?, servicearea=?, closedon=?, subtype=?, contact=?, fulladdress=?, email=?, hindistorename=?, phone=?, pass=? where storeid=?");
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
            pst.setString(15, objBO.getPhone());
            pst.setString(16, objBO.getPassword());
            pst.setString(17, objBO.getStoreId());

            cnt = pst.executeUpdate();
            if (cnt > 0) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addBusinessDetails(ManageStoreBO objBO) throws SQLException {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());

            if (objBO.getStoreCat().equals("store")) {
                pst = con.prepareStatement("select storename from storedetails where email=?");
                pst.setString(1, objBO.getEmail());
                rs = pst.executeQuery();
                if (!rs.next()) {
                    pst = con.prepareStatement("insert into storedetails(storename, category, services, storearea, email, contact, phone, websiteurl, fulladdress, city, pass, busadd) values(?,?,?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1, objBO.getStoreName());
                    pst.setString(2, objBO.getStoreCat());
                    pst.setString(3, objBO.getServices());
                    pst.setString(4, objBO.getStoreArea());
                    pst.setString(5, objBO.getEmail());
                    pst.setString(6, objBO.getContact());
                    pst.setString(7, objBO.getPhone());
                    pst.setString(8, objBO.getUrl());
                    pst.setString(9, objBO.getAddress());
                    pst.setString(10, objBO.getCity());
                    pst.setString(11, objBO.getContact());
                    pst.setString(12, "Active");
                    cnt = pst.executeUpdate();
                } else {
                    cnt = 2;
                }
            } else if (objBO.getStoreCat().equals("hall")) {
                pst = con.prepareStatement("select hallname from halls where email=?");
                pst.setString(1, objBO.getEmail());
                rs = pst.executeQuery();
                if (!rs.next()) {
                    pst = con.prepareStatement("insert into halls(hallname, services, hall_area, email, contact, phone, websiteurl, fulladdress, city, pass, busadd) values(?,?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1, objBO.getStoreName());
                    pst.setString(2, objBO.getServices());
                    pst.setString(3, objBO.getStoreArea());
                    pst.setString(4, objBO.getEmail());
                    pst.setString(5, objBO.getContact());
                    pst.setString(6, objBO.getPhone());
                    pst.setString(7, objBO.getUrl());
                    pst.setString(8, objBO.getAddress());
                    pst.setString(9, objBO.getCity());
                    pst.setString(10, objBO.getContact());
                    pst.setString(11, "Active");
                    cnt = pst.executeUpdate();
                } else {
                    cnt = 2;
                }
            } else if (objBO.getStoreCat().equals("mes")) {
                pst = con.prepareStatement("select mesname from mes where email=?");
                pst.setString(1, objBO.getEmail());
                rs = pst.executeQuery();
                if (!rs.next()) {
                    pst = con.prepareStatement("insert into mes(mesname, services, mesarea, email, contact, phone, websiteurl, address, city, pass, busadd) values(?,?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1, objBO.getStoreName());
                    pst.setString(2, objBO.getServices());
                    pst.setString(3, objBO.getStoreArea());
                    pst.setString(4, objBO.getEmail());
                    pst.setString(5, objBO.getContact());
                    pst.setString(6, objBO.getPhone());
                    pst.setString(7, objBO.getUrl());
                    pst.setString(8, objBO.getAddress());
                    pst.setString(9, objBO.getCity());
                    pst.setString(10, objBO.getContact());
                    pst.setString(11, "Active");
                    cnt = pst.executeUpdate();
                } else {
                    cnt = 2;
                }
            } else if (objBO.getStoreCat().equals("hostel")) {
                pst = con.prepareStatement("select hostname from hostel where email=?");
                pst.setString(1, objBO.getEmail());
                rs = pst.executeQuery();
                if (!rs.next()) {
                    pst = con.prepareStatement("insert into hostel(hostname, description, hostarea, email, contact, phone, websiteurl, address, city, pass, busadd) values(?,?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1, objBO.getStoreName());
                    pst.setString(2, objBO.getServices());
                    pst.setString(3, objBO.getStoreArea());
                    pst.setString(4, objBO.getEmail());
                    pst.setString(5, objBO.getContact());
                    pst.setString(6, objBO.getPhone());
                    pst.setString(7, objBO.getUrl());
                    pst.setString(8, objBO.getAddress());
                    pst.setString(9, objBO.getCity());
                    pst.setString(10, objBO.getContact());
                    pst.setString(11, "Active");
                    cnt = pst.executeUpdate();
                } else {
                    cnt = 2;
                }
            }

            if (cnt == 1) {
                String body = "Dear Customer,\n";
                body += "\nBusiness Details Added - MyShejari.com\n\n";
                body += "Your " + objBO.getStoreName() + "  business is now part of MyShejari.com\n";
                body += "Team MyShejari.com will connect you soon\n";
                body += "Your Business ID and Password is as follows : \n";
                body += "Business ID : " + objBO.getEmail() + "\n";
                body += "Password : " + objBO.getContact() + "\n\n";
                body += "Thanks and Regards";

                Email e = new Email();
                String a[] = {objBO.getEmail()};
                e.sendFromGMail("team@myshejari.com", "Ankush@02", a, "MyShejari.com - Business Added Successfully", body);
                objBO.setStoreId("1");
            } else if (cnt == 2) {
                objBO.setStoreId("2");
            } else {
                objBO.setStoreId("0");
            }
            //System.err.println("<<<<<<<<<<<<<<<<<<<<<<<<<< business output : " + objBO.getStoreId() + ", " + cnt);
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

            pst = con.prepareStatement("select * from offers where storeid=? and offerstatus='Active' or storeid=? and offerstatus='Pending'");
            pst.setString(1, objBO.getStoreId());
            pst.setString(2, objBO.getStoreId());
            rs = pst.executeQuery();
            if (!rs.next()) {
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
                if (stmt.getInt("_oid") > 0) {
                    objBO.setOid(1);
                }
                con.close();
            } else {
                objBO.setOid(2);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            con.close();
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

    public void sUpdateOfferPhoto(ManageOfferBO objBO) {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("update offers set offerimg=?, offerstatus='Pending' where storeid=?");
            pst.setString(1, objBO.getOfferPhoto());
            pst.setString(2, objBO.getStoreId());
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void getAllStoreDetails(ManageStoreBO objBO) {
        try {
            String photo = "", photoSm = "", photoLg = "", photo2 = "", photo3 = "";
            int cnt = 0;
            objBO.setAddFlag(false);
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("Select * from storedetails where gurkha=?");
            pst.setString(1, objBO.getGurkha());
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO.setAddFlag(true);
                objBO.setStoreId(rs.getString("storeid"));
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
                objBO.setPhone(rs.getString("phone"));
                objBO.setVisitCount(rs.getString("visitcount"));
                objBO.setReviewCount(rs.getString("reviewcount"));
                objBO.setAddress(rs.getString("fulladdress"));
                objBO.setEmail(rs.getString("email"));
                photoSm = rs.getString("photo");
                photo2 = rs.getString("photo2");
                photo3 = rs.getString("photo3");

                photoLg = photoSm;
                if (photoSm.contains("default")) {
                    photoSm = "shopIcon_sm.png";
                    photoLg = "shopIcon_lg.png";
                }
                if (photo2.contains("default")) {
                    photo2 = "shopIcon_lg.png";
                }
                if (photo3.contains("default")) {
                    photo3 = "shopIcon_lg.png";
                }
                objBO.setStorePhoto2(photo2);
                objBO.setStorePhoto3(photo3);
                objBO.setStorePhoto(photoSm);
                objBO.setStorePhotoLg(photoLg);

            }
            con.close();




        } catch (Exception ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
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
                objBO.setGurkha(rs.getString("gurkha"));
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
            con.close();
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
            String coupon = "";
            String a[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
            String A[] = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"};
            String no[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

            Random random = new Random();
            int n1 = (Math.abs(random.nextInt()) % 25) + 1;
            int n2 = (Math.abs(random.nextInt()) % 9) + 1;
            coupon = "MSC@" + shuffle(a[n1] + A[n1] + objBO.getStoreId().substring(0, 1) + no[n2] + objBO.getUid().substring(0, 1));
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
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String shuffle(String input) {
        List<Character> characters = new ArrayList<Character>();
        for (char c : input.toCharArray()) {
            characters.add(c);
        }
        StringBuilder output = new StringBuilder(input.length());
        while (!characters.isEmpty()) {
            int randPicker = (int) (Math.random() * characters.size());
            output.append(characters.remove(randPicker));
        }
        return output.toString();
    }

    public void addAdvertiseDetails(ManageAdvBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_adv(?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(10, Types.INTEGER);
            stmt.setString(1, objBO.getStoreId());
            stmt.setString(2, objBO.getAdvTitle());
            stmt.setString(3, objBO.getAdvDesc());
            stmt.setString(4, objBO.getStartAdv());
            stmt.setString(5, objBO.getEndAdv());
            stmt.setString(6, objBO.getTc());
            stmt.setString(7, "");
            stmt.setString(8, objBO.getSubType());
            stmt.setString(9, "1");
            stmt.setInt(10, 0);
            stmt.executeQuery();
            objBO.setAid(stmt.getInt("_aid"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAdvertiseDetails(ManageAdvBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_adv(?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(10, Types.INTEGER);
            stmt.setString(1, objBO.getStoreId());
            stmt.setString(2, objBO.getAdvTitle());
            stmt.setString(3, objBO.getAdvDesc());
            stmt.setString(4, objBO.getStartAdv());
            stmt.setString(5, objBO.getEndAdv());
            stmt.setString(6, objBO.getTc());
            stmt.setString(7, "");
            stmt.setString(8, objBO.getSubType());
            stmt.setString(9, "2");
            stmt.setInt(10, objBO.getAid());
            stmt.executeQuery();
            objBO.setAid(stmt.getInt("_aid"));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAdvPhoto(ManageAdvBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_adv(?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(10, Types.INTEGER);
            stmt.setString(1, "");
            stmt.setString(2, "");
            stmt.setString(3, "");
            stmt.setString(4, "");
            stmt.setString(5, "");
            stmt.setString(6, "");
            stmt.setString(7, objBO.getAdvPhoto());
            stmt.setString(8, "");
            stmt.setString(9, "3");
            stmt.setInt(10, objBO.getAid());
            stmt.executeQuery();

            if (stmt.getInt("_aid") == 1) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
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

    public void calcAvgRating() throws SQLException {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("SELECT count(review) AS reviewcount, avg(rating) avgrating, storeid FROM reviewstore GROUP BY storeid order by storeid desc");
            rs = pst.executeQuery();
            while (rs.next()) {
                pst = con.prepareStatement("update storedetails set rating=?, reviewcount=? where storeid=?");
                pst.setString(1, rs.getString("avgrating"));
                pst.setString(2, rs.getString("reviewcount"));
                pst.setString(3, rs.getString("storeid"));
                pst.executeUpdate();
            }
            con.close();
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
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ManageStoreBO> getRecentStores() throws Exception {
        ManageStoreBO objBO = new ManageStoreBO();

        ArrayList<ManageStoreBO> myclass = new ArrayList<ManageStoreBO>();
        String photoSm = "", photoLg = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("SELECT storeid,storename, storearea,city, photo, gurkha FROM storedetails WHERE storestatus='Active' and regDate BETWEEN NOW() - INTERVAL 30 DAY AND NOW() order by regDate desc limit 16");
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO = new ManageStoreBO();
                objBO.setStoreName(rs.getString("storename"));
                objBO.setStoreId(rs.getString("storeid"));
                objBO.setStoreArea(rs.getString("storearea"));
                objBO.setCity(rs.getString("city"));
                objBO.setGurkha(rs.getString("gurkha"));
                photoSm = rs.getString("photo");
                photoLg = photoSm;
                if (photoSm.contains("default")) {
                    photoSm = "shopIcon_sm.png";
                    photoLg = "shopIcon_lg.png";
                }
                objBO.setStorePhoto(photoSm);
                objBO.setStorePhotoLg(photoLg);
                //objBO.setStorePhotoLg(rs.getString("photo"));
                myclass.add(objBO);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return myclass;
    }

    public void addHallDetails(ManageHallBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_hall(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(18, Types.INTEGER);
            stmt.setString(1, objBO.getHallName());
            stmt.setString(2, objBO.getHallNameHindi());
            stmt.setInt(3, objBO.getHallAreaSqft());
            stmt.setString(4, objBO.getHallArea());
            stmt.setString(5, objBO.getAddress());
            stmt.setString(6, objBO.getContact());
            stmt.setString(7, objBO.getUrl());
            stmt.setString(8, objBO.getEmail());
            stmt.setString(9, objBO.getHallServices());
            stmt.setString(10, objBO.getMapLocation());
            stmt.setString(11, objBO.getCity());
            stmt.setString(12, objBO.getSubType());
            stmt.setString(13, objBO.getAddedBy());
            stmt.setString(14, objBO.getPhoto());
            stmt.setString(15, objBO.getMetadata());
            stmt.setString(16, objBO.getPhone());
            stmt.setString(17, objBO.getPassword());
            stmt.setInt(18, 0);
            stmt.setString(19, "1");
            stmt.execute();
            objBO.setHallId(String.valueOf(stmt.getInt("_hid")));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateHallDetails(ManageHallBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_hall(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(18, Types.INTEGER);
            stmt.setString(1, objBO.getHallName());
            stmt.setString(2, objBO.getHallNameHindi());
            stmt.setInt(3, objBO.getHallAreaSqft());
            stmt.setString(4, objBO.getHallArea());
            stmt.setString(5, objBO.getAddress());
            stmt.setString(6, objBO.getContact());
            stmt.setString(7, objBO.getUrl());
            stmt.setString(8, objBO.getEmail());
            stmt.setString(9, objBO.getHallServices());
            stmt.setString(10, objBO.getMapLocation());
            stmt.setString(11, objBO.getCity());
            stmt.setString(12, objBO.getSubType());
            stmt.setString(13, objBO.getAddedBy());
            stmt.setString(14, objBO.getPhoto());
            stmt.setString(15, objBO.getMetadata());
            stmt.setString(16, objBO.getPhone());
            stmt.setString(17, objBO.getPassword());
            stmt.setString(18, objBO.getHallId());
            stmt.setString(19, "2");
            stmt.execute();
            if (stmt.getInt("_hid") == 1) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateHallPhoto(ManageHallBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_hall(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(18, Types.INTEGER);
            stmt.setString(1, objBO.getHallName());
            stmt.setString(2, objBO.getHallNameHindi());
            stmt.setInt(3, objBO.getHallAreaSqft());
            stmt.setString(4, objBO.getHallArea());
            stmt.setString(5, objBO.getAddress());
            stmt.setString(6, objBO.getContact());
            stmt.setString(7, objBO.getUrl());
            stmt.setString(8, objBO.getEmail());
            stmt.setString(9, objBO.getHallServices());
            stmt.setString(10, objBO.getMapLocation());
            stmt.setString(11, objBO.getCity());
            stmt.setString(12, objBO.getSubType());
            stmt.setString(13, objBO.getAddedBy());
            stmt.setString(14, objBO.getPhoto());
            stmt.setString(15, objBO.getMetadata());
            stmt.setString(16, objBO.getPhone());
            stmt.setString(17, objBO.getPassword());
            stmt.setString(18, objBO.getHallId());
            stmt.setString(19, "3");
            stmt.execute();
            if (stmt.getInt("_hid") == 1) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getAllHallDetails(ManageHallBO objBO) {
        try {
            objBO.setAddFlag(false);
            String photo2 = "", photoSm, photoLg, photo3 = "";
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("Select * from halls where gurkha=?");
            pst.setString(1, objBO.getGurkha());
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO.setAddFlag(true);
                objBO.setHallId(rs.getString("hallid"));
                objBO.setHallName(rs.getString("hallname"));
                objBO.setHallArea(rs.getString("hall_area"));
                objBO.setContact(rs.getString("contact"));
                objBO.setHallServices(rs.getString("services"));
                objBO.setHallAreaSqft(rs.getInt("areasqft"));
                objBO.setUrl(rs.getString("websiteurl"));
                objBO.setCity(rs.getString("city"));
                objBO.setMapLocation(rs.getString("maplocation"));
                objBO.setRating(rs.getString("rating"));
                objBO.setContact(rs.getString("contact"));
                objBO.setPhone(rs.getString("phone"));
                objBO.setVisitCount(rs.getInt("visitcount"));
                objBO.setAddress(rs.getString("fulladdress"));
                objBO.setEmail(rs.getString("email"));
                objBO.setReviewCount(Integer.parseInt(rs.getString("reviewscount")));
                photoSm = rs.getString("photo");
                photo2 = rs.getString("photo2");
                photo3 = rs.getString("photo3");
                photoLg = photoSm;
                if (photoSm.contains("default")) {
                    photoSm = "shopIcon_sm.png";
                    photoLg = "shopIcon_lg.png";
                }
                if (photo2.contains("default")) {
                    photo2 = "shopIcon_lg.png";
                }
                if (photo3.contains("default")) {
                    photo3 = "shopIcon_lg.png";
                }
                objBO.setPhoto(photoSm);
                objBO.setPhotoLg(photoLg);
                objBO.setPhoto2(photo2);
                objBO.setPhoto3(photo3);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addMesDetails(ManageMesBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_mes(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(23, Types.INTEGER);
            stmt.setString(1, objBO.getMesName());
            stmt.setString(2, objBO.getMesNameHindi());
            stmt.setString(3, objBO.getContact());
            stmt.setString(4, objBO.getAddress());
            stmt.setString(5, objBO.getMesArea());
            stmt.setString(6, objBO.getServices());
            stmt.setString(7, objBO.getServiceArea());
            stmt.setString(8, objBO.getEmail());
            stmt.setString(9, objBO.getUrl());
            stmt.setString(10, objBO.getHomeDelivery());
            stmt.setString(11, objBO.getLunchTime());
            stmt.setString(12, objBO.getDinnerTime());
            stmt.setString(13, objBO.getStatus());
            stmt.setString(14, objBO.getMapLocation());
            stmt.setString(15, objBO.getSubType());
            stmt.setString(16, objBO.getClosedOn());
            stmt.setString(17, objBO.getCity());
            stmt.setString(18, objBO.getAddedBy());
            stmt.setString(19, objBO.getPhoto());
            stmt.setString(20, objBO.getMetadata());
            stmt.setString(21, objBO.getPhone());
            stmt.setString(22, objBO.getPassword());
            stmt.setString(23, "0");
            stmt.setString(24, "1");
            stmt.execute();
            objBO.setMesId(String.valueOf(stmt.getInt("_mesid")));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateMesDetails(ManageMesBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_mes(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(23, Types.INTEGER);
            stmt.setString(1, objBO.getMesName());
            stmt.setString(2, objBO.getMesNameHindi());
            stmt.setString(3, objBO.getContact());
            stmt.setString(4, objBO.getAddress());
            stmt.setString(5, objBO.getMesArea());
            stmt.setString(6, objBO.getServices());
            stmt.setString(7, objBO.getServiceArea());
            stmt.setString(8, objBO.getEmail());
            stmt.setString(9, objBO.getUrl());
            stmt.setString(10, objBO.getHomeDelivery());
            stmt.setString(11, objBO.getLunchTime());
            stmt.setString(12, objBO.getDinnerTime());
            stmt.setString(13, objBO.getStatus());
            stmt.setString(14, objBO.getMapLocation());
            stmt.setString(15, objBO.getSubType());
            stmt.setString(16, objBO.getClosedOn());
            stmt.setString(17, objBO.getCity());
            stmt.setString(18, objBO.getAddedBy());
            stmt.setString(19, objBO.getPhoto());
            stmt.setString(20, objBO.getMetadata());
            stmt.setString(21, objBO.getPhone());
            stmt.setString(22, objBO.getPassword());
            stmt.setString(23, objBO.getMesId());
            stmt.setString(24, "2");
            stmt.execute();
            if (stmt.getInt("_mesid") > 0) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateMesPhoto(ManageMesBO objBO) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            CallableStatement stmt = con.prepareCall("{call sp_mes(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.registerOutParameter(23, Types.INTEGER);
            stmt.setString(1, objBO.getMesName());
            stmt.setString(2, objBO.getMesNameHindi());
            stmt.setString(3, objBO.getContact());
            stmt.setString(4, objBO.getAddress());
            stmt.setString(5, objBO.getMesArea());
            stmt.setString(6, objBO.getServices());
            stmt.setString(7, objBO.getServiceArea());
            stmt.setString(8, objBO.getEmail());
            stmt.setString(9, objBO.getUrl());
            stmt.setString(10, objBO.getHomeDelivery());
            stmt.setString(11, objBO.getLunchTime());
            stmt.setString(12, objBO.getDinnerTime());
            stmt.setString(13, objBO.getStatus());
            stmt.setString(14, objBO.getMapLocation());
            stmt.setString(15, objBO.getSubType());
            stmt.setString(16, objBO.getClosedOn());
            stmt.setString(17, objBO.getCity());
            stmt.setString(18, objBO.getAddedBy());
            stmt.setString(19, objBO.getPhoto());
            stmt.setString(20, objBO.getMetadata());
            stmt.setString(21, objBO.getPhone());
            stmt.setString(22, objBO.getPassword());
            stmt.setString(23, objBO.getMesId());
            stmt.setString(24, "3");
            stmt.execute();

            if (stmt.getInt("_mesid") == 1) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getAllMesDetails(ManageMesBO objBO) {
        try {
            objBO.setAddFlag(false);
            String photo2 = "", photo3 = "", photoSm = "", photoLg = "";
            int cnt = 0;

            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            Connection con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("Select * from mes where gurkha=?");
            pst.setString(1, objBO.getGurkha());
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO.setAddFlag(true);
                objBO.setMesId(rs.getString("mesid"));
                objBO.setMesName(rs.getString("mesname"));
                objBO.setMesArea(rs.getString("mesarea"));
                objBO.setContact(rs.getString("contact"));
                objBO.setServiceArea(rs.getString("servicearea"));
                objBO.setServices(rs.getString("services"));
                objBO.setClosedOn(rs.getString("closedon"));
                objBO.setLunchTime(rs.getString("lunchtime"));
                objBO.setDinnerTime(rs.getString("dinnertime"));
                objBO.setHomeDelivery(rs.getString("homedelivery"));
                objBO.setUrl(rs.getString("websiteurl"));
                objBO.setCity(rs.getString("city"));
                objBO.setMapLocation(rs.getString("maplocation"));
                objBO.setRating(rs.getString("rating"));
                objBO.setContact(rs.getString("contact"));
                objBO.setPhone(rs.getString("phone"));
                objBO.setVisitCount(rs.getString("visitcount"));
                objBO.setReviewCount(rs.getString("reviewcount"));
                objBO.setAddress(rs.getString("address"));
                objBO.setEmail(rs.getString("email"));
                photoSm = rs.getString("photo");
                photo2 = rs.getString("photo2");
                photo3 = rs.getString("photo3");
                photoLg = photoSm;
                if (photoSm.contains("default")) {
                    photoSm = "shopIcon_sm.png";
                    photoLg = "shopIcon_lg.png";
                }
                if (photo2.contains("default")) {
                    photo2 = "shopIcon_lg.png";
                }
                if (photo3.contains("default")) {
                    photo3 = "shopIcon_lg.png";
                }
                objBO.setPhoto(photoSm);
                objBO.setPhotoLg(photoLg);
                objBO.setPhoto2(photo2);
                objBO.setPhoto3(photo3);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addHostelDetails(ManageHostelBO objBO) {
        try {
            String hostid = "";
            int cnt = 0;
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("insert into hostel(hostname, hostnamehindi, hostarea, hostareasqft, address, contact, websiteurl, email, forwhom, bedrooms, beds, rent, deposit, description, maplocation, city, addedby, furnished, possession, phone, pass, substype) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, objBO.getHostName());
            pst.setString(2, objBO.getHostNameHindi());
            pst.setString(3, objBO.getHostArea());
            pst.setString(4, objBO.getHostAreaSqft());
            pst.setString(5, objBO.getAddress());
            pst.setString(6, objBO.getContact());
            pst.setString(7, objBO.getWebsiteUrl());
            pst.setString(8, objBO.getEmail());
            pst.setString(9, objBO.getForWhom());
            pst.setString(10, objBO.getBedrooms());
            pst.setString(11, objBO.getBeds());
            pst.setString(12, objBO.getRent());
            pst.setString(13, objBO.getDeposit());
            pst.setString(14, objBO.getDescription());
            pst.setString(15, objBO.getMaplocation());
            pst.setString(16, objBO.getCity());
            pst.setString(17, objBO.getAddedBy());
            pst.setString(18, objBO.getFurnished());
            pst.setString(19, objBO.getPossession());
            pst.setString(20, objBO.getPhone());
            pst.setString(21, objBO.getContact());
            pst.setString(22, objBO.getSubscription());
            cnt = pst.executeUpdate();

            if (cnt > 0) {
                pst = con.prepareStatement("select hostid, gurkha from hostel where hostname=? and email=?;");
                pst.setString(1, objBO.getHostName());
                pst.setString(2, objBO.getEmail());
                rs = pst.executeQuery();
                if (rs.next()) {
                    hostid = rs.getString("hostid");
                    pst1 = con.prepareStatement("insert into search values(?,?,?,?,?,?,?);");
                    pst1.setInt(1, Integer.parseInt(hostid));
                    pst1.setString(2, "hostel");
                    pst1.setString(3, objBO.getHostName());
                    pst1.setString(4, objBO.getHostArea());
                    pst1.setString(5, objBO.getMetadata());
                    pst1.setString(6, "Pending");
                    pst1.setString(7, rs.getString("gurkha"));
                    pst1.executeUpdate();
                    objBO.setHostId(hostid);
                }
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateHostelDetails(ManageHostelBO objBO) {
        try {
            int cnt = 0;
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("update hostel set hostname=?, hostnamehindi=?, hostarea=?, hostareasqft=?,address=?, contact=?, websiteurl=?, email=?, forwhom=?, bedrooms=?,beds=?, rent=?, deposit=?, description=?, city=?, furnished=?, possession = ?, phone=?, substype=?, pass=? where hostid=?;");
            pst.setString(1, objBO.getHostName());
            pst.setString(2, objBO.getHostNameHindi());
            pst.setString(3, objBO.getHostArea());
            pst.setString(4, objBO.getHostAreaSqft());
            pst.setString(5, objBO.getAddress());
            pst.setString(6, objBO.getContact());
            pst.setString(7, objBO.getWebsiteUrl());
            pst.setString(8, objBO.getEmail());
            pst.setString(9, objBO.getForWhom());
            pst.setString(10, objBO.getBedrooms());
            pst.setString(11, objBO.getBeds());
            pst.setString(12, objBO.getRent());
            pst.setString(13, objBO.getDeposit());
            pst.setString(14, objBO.getDescription());
            pst.setString(15, objBO.getCity());
            pst.setString(16, objBO.getFurnished());
            pst.setString(17, objBO.getPossession());
            pst.setString(18, objBO.getPhone());
            pst.setString(19, objBO.getSubscription());
            pst.setString(20, objBO.getPassword());
            pst.setString(21, objBO.getHostId());
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateHostelPhoto(ManageHostelBO objBO) {
        try {
            int cnt = 0;
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("update hostel set photo=? where hostid=?;");
            pst.setString(1, objBO.getPhoto());
            pst.setString(2, objBO.getHostId());
            cnt = pst.executeUpdate();
            if (cnt > 0) {
                objBO.setAddFlag(true);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getAllHostelDetails(ManageHostelBO objBO) {
        try {
            objBO.setAddFlag(false);
            String photo2 = "", photo3 = "", photoSm, photoLg;
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("Select * from hostel where gurkha=?");
            pst.setString(1, objBO.getGurkha());
            rs = pst.executeQuery();
            while (rs.next()) {
                objBO.setAddFlag(true);
                objBO.setHostId(rs.getString("hostid"));
                objBO.setHostName(rs.getString("hostname"));
                objBO.setHostArea(rs.getString("hostarea"));
                objBO.setContact(rs.getString("contact"));
                objBO.setHostAreaSqft(rs.getString("hostareasqft"));
                objBO.setWebsiteUrl(rs.getString("websiteurl"));
                objBO.setCity(rs.getString("city"));
                objBO.setMaplocation(rs.getString("maplocation"));
                objBO.setRating(rs.getString("rating"));
                objBO.setContact(rs.getString("contact"));
                objBO.setVisitCount(rs.getString("visitcount"));
                objBO.setReviewCount(rs.getString("reviewcount"));
                objBO.setAddress(rs.getString("address"));
                objBO.setEmail(rs.getString("email"));
                photoSm = rs.getString("photo");
                photo2 = rs.getString("photo2");
                photo3 = rs.getString("photo3");
                objBO.setRent(rs.getString("rent"));
                objBO.setDeposit(rs.getString("deposit"));
                objBO.setForWhom(rs.getString("forwhom"));
                objBO.setBedrooms(rs.getString("bedrooms"));
                objBO.setBeds(rs.getString("beds"));
                objBO.setDescription(rs.getString("description"));
                objBO.setAmenities(rs.getString("amenities"));
                objBO.setFurnished(rs.getString("furnished"));
                objBO.setPossession(rs.getString("possession"));
                objBO.setPostedOn(rs.getString("regdate"));
                photoLg = photoSm;
                if (photoSm.contains("default")) {
                    photoSm = "shopIcon_sm.png";
                    photoLg = "shopIcon_lg.png";
                }
                if (photo2.contains("default")) {
                    photo2 = "shopIcon_lg.png";
                }
                if (photo3.contains("default")) {
                    photo3 = "shopIcon_lg.png";
                }
                objBO.setPhoto(photoSm);
                objBO.setPhotoLg(photoLg);
                objBO.setPhoto2(photo2);
                objBO.setPhoto3(photo3);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ManageDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateClaimedOfferStatus() throws SQLException {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            String claimDate = "", remTime = "";
            Date dt = Calendar.getInstance().getTime();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
            pst = con.prepareStatement("select * from claimedoffers where couponstatus!='Expired' order by claimdate desc");
            rs = pst.executeQuery();
            while (rs.next()) {
                claimDate = rs.getString("claimdate");
                String ft = formatter.format(dt);
                Date claim = formatter.parse(claimDate);
                Date today = formatter.parse(ft);
                long duration = today.getTime() - claim.getTime();

                long diffInHours = TimeUnit.MILLISECONDS.toHours(duration);
                diffInHours = 48 - diffInHours;
                if (diffInHours <= 48 && !(diffInHours < 0)) {
                    remTime = diffInHours + "h Left";
                } else {
                    remTime = "Expired";
                }

                pst = con.prepareStatement("update claimedoffers set couponstatus=? where cid=?");
                pst.setString(1, remTime);
                pst.setString(2, rs.getString("cid"));
                pst.executeUpdate();
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static ArrayList<SearchBO> getMatch(String id) {
        ArrayList<SearchBO> data = new ArrayList<SearchBO>();
        try {
            String area = "", name = "";
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            Connection con = DriverManager.getConnection(dbc.getConstr());
            if (con != null) {
                pst = con.prepareStatement("Select * from search where area LIKE ? and status='Active' or nm LIKE ? and status='Active' or metadata LIKE ? and status='Active'");
                pst.setString(1, "%" + id + "%");
                pst.setString(2, "%" + id + "%");
                pst.setString(3, "%" + id + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    area = rs.getString("area");
                    name = rs.getString("nm");
                    SearchBO c = new SearchBO();
                    c.setData(rs.getString("gurkha") + "," + rs.getString("type"));
                    c.setValue(rs.getString("nm") + ", " + rs.getString("area"));
                    data.add(c);
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return data;
    }

    public void sUpdateStoreDetails(ManageStoreBO objBO) throws SQLException {
        int cnt = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DBConnector dbc = new DBConnector();
            con = DriverManager.getConnection(dbc.getConstr());
            pst = con.prepareStatement("update storedetails set storename=?, category=?, storearea=?, city=?, websiteurl=?, services=?, workinghours=?, servicearea=?, closedon=?, subtype=?, contact=?, fulladdress=?, email=?, phone=?, storestatus='Data Changed' where storeid=?");
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
            pst.setString(14, objBO.getPhone());
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
}
