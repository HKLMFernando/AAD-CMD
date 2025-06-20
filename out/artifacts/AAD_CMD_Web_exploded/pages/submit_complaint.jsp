<%@ page import="com.assignment.model.User" %>

<link rel="stylesheet" href="../css/submit.css">
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Complaint</title>
    <!-- ✅ Bootstrap CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">Submit a New Complaint</h2>

<form method="post" action="<%= request.getContextPath() %>/ComplaintServlet">
    <div class="mb-3">
        <label class="form-label">Title:</label>
        <input type="text" name="title" class="form-control" required />
    </div>

    <div class="mb-3">
        <label class="form-label">Description:</label>
        <textarea name="description" class="form-control" rows="4" required></textarea>
    </div>

    <input type="submit" value="Submit Complaint" class="btn btn-primary" />
    <a href="dashboard.jsp" class="btn btn-secondary ms-2">Back to Dashboard</a>
</form>

</body>
</html>
