<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String title = request.getParameter("title");
    if (title == null) title = "Unknown Movie";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= title %> - MovieFlix</title>
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
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
        }

        .navbar .logo {
            color: #00a1d6;
            font-size: 24px;
            font-weight: bold;
        }

        .nav-btn {
            padding: 8px 20px;
            background: #00a1d6;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        .nav-btn:hover { background: #0088bb; }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 0 20px;
        }

        .detail-box {
            display: flex;
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            gap: 40px;
            flex-wrap: wrap; 
        }

        .detail-box img {
            width: 300px;
            height: 450px;
            border-radius: 12px;
            object-fit: cover;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .detail-info {
            flex: 1; 
            min-width: 300px;
        }

        .detail-info h1 {
            font-size: 32px;
            margin-bottom: 15px;
            color: #222;
        }

        .rating {
            font-size: 20px;
            color: #f1c40f;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .description {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
            line-height: 1.8;
        }

        .btn-group {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
        }

        .btn.primary {
            background-color: #00a1d6;
            color: white;
        }

        .btn.primary:hover { background-color: #0088bb; transform: scale(1.05); }

        .btn.secondary {
            background-color: #f8d7da;
            color: #dc3545;
        }

        .btn.secondary:hover { background-color: #f5c6cb; transform: scale(1.05); }

        .btn.share {
            background-color: #e9ecef;
            color: #495057;
        }

        .btn.share:hover { background-color: #dee2e6; transform: scale(1.05); }

    </style>
</head>

<body>

<div class="navbar">
    <div class="logo">MovieFlix</div>
    <div class="nav-right">
        <button class="nav-btn" onclick="location.href='movie.jsp'">Home</button>
    </div>
</div>

<div class="container">

    <div class="detail-box">
        <img src="https://picsum.photos/300/450?random=10" alt="Movie Poster">

        <div class="detail-info">
            <h1><%= title %></h1>

            <p class="rating">⭐ 8.8</p>

            <p class="description">
                This is a sample description of the movie <strong><%= title %></strong>. 
                In a world of high-stakes cinematic experiences, this masterpiece stands out with its 
                incredible visuals and gripping storytelling.
            </p>

            <div class="btn-group">
                <button class="btn primary">▶ Watch Now</button>
                <button class="btn secondary">❤ Favorite</button>
                <button class="btn share">📤 Share</button>
            </div>
        </div>
    </div>

</div>

</body>
</html>
