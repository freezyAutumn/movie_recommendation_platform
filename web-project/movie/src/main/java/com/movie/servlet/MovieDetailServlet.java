package com.movie.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.movie.entity.Movie;
import com.movie.entity.User;
import com.movie.util.DBUtil;

@WebServlet("/movieDetail")
public class MovieDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. 获取 URL 中的 id 参数
        String idStr = request.getParameter("id");
        Movie movie = null;
        boolean isFav = false; // 默认初始化为未收藏

        if (idStr != null && !idStr.trim().isEmpty()) {
            try (Connection conn = DBUtil.getConnection()) {
                
                // 2. 纯原生 JDBC 查询电影核心详细信息
                String movieSql = "SELECT * FROM movies WHERE movie_id = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(movieSql)) {
                    pstmt.setInt(1, Integer.parseInt(idStr));
                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            movie = new Movie();
                            movie.setId(rs.getInt("movie_id"));
                            movie.setTitle(rs.getString("title"));
                            movie.setCategory(rs.getString("category"));
                            movie.setRating(rs.getDouble("rating"));
                            movie.setDescription(rs.getString("description"));
                            movie.setPosterUrl(rs.getString("poster_url"));
                        }
                    }
                }

                // 3. 【核心修正】：如果电影存在且用户已登录，从中间表实时查询该电影是否已被收藏
                if (movie != null) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        User currentUser = (User) session.getAttribute("currentUser");
                        if (currentUser != null) {
                            String favSql = "SELECT COUNT(*) FROM favorites WHERE user_id = ? AND movie_id = ?";
                            try (PreparedStatement favPstmt = conn.prepareStatement(favSql)) {
                                favPstmt.setInt(1, currentUser.getId());
                                favPstmt.setInt(2, movie.getId());
                                try (ResultSet favRs = favPstmt.executeQuery()) {
                                    if (favRs.next()) {
                                        // 只要 COUNT > 0，说明数据库中存在收藏记录，变量置为 true
                                        isFav = favRs.getInt(1) > 0;
                                    }
                                }
                            }
                        }
                    }
                }

            } catch (Exception e) {
                System.out.println("=== MovieDetailServlet 发生数据库查询异常 ===");
                e.printStackTrace();
            }
        }

        // 4. 将查到的电影实体与收藏状态，一并塞入 request 作用域
        request.setAttribute("movie", movie);
        request.setAttribute("isFavorite", isFav); // 【核心】：必须确保名字与 JSP 里的 ${isFavorite} 严格一致
        
        // 5. 转发到前端页面渲染
        request.getRequestDispatcher("movieDetail.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}