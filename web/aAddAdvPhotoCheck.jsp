<%-- 
    Document   : sliderUploadCheck
    Created on : Mar 24, 2017, 8:37:20 PM
    Author     : Ankush
--%>
<%@page import="BO.ManageAdvBO"%>
<%@page import="java.util.Calendar"%>
<%@page import="BO.ManageStoreBO"%>
<%@page import="DAO.ManageDAO"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,org.apache.commons.io.FilenameUtils" %>
<%
    String saveFile = "", imgName = "";
    int aid = 0;
    String relativeWebPath = "/images/advphotos/";
    ManageDAO objDAO = new ManageDAO();
    ManageAdvBO objBO = new ManageAdvBO();
    if (session.getAttribute("aidPhoto") != null) {
        aid = Integer.parseInt(String.valueOf(session.getAttribute("aidPhoto")));
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
                //int startPos = ((file.substring(0, pos)).getBytes()).length;
                int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;

                //int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;

                String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                String extension = FilenameUtils.getExtension(saveFile);
                imgName = aid + "." + extension;

                File ff = new File(absoluteDiskPath, imgName);
                FileOutputStream fileOut = new FileOutputStream(ff);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();

                objBO.setAdvPhoto(imgName);
                objBO.setAid(aid);
                objBO.setAddFlag(false);

                objDAO.updateAdvPhoto(objBO);
                if (objBO.isAddFlag()) {
                    session.removeAttribute("aidPhoto");
                    response.sendRedirect("aManageAdv.jsp");
                } else {
                    out.print("Failed to add photo");
                }
            }

        } catch (Exception e) {
            out.print("Error Occured !!   " + e + " ");
        }
    } else {
        out.print("Session Time out!! Try again");
    }
%>
</html>