package com.assignment.controller;


import com.assignment.dao.UserDAO;
import com.assignment.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("hello");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = UserDAO.validateUser(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            res.sendRedirect("pages/dashboard.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }
}