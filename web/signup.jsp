<%-- 
    Document   : signup
    Created on : 17-Jan-2024, 9:32:46 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Sign Up</title>
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .signup-container {
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
    </style>
</head>
<body>

<div class="signup-container">
    <div class="lock-icon">&#128274;</div>
    <h2 class="mb-4">Sign Up</h2>
    
<!--    <div class="alert alert-danger" role="alert">
        Sign up error message goes here.
    </div>-->
    
    <div class="form-container">
        <form action="sign_up" method="post" >
            <div class="mb-3">
                <input type="text" name="firstname" class="form-control" placeholder="First Name" required>
                
            </div>
            <div class="mb-3">
                <input type="text"  name="lastname" class="form-control" placeholder="Last Name" required>
            </div>
            <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            </div>
            <div class="mb-3">
                <input type="password"  name="password" class="form-control" placeholder="Password" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
        
        <p class="mt-3">Already have an account? <a href="signin.jsp">Sign in</a></p>
        
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>

