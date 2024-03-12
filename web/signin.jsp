<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Sign In</title>
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            background-color: #f8f9fa;
        }

        .signin-container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .lock-icon {
            font-size: 48px;
            color: #007bff;
        }

        .form-container {
            margin-top: 20px;
        }

        .alert-danger {
            margin-top: 20px;
        }

        /* Add any additional styles here */

        /* Example: Increase button size */
        .btn-primary {
            font-size: 18px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>

<div class="signin-container">
    <div class="lock-icon">&#128274;</div>
    <h2 class="mb-4">Sign In</h2>
   
    <div class="form-container">
        <form action="signin" method="post">
            <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            </div>
            <div class="mb-3">
                <input type="password"  name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary">Sign In</button>
        </form>
        <p class="mt-3">Don't have an account? <a href="signup.jsp">Sign up</a></p>
       
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
