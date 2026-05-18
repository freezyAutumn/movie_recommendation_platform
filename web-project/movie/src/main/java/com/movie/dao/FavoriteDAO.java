package com.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.movie.entity.Movie;
import com.movie.util.DBUtil;

public class FavoriteDAO {

    /**
     * 核心切换方法：检查是否存在，存在则删除，不存在则添加
     */
    public boolean toggleFavorite(int userId, int movieId) {
        boolean isFavoriteNow = false;
        
        String checkSql = "SELECT COUNT(*) FROM favorites WHERE user_id = ? AND movie_id = ?";
        String insertSql = "INSERT INTO favorites (user_id, movie_id) VALUES (?, ?)";
        String deleteSql = "DELETE FROM favorites WHERE user_id = ? AND movie_id = ?";

        try (Connection conn = DBUtil.getConnection()) {
            boolean exists = false;

            try (PreparedStatement pstmt = conn.prepareStatement(checkSql)) {
                pstmt.setInt(1, userId);
                pstmt.setInt(2, movieId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        exists = rs.getInt(1) > 0;
                    }
                }
            }

            if (exists) {
                try (PreparedStatement pstmt = conn.prepareStatement(deleteSql)) {
                    pstmt.setInt(1, userId);
                    pstmt.setInt(2, movieId);
                    pstmt.executeUpdate();
                    System.out.println("===[DAO 日志]=== 用户 " + userId + " 取消收藏了电影 " + movieId);
                }
                isFavoriteNow = false;
            } else {
                try (PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
                    pstmt.setInt(1, userId);
                    pstmt.setInt(2, movieId);
                    pstmt.executeUpdate();
                    System.out.println("===[DAO 日志]=== 用户 " + userId + " 成功收藏了电影 " + movieId);
                }
                isFavoriteNow = true;
            }

        } catch (Exception e) {
            System.err.println("❌ ===[DAO 严重错误]=== toggleFavorite 执行数据库写入失败！");
            e.printStackTrace();
        }

        return isFavoriteNow;
    }

    /**
     * 精准适配 PostgreSQL 纯净版：完美对接 favorites(movie_id) 和 movies(movie_id)
     */
    public List<Movie> getFavoritesByUserId(int userId) {
        List<Movie> favMovies = new ArrayList<>();
        List<Integer> movieIds = new ArrayList<>();
        
        // 1. 从中间表捞出电影 ID 
        String getIdsSql = "SELECT movie_id FROM favorites WHERE user_id = ?";
        
        try (Connection conn = DBUtil.getConnection()) {
            
            try (PreparedStatement pstmt = conn.prepareStatement(getIdsSql)) {
                pstmt.setInt(1, userId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        movieIds.add(rs.getInt("movie_id"));
                    }
                }
            }
            System.out.println("===[DAO 成功]=== 1. 中间表查询成功，用户 " + userId + " 收藏的电影ID列表为: " + movieIds);
            
            if (movieIds.isEmpty()) {
                return favMovies;
            }
            
            // 2. 移除错误的 id 字段，只保留绝对正确的 movie_id 进行精准单表查询
            String movieSql = "SELECT * FROM movies WHERE movie_id = ?";
            
            for (int mId : movieIds) {
                try (PreparedStatement pstmt2 = conn.prepareStatement(movieSql)) {
                    pstmt2.setInt(1, mId);
                    try (ResultSet rs2 = pstmt2.executeQuery()) {
                        if (rs2.next()) {
                            Movie movie = new Movie();
                            
                            // 这里映射你的 Movie 实体类
                            movie.setId(rs2.getInt("movie_id"));
                            movie.setTitle(rs2.getString("title"));
                            movie.setCategory(rs2.getString("category"));
                            movie.setRating(rs2.getDouble("rating"));
                            movie.setDescription(rs2.getString("description"));
                            movie.setPosterUrl(rs2.getString("poster_url"));
                            
                            favMovies.add(movie);
                        }
                    }
                }
            }
            System.out.println("===[DAO 成功]=== 2. 详情装载成功，最终成功组装了 " + favMovies.size() + " 部电影的完整数据！");
            
        } catch (Exception e) {
            System.err.println("❌ ===[DAO 严重错误]=== getFavoritesByUserId 执行失败！");
            e.printStackTrace();
        }
        
        return favMovies;
    }
}