<%-- 
    Document   : sliderUploadCheck
    Created on : Mar 24, 2017, 8:37:20 PM
    Author     : Ankush
--%>
<%@page import="java.util.Calendar"%>
<%@page import="BO.ManageStoreBO"%>
<%@page import="DAO.ManageDAO"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,org.apache.commons.io.FilenameUtils" %>
<%
    String saveFile = "", imgName = "";
    String relativeWebPath = "", redirect = "";

    if (session.getAttribute("sid") != null) {
        String storeid = String.valueOf(session.getAttribute("sid"));
        String imgCount = String.valueOf(session.getAttribute("imgCount"));
        String type = String.valueOf(session.getAttribute("type"));
        try {
            String contentType = request.getContentType();
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
                String file = new String(dataBytes, "CP1256");

                saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;

                if (type.equals("store")) {
                    relativeWebPath = "/images/storephotos/";
                    redirect = "aUpdatePhotosDetails.jsp?sid=" + storeid + "&type=" + type;
                } else if (type.equals("hall")) {
                    relativeWebPath = "/images/hallphotos/";
                    redirect = "aUpdatePhotosDetails.jsp?sid=" + storeid + "&type=" + type;
                } else if (type.equals("mes")) {
                    relativeWebPath = "/images/mesphotos/";
                    redirect = "aManageMes.jsp";
                } else if (type.equals("hostel")) {
                    relativeWebPath = "/images/hostelphotos/";
                    redirect = "aManageHostels.jsp";
                }
                String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                String extension = FilenameUtils.getExtension(saveFile);

                Calendar calendar = Calendar.getInstance();
                long milis = calendar.getTimeInMillis();
                String datetime = Long.toString(milis);
                String filename = datetime;
                imgName = filename + "." + extension;

                File ff = new File(absoluteDiskPath, imgName);
                FileOutputStream fileOut = new FileOutputStream(ff);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();

                int res = 0;
                ManageDAO objDAO = new ManageDAO();
                res = objDAO.updatePhotos(storeid, type, imgName, imgCount);
                if (res > 0) {
                    System.out.println(">>>>>>>>> redict path : " + redirect);
                    response.sendRedirect(redirect);
                } else {
                    out.print("Failed to update photos");
                }
            }
        } catch (Exception e) {
            out.print("Error Occured !!   " + e + " ");
        }
    } else {
        out.print("Incorrect Details");
    }
%>
</html>