package com.movie.dao;

import com.movie.entity.User;
import com.movie.util.DBUtil;
import java.sql.*;

public class UserDAO {

    // 1. 登录验证
    public User login(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setAvatarUrl(rs.getString("avatar_url"));
                    return user;
                }
            }
        } catch (SQLException e) { 
            e.printStackTrace(); 
        }
        return null;
    }

    // 2. 注册用户
    public boolean register(String username, String password, String email) {
        String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { 
            e.printStackTrace(); 
        }
        return false;
    }

    // 3. 更新用户资料（确保放在了类的大括号里面）
    public boolean updateProfile(int userId, String email, String password) {
        String sql;
        boolean hasPassword = (password != null && !password.trim().isEmpty());
        
        // 如果用户没填密码，就只更新邮箱；填了密码，两样都更新
        if (hasPassword) {
            sql = "UPDATE users SET email = ?, password = ? WHERE user_id = ?";
        } else {
            sql = "UPDATE users SET email = ? WHERE user_id = ?";
        }
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (hasPassword) {
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setInt(3, userId);
            } else {
                ps.setString(1, email);
                ps.setInt(2, userId);
            }
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
} // <-- 类的结束大括号，必须放在最后