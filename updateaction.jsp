<%@ include file="db.jsp" %>

<%
String idStr = request.getParameter("id");
String description = request.getParameter("description");

System.out.println("ID: " + idStr);
System.out.println("Desc: " + description);

if (idStr != null && description != null) {

    int id = Integer.parseInt(idStr);

    PreparedStatement ps = con.prepareStatement(
        "UPDATE todos SET description=? WHERE id=?"
    );

    ps.setString(1, description);
    ps.setInt(2, id);

    int rows = ps.executeUpdate();

    System.out.println("Rows updated: " + rows);
}

response.sendRedirect("home.jsp");
%>