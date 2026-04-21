<%@ include file="db.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = con.prepareStatement(
"UPDATE todos SET status=1 WHERE id=?"
);

ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("home.jsp");
%>