package com.movie.servlet;

import com.movie.dao.FavoriteDAO;
import com.movie.entity.Movie;
import com.movie.entity.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // 1. 如果没登录，直接重定向回登录页
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. 正常获取该用户的收藏电影实体集合
        FavoriteDAO favDao = new FavoriteDAO();
        List<Movie> favMovies = favDao.getFavoritesByUserId(currentUser.getId());
        
        // 3. 将带有海报信息的完整 Movie 列表存入请求域
        request.setAttribute("favMovies", favMovies);
        
        // 4. 转发给 user.jsp 进行网格渲染
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}