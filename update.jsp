<%@ include file="db.jsp" %>
<html>
<head>
    <%@ include file="header.jsp" %>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM todos WHERE id=?"
);

ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<form action="updateaction.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <input type="text" name="task"
    value="<%= rs.getString("description") %>">

    <input type="submit" value="Update">
</form>   
</body>
</html>