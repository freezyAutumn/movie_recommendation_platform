package com.movie.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.movie.dao.UserDAO;
import com.movie.entity.User;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        // 安全拦截：如果 Session 丢了，不允许更新
        if (currentUser == null) {
            response.getWriter().write("fail");
            return;
        }
        
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");
        
        UserDAO dao = new UserDAO();
        boolean success = dao.updateProfile(currentUser.getId(), newEmail, newPassword);
        
        if (success) {
            // 极其关键：必须同步把 Session 里的数据改了，前端页面刷新时才会显示新邮箱
            currentUser.setEmail(newEmail);
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                currentUser.setPassword(newPassword);
            }
            session.setAttribute("currentUser", currentUser);
            
            // 响应给前端异步对象的文本
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}