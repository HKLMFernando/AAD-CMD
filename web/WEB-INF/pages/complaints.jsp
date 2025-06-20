<%--<%@ page import="java.util.*, model.User, model.Complaint, dao.ComplaintDAO" %>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user == null) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>
<%--    List<Complaint> complaints = ComplaintDAO.getComplaintsByUserId(user.getId());--%>
<%--%>--%>
<%--<html>--%>
<%--<head><title>My Complaints</title></head>--%>
<%--<body>--%>
<%--<h2>My Complaints</h2>--%>
<%--<table border="1">--%>
<%--    <tr><th>ID</th><th>Title</th><th>Description</th><th>Status</th></tr>--%>
<%--    <% for (Complaint c : complaints) { %>--%>
<%--        <tr>--%>
<%--            <td><%= c.getId() %></td>--%>
<%--            <td><%= c.getTitle() %></td>--%>
<%--            <td><%= c.getDescription() %></td>--%>
<%--            <td><%= c.getStatus() %></td>--%>
<%--        </tr>--%>
<%--    <% } %>--%>
<%--</table>--%>
<%--<p><a href="dashboard.jsp">Back to Dashboard</a></p>--%>
<%--</body>--%>
<%--</html>--%>



<%@ page import="java.util.*, model.User, model.Complaint, dao.ComplaintDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Complaint> complaints = ComplaintDAO.getComplaintsByUserId(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Complaints</title>
    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">My Complaints</h2>

<table class="table table-bordered table-hover table-striped">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <% for (Complaint c : complaints) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td><%= c.getStatus() %></td>
    </tr>
    <% } %>
    </tbody>
</table>

<a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>

</body>
</html>
