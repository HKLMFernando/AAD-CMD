<%@ page import="com.assignment.model.User" %>
<%@ page import="com.assignment.model.Complaint" %>
<%@ page import="com.assignment.dao.ComplaintDAO" %>
<%@ page import="java.util.List" %>


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
    <link rel="stylesheet" href="../css/complain.css">
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
