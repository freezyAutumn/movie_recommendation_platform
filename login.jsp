<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In | Movie Portal</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="login-body">

    <div class="login-card">
        <div class="logo">MovieSite</div>
        <h2>Sign in to your account</h2>

        <form action="movie.jsp">
            <div class="input-group">
                <input type="text" placeholder="Username" required>
            </div>
            
            <div class="input-group">
                <input type="password" placeholder="Password" required>
            </div>

            <button type="submit" class="login-btn">
                Log In
            </button>
        </form>

        <div class="footer-text">
            Don't have an account? <a href="#">Create one</a>
            <br><br>
            <a href="#">Forgot your password?</a>
        </div>
    </div>

</body>
</html>