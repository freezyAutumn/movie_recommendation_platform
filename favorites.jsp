<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Favorites - MovieFlix</title>
    <style>
        /* --- Base Styles --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        /* --- Navbar --- */
        .navbar {
            background: #fff;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 8%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .logo { color: #00a1d6; font-size: 26px; font-weight: 800; text-decoration: none; }
        .nav-btn {
            padding: 8px 20px;
            background: #f1f3f5;
            color: #495057;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
        }

        /* --- Content Container --- */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 30px;
        }

        .header-section h1 { font-size: 32px; color: #2d3436; }
        .header-section p { color: #999; margin-top: 5px; }

        /* --- Favorites Grid --- */
        .favorites-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 25px;
        }

        .movie-card {
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: 0.3s;
            position: relative;
        }

        .movie-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.1);
        }

        .movie-card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            display: block;
        }

        .card-body {
            padding: 15px;
        }

        .card-body h3 {
            font-size: 16px;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .movie-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #999;
        }

        .rating { color: #f1c40f; font-weight: bold; }

        /* --- Remove Button (Icon) --- */
        .remove-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 32px;
            height: 32px;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: #ff4d4f;
            transition: 0.2s;
            opacity: 0; /* Hidden by default */
        }

        .movie-card:hover .remove-btn {
            opacity: 1; /* Show on hover */
        }

        .remove-btn:hover {
            background: #ff4d4f;
            color: #fff;
        }

        /* --- Empty State --- */
        .empty-state {
            text-align: center;
            padding: 100px 0;
            color: #adb5bd;
        }
        .empty-state span { font-size: 64px; display: block; margin-bottom: 20px; }
    </style>
</head>
<body>

<div class="navbar">
    <a href="movie.jsp" class="logo">MovieFlix</a>
    <a href="user.jsp" class="nav-btn">← Back to Profile</a>
</div>

<div class="container">
    <div class="header-section">
        <div>
            <h1>My Favorites</h1>
            <p>You have 3 movies in your collection</p>
        </div>
    </div>

    <div class="favorites-grid">
        
        <div class="movie-card">
            <button class="remove-btn" onclick="confirm('Remove from favorites?')" title="Remove">✕</button>
            <a href="movieDetail.jsp?title=Inception" style="text-decoration: none; color: inherit;">
                <img src="https://picsum.photos/400/600?random=1" alt="Inception">
                <div class="card-body">
                    <h3>Inception</h3>
                    <div class="movie-meta">
                        <span>Sci-Fi</span>
                        <span class="rating">⭐ 8.8</span>
                    </div>
                </div>
            </a>
        </div>

        <div class="movie-card">
            <button class="remove-btn" onclick="confirm('Remove from favorites?')" title="Remove">✕</button>
            <a href="movieDetail.jsp?title=Interstellar" style="text-decoration: none; color: inherit;">
                <img src="https://picsum.photos/400/600?random=2" alt="Interstellar">
                <div class="card-body">
                    <h3>Interstellar</h3>
                    <div class="movie-meta">
                        <span>Sci-Fi</span>
                        <span class="rating">⭐ 8.6</span>
                    </div>
                </div>
            </a>
        </div>

        <div class="movie-card">
            <button class="remove-btn" onclick="confirm('Remove from favorites?')" title="Remove">✕</button>
            <a href="movieDetail.jsp?title=Avengers" style="text-decoration: none; color: inherit;">
                <img src="https://picsum.photos/400/600?random=3" alt="Avengers">
                <div class="card-body">
                    <h3>The Avengers</h3>
                    <div class="movie-meta">
                        <span>Action</span>
                        <span class="rating">⭐ 8.0</span>
                    </div>
                </div>
            </a>
        </div>

    </div>

    <div class="empty-state" style="display: none;">
        <span>🎬</span>
        <h2>Your library is empty</h2>
        <p>Start adding movies you love!</p>
    </div>
</div>

</body>
</html>