<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<h1>TO DO LIST</h1>

<form action="add.jsp" method="post" enctype="multipart/form-data">
    <input type="text" name="description" placeholder="Enter task" required>
    <input type="file" name="file">
    <input type="submit" value="Add">
</form>

<br>

<table>
<tr>
<th>ID</th>
<th>Task</th>
<th>Status</th>
<th>File</th>
<th>Edit</th>
<th>Delete</th>
<th>Action</th>
</tr>

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM todos");

while(rs.next()) {
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("description") %></td>
<td><%= rs.getBoolean("status") ? "Done" : "Pending" %></td>

<td>
<% String file = rs.getString("file_name");
if(file != null && !file.equals("")) { %>
<a href="uploads/<%= file %>">View</a>
<% } else { %>
No File
<% } %>
</td>

<td><a href="edit.jsp?id=<%= rs.getInt("id") %>">Edit</a></td>
<td><a href="delete.jsp?id=<%= rs.getInt("id") %>">Delete</a></td>
<td>
<a href="markdone.jsp?id=<%= rs.getInt("id") %>">Mark Done</a>
</td>
</tr>

<%
}
%>

</table>

</body>
</html>