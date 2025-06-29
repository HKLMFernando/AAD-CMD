package com.assignment.dao;

import com.assignment.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public static User validateUser(String username, String password) {
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM users WHERE username=? AND password=?"
             )) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean registerUser(User user) {
        String sql = "INSERT INTO users (id,username, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
