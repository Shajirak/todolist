<%@ include file="db.jsp" %>
<html>
<head>
    <%@ include file="header.jsp" %>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = con.prepareStatement(
"DELETE FROM todos WHERE id=?"
);

ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("home.jsp");
%>
</body>
</html>