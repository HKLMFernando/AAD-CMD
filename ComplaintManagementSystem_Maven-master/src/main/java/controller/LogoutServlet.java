package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // get existing session
        if (session != null) {
            session.invalidate(); // invalidate session to log out
        }
        res.sendRedirect("pages/login.jsp"); // redirect to login page
    }
}
