<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String title = request.getParameter("title");
%>

<html>
<head>
    <title>Movie Detail</title>
    <link rel="stylesheet" href="style.css">
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

        <img src="https://picsum.photos/300/450?random=10">

        <div class="detail-info">
            <h1><%= title %></h1>

            <p class="rating">⭐ 8.8</p>

            <p>
                This is a sample description of the movie.
                You can later replace this with real data.
            </p>

            <button class="btn">▶ Watch</button>
            <button class="btn secondary">❤ Favorite</button>

        </div>

    </div>

</div>

</body>
</html>