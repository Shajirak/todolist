<%@ include file="db.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>

<%
String desc = "";
String fileName = "";

boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (isMultipart) {

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    List<FileItem> items = upload.parseRequest(request);

    for (FileItem item : items) {

        if (item.isFormField()) {
            if (item.getFieldName().equals("description")) {
                desc = item.getString();
            }
        } else {
            fileName = item.getName();
			
			String path = application.getRealPath("") + File.separator + "uploads";
            File dir = new File(path);
            if (!dir.exists()) dir.mkdir();

            if(fileName != null && !fileName.equals("")){
                File file = new File(path + File.separator + fileName);
                item.write(file);
            }
        }
    }

    PreparedStatement ps = con.prepareStatement(
    "INSERT INTO todos(description, status, file_name) VALUES (?,0,?)"
    );

    ps.setString(1, desc);
    ps.setString(2, fileName);

    ps.executeUpdate();

    response.sendRedirect("home.jsp");
}
%>