<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>MovieFlix</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="navbar">
    <div class="logo">MovieFlix</div>

    <div class="nav-right">
        <input type="text" placeholder="Search...">

        <button class="nav-btn" onclick="location.href='user.jsp'">
            Profile
        </button>
    </div>
</div>

<div class="container">

    <div class="section-title">Popular Movies</div>

    <div class="movie-list">

        <!-- 电影1 -->
        <a href="movieDetail.jsp?title=Inception">
            <div class="card">
                <img src="https://picsum.photos/200/300?random=1">
                <div class="card-content">
                    <h3>Inception</h3>
                    <p>Sci-Fi</p>
                    <p class="rating">⭐ 8.8</p>
                </div>
            </div>
        </a>

        <!-- 电影2 -->
        <a href="movieDetail.jsp?title=Interstellar">
            <div class="card">
                <img src="https://picsum.photos/200/300?random=2">
                <div class="card-content">
                    <h3>Interstellar</h3>
                    <p>Sci-Fi</p>
                    <p class="rating">⭐ 8.6</p>
                </div>
            </div>
        </a>

        <!-- 电影3 -->
        <a href="movieDetail.jsp?title=Avengers">
            <div class="card">
                <img src="https://picsum.photos/200/300?random=3">
                <div class="card-content">
                    <h3>Avengers</h3>
                    <p>Action</p>
                    <p class="rating">⭐ 8.0</p>
                </div>
            </div>
        </a>

    </div>

</div>

<div class="footer">
    © 2026 Movie System
</div>

</body>
</html>