<%--<%@ page import="java.util.*, model.Complaint, dao.ComplaintDAO" %>--%>
<%--<%@ page import="model.User" %>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>

<%--    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();--%>
<%--%>--%>
<%--<html>--%>
<%--<head><title>All Complaints - Admin</title></head>--%>
<%--<body>--%>
<%--<h2>All Complaints</h2>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th><th>Title</th><th>Description</th><th>User ID</th><th>Status</th>--%>
<%--    </tr>--%>
<%--    <% for (Complaint c : allComplaints) { %>--%>
<%--    <tr>--%>
<%--        <td><%= c.getId() %></td>--%>
<%--        <td><%= c.getTitle() %></td>--%>
<%--        <td><%= c.getDescription() %></td>--%>
<%--        <td><%= c.getUserId() %></td>--%>
<%--        <td><%= c.getStatus() %></td>--%>
<%--    </tr>--%>


<%--    <td>--%>
<%--        <form action="../DeleteComplaintServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this complaint?');">--%>
<%--            <input type="hidden" name="id" value="<%= c.getId() %>" />--%>
<%--            <input type="submit" value="Delete" class="btn btn-danger btn-sm" />--%>
<%--        </form>--%>
<%--    </td>--%>

<%--    <% } %>--%>

<%--</table>--%>


<%--<p><a href="dashboard.jsp">Back to Dashboard</a></p>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page import="java.util.*, model.Complaint, dao.ComplaintDAO" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Complaints - Admin</title>
    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2 class="mb-4">All Complaints</h2>

<table class="table table-bordered table-hover table-striped">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>User ID</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (Complaint c : allComplaints) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td><%= c.getUserId() %></td>
        <td><%= c.getStatus() %></td>
        <td>
            <form action="../DeleteComplaintServlet" method="post"
                  onsubmit="return confirm('Are you sure you want to delete this complaint?');">
                <input type="hidden" name="id" value="<%= c.getId() %>" />
                <input type="submit" value="Delete" class="btn btn-danger btn-sm" />
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</body>
</html>
