package com.assignment.controller;


import com.assignment.dao.ComplaintDAO;
import com.assignment.model.Complaint;
import com.assignment.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



import java.io.IOException;

public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            Complaint c = new Complaint(title, description, user.getId());
            ComplaintDAO.saveComplaint(c);
            res.sendRedirect("pages/complaints.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }
}