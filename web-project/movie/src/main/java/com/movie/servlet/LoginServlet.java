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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 处理登录表单的 POST 请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 获取页面传来的账号密码
        String u = request.getParameter("username");
        String p = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(u, p);

        if (user != null) {
            // 登录成功：用户信息存入 Session
            request.getSession().setAttribute("currentUser", user);
            // 跳转到首页（对应的 Servlet 路径）
            response.sendRedirect("movies");
        } else {
            // 登录失败：把错误信息传给 login.jsp
            request.setAttribute("error", "用户名或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // 如果用户直接输入 /login 网址，则显示登录页面
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}