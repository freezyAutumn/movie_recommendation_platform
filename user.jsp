<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - MovieFlix</title>
    <style>
        /* --- Modern Reset --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #2d3436;
            min-height: 100vh;
        }

        /* --- Navbar --- */
        .navbar {
            background-color: #ffffff;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 8%;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }

        .navbar .logo {
            color: #00a1d6;
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.5px;
            text-decoration: none;
        }

        .nav-btn {
            padding: 10px 24px;
            background: #f1f3f5;
            color: #495057;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .nav-btn:hover {
            background: #e9ecef;
            transform: translateX(-5px);
        }

        /* --- Main Content --- */
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .profile-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 50px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.08);
        }

        /* Header Area */
        .profile-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 40px;
            padding-bottom: 30px;
            border-bottom: 1px solid #eee;
        }

        .user-meta {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .avatar {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #00a1d6, #00d2ff);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 32px;
            font-weight: bold;
        }

        /* Action Icons (Inbox, Upload, Favorites) */
        .header-actions {
            display: flex;
            gap: 12px;
        }

        .action-circle-btn {
            width: 55px;
            height: 55px;
            border-radius: 12px;
            border: 1px solid #eee;
            background: #fff;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: 0.3s;
            position: relative;
        }

        .action-circle-btn:hover {
            border-color: #00a1d6;
            background-color: #f0faff;
            transform: translateY(-3px);
        }

        .action-circle-btn span { font-size: 18px; }
        .action-circle-btn label { font-size: 8px; font-weight: 800; text-transform: uppercase; color: #999; cursor: pointer; margin-top: 2px; }

        .badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: #ff4d4f;
            color: white;
            font-size: 10px;
            padding: 2px 6px;
            border-radius: 10px;
            border: 2px solid #fff;
        }

        /* Information Grid */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            margin-bottom: 40px;
        }

        .info-item {
            padding: 20px;
            background: #f8f9fa;
            border-radius: 16px;
        }

        .info-item label {
            display: block;
            font-size: 11px;
            color: #adb5bd;
            font-weight: 700;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .info-item span { font-size: 17px; font-weight: 600; }

        .tag-pill {
            background: #e3f2fd;
            color: #00a1d6;
            padding: 5px 12px;
            border-radius: 50px;
            font-size: 13px;
            font-weight: 600;
            margin-right: 5px;
        }

        /* Footer Buttons */
        .footer-btns {
            display: flex;
            gap: 15px;
        }

        .btn-main {
            flex: 1;
            padding: 15px;
            border-radius: 12px;
            border: none;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-edit { background: #00a1d6; color: white; }
        .btn-logout { background: #fff; border: 1px solid #ff4d4f; color: #ff4d4f; }

        @media (max-width: 600px) {
            .profile-header { flex-direction: column; gap: 20px; text-align: center; }
            .info-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>

<div class="navbar">
    <a href="movie.jsp" class="logo">MovieFlix</a>
    <button class="nav-btn" onclick="location.href='movie.jsp'">← Home</button>
</div>

<div class="container">
    <div class="profile-card">
        
        <div class="profile-header">
            <div class="user-meta">
                <div class="avatar">T</div>
                <div>
                    <h2 style="font-size: 28px;">User Profile</h2>
                    <p style="color: #999; font-size: 14px;">Welcome back, test_user</p>
                </div>
            </div>

            <div class="header-actions">
                <button class="action-circle-btn" onclick="alert('Opening Inbox...')" title="Messages">
                    <span>📩</span>
                    <label>Inbox</label>
                    <div class="badge">3</div>
                </button>

                <button class="action-circle-btn" onclick="alert('Select file to upload...')" title="Upload Movie">
                    <span>📤</span>
                    <label>Upload</label>
                </button>

                <button class="action-circle-btn" onclick="alert('Opening Favorites...')" title="My Favorites">
                    <span>❤️</span>
                    <label>Library</label>
                </button>
            </div>
        </div>

        <div class="info-grid">
            <div class="info-item">
                <label>Username</label>
                <span>test_user</span>
            </div>
            <div class="info-item">
                <label>Signature</label>
                <span style="color: #27ae60;">......</span>
            </div>
        </div>

        <div class="info-item" style="margin-bottom: 40px;">
            <label>Recently Viewed & Favorites</label>
            <div style="margin-top: 10px;">
                <span class="tag-pill">Inception</span>
                <span class="tag-pill">Sci-Fi</span>
                <span class="tag-pill">Action</span>
            </div>
        </div>

        <div class="footer-btns">
            <button class="btn-main btn-edit">Edit Profile Settings</button>
            <button class="btn-main btn-logout" onclick="location.href='login.jsp'">Sign Out</button>
        </div>

    </div>
</div>

</body>
</html>