<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MovieFlix - Popular Movies</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        .navbar {
            background-color: #ffffff;
            height: 64px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 5%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar .logo {
            color: #00a1d6;
            font-size: 24px;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .nav-right input[type="text"] {
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
        }

        .nav-btn {
            padding: 8px 18px;
            background: #00a1d6;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .nav-btn:hover { background: #0088bb; }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 25px;
            padding-left: 15px;
            border-left: 5px solid #00a1d6;
        }

        .movie-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 30px;
        }

        .movie-list a {
            text-decoration: none;
            color: inherit;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }

        .card img {
            width: 100%;
            height: 320px;
            object-fit: cover; 
            display: block;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            font-size: 18px;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card-content p {
            font-size: 14px;
            color: #777;
        }

        .rating {
            color: #f1c40f;
            font-weight: bold;
            margin-top: 5px;
        }

        .footer {
            text-align: center;
            padding: 40px 0;
            color: #999;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="navbar">
    <div class="logo">MovieFlix</div>
    <div class="nav-right">
        <input type="text" placeholder="Search...">
        <button class="nav-btn" onclick="location.href='user.jsp'">Profile</button>
    </div>
</div>

<div class="container">
    <div class="section-title">Popular Movies</div>

    <div class="movie-list">
        <a href="movieDetail.jsp?title=Inception">
            <div class="card">
                <img src="https://picsum.photos/400/600?random=1">
                <div class="card-content">
                    <h3>Inception</h3>
                    <p>Sci-Fi</p>
                    <p class="rating">⭐ 8.8</p>
                </div>
            </div>
        </a>

        <a href="movieDetail.jsp?title=Interstellar">
            <div class="card">
                <img src="https://picsum.photos/400/600?random=2">
                <div class="card-content">
                    <h3>Interstellar</h3>
                    <p>Sci-Fi</p>
                    <p class="rating">⭐ 8.6</p>
                </div>
            </div>
        </a>

        <a href="movieDetail.jsp?title=Avengers">
            <div class="card">
                <img src="https://picsum.photos/400/600?random=3">
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
