package com.movie.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.movie.entity.Movie;
import com.movie.util.DBUtil;

@WebServlet("/movies")
public class MovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Movie> movieList = new ArrayList<>();
        
        // 1. 从数据库读取数据
        try (Connection conn = DBUtil.getConnection()) {
            if (conn != null) {
                String sql = "SELECT * FROM movies";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    Movie m = new Movie();
                    m.setId(rs.getInt("movie_id"));
                    m.setTitle(rs.getString("title"));
                    m.setCategory(rs.getString("category"));
                    m.setRating(rs.getDouble("rating"));
                    m.setDescription(rs.getString("description"));
                    m.setPosterUrl(rs.getString("poster_url"));
                    movieList.add(m);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 2. 将数据存入 Request 作用域
        request.setAttribute("movies", movieList);

        // 3. 转发到你的网页 (确保你的文件名是 movie.jsp)
        request.getRequestDispatcher("movie.jsp").forward(request, response);
    }
}