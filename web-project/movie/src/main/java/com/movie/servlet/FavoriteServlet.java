package com.movie.servlet;

import com.movie.dao.FavoriteDAO;
import com.movie.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/toggleFavorite")
public class FavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final FavoriteDAO favoriteDao = new FavoriteDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. 验证登录状态
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            response.getWriter().write("login_required");
            return;
        }

        // 2. 获取前端传过来的电影 ID
        String movieIdStr = request.getParameter("movieId");
        if (movieIdStr == null || movieIdStr.trim().isEmpty()) {
            response.getWriter().write("error");
            return;
        }

        int userId = currentUser.getId();
        int movieId = Integer.parseInt(movieIdStr);

        // 3. 执行切换逻辑，获取最新状态
        boolean isFavNow = favoriteDao.toggleFavorite(userId, movieId);

        // 4. 返回最新状态给前端（"favorited" 表示已收藏，"unfavorited" 表示已取消）
        response.getWriter().write(isFavNow ? "favorited" : "unfavorited");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}