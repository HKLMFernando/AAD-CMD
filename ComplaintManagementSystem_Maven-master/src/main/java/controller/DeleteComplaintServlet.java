package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.User;
import dao.ComplaintDAO;

import java.io.IOException;

public class DeleteComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
            try {
                int complaintId = Integer.parseInt(req.getParameter("id"));
                ComplaintDAO.deleteComplaintById(complaintId);
                res.sendRedirect("pages/admin_complaints.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                res.sendRedirect("pages/admin_complaints.jsp?error=true");
            }
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }
}
