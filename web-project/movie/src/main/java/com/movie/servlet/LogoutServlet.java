package com.movie.servlet;

import jakarta.servlet.ServletException;
import java.io.IOException;

// 通过注解把这个 Servlet 映射到前端按钮调用的 "logout" 路径上
@jakarta.servlet.annotation.WebServlet("/logout")
public class LogoutServlet extends jakarta.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. 获取当前 Session，如果不存在也不自动创建
        jakarta.servlet.http.HttpSession session = request.getSession(false);
        
        if (session != null) {
            // 2. 彻底销毁 Session，清除里面存的所有数据（包括 currentUser 等）
            session.invalidate();
        }
        
        // 3. 安全退出后，把用户强制重定向回登录页面（或者主页 "movies"）
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) 
            throws ServletException, IOException {
        // 让 Post 请求和 Get 请求走同样的逻辑
        doGet(request, response);
    }
}