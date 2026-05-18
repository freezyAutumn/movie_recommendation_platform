package com.movie.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * User 实体类，对应数据库中的 users 表
 * 实现 Serializable 接口是为了方便将来可能需要的序列化操作（比如存入 Session）
 */
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    // 字段名建议与数据库列名保持一致，方便对应
    private int id;             // user_id
    private String username;    // 用户名
    private String password;    // 密码
    private String email;       // 邮箱
    private String avatarUrl;   // 头像链接
    private Timestamp createdAt; // 创建时间

    // 无参构造方法（JavaBean 规范必须有）
    public User() {
    }

    // 全参构造方法（方便代码中快速创建对象）
    public User(int id, String username, String password, String email, String avatarUrl) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.avatarUrl = avatarUrl;
    }

    // Getter 和 Setter 方法（必须有，JSP 中的 ${user.username} 实际上是在调用 getUsername()）
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // toString 方法，方便在控制台打印调试
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}