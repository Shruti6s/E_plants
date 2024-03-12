<%@ page session="true" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Grow Leaf Web</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="logo2.png">
                <img src="logo2.png" width="100" height="50"/>
            </a>    

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="plant.jsp">Plants</a> 
                    </li>

                    
                  <li class="nav-item">
                        <a class="nav-link" href="businessjsp.jsp">Business</a>
                    </li>
                    <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                   Many More
                  </a>
          <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="try.jsp">Try</a></li>
            <li><a class="dropdown-item" href="cart.jsp">MY CART</a></li>
            <li><a class="dropdown-item" href="soil_fertizer.jsp">Soil/Fertilizers</a></li>
            <li><a class="dropdown-item" href="pots.jsp">Pots/Decorators</a></li>
            <li><a class="dropdown-item" href="equipment.jsp">Garden Equipments</a></li>
            
          </ul>
        </li>
         <%  String email = (String) session.getAttribute("email");%>
         <%
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(currentDate);
    %>
                </ul>
                <div class="mx-10">
                    <div>
                        <p class="email"> <%= email %> &nbsp; Lastlogin: <%= formattedDate %>  </p>   
                     
                    </div>
                    <a href="cart.jsp"style="margin-right: 10px;"><img src="cart.png" width="30" height="30" alt="My Cart"/></a>
                     <a href="add_to_favourite.jsp"style="margin-right: 10px;"><img src="fav.png" width="30" height="30" alt="Add to Favorites"/></a>
                   
                    
                    
                    <a class="btn btn-outline-light" href="signup.jsp">Sign Up</a>
                <a class="btn btn-outline-light" href="signin.jsp" style="margin-left: 10px">Sign In</a>
                
                </div>
            </div>
        </div>
    </nav>


</body>
</html>

