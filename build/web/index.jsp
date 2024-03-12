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
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .navbar {
             background-color: #116530; 
             padding: 15px;
             box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

        .navbar-brand img {
            width: 40px;
        }

        .navbar-toggler-icon {
            background-color: #FFFFEC;
        }
        
        
        .navbar-nav a:hover {
            color: #597E52; 
            
            border-bottom: 2px solid #fff;
            }

        
        .navbar-nav a {
                color: #FFFFEC;
                font-weight: bold;
                margin-right: 20px;
                transition: color 0.3s ease;
                }

        .live-image {
            position: relative;
            height: 520px;
            overflow: hidden;
        }

        .live-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .quote-container {
            position: absolute;
            top: 50%;
            left: 10%;
            transform: translateY(-50%);
            color: #fff;
            z-index: 4;
            text-align: left;
        }

        .quote-container p {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-shop-now {
            background-color: #597E52;
            color: #fff;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-shop-now:hover {
            background-color: #218838;
        }

        .category-heading {
          color: #18A558;
        padding: 15px;
       text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-top: 30px;
        
        }

        .dropdown-item{
            background-color: #116530;
            font-size: 15px;
             border: 2px;
        }
        .dropdown-menu{
            background-color: #116530;
           
        }
        .card {
            border: none;
            transition: transform 0.3s ease;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-img-top {
            border-radius: 15px 15px 0 0;
            object-fit: cover;
            height: 200px;
        }

        .btn-category {
            width: 100%;
            background-color: #76B947;
            color: #fff;
            border: none;
            border-radius: 0 0 15px 15px;
            padding: 10px;
            font-size: 18px;
        }

        .shop-now-heading {
          color: #18A558;
        padding: 15px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-top: 30px;
        /*box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        .email{
            color:white;
            font-size: 15px;
        }
        .about-us {
            background-color: #f8f9fa;
            padding: 50px 0;
            text-align: center;
        }

        .glass-effect {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
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
                        <a class="nav-link" href="">Home</a>
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

    <div class="live-image">
        <img src="img2.jpg" alt="Growing Tree Image">
        <div class="quote-container">
            <p>"Grow Your Heart With Gardening"</p>
            <button class="btn btn-shop-now">Explore Now..</button>
        </div>
    </div>

    <div class="category-heading">Categories</div>

    <div class="container">
        <div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
            <div class="col">
                <div class="card">
                    <img src="https://img.freepik.com/free-photo/elegant-roses-blooming-bush_23-2147829194.jpg?size=626&ext=jpg&uid=R113732626&ga=GA1.1.1413596509.1704338526&semt=ais" class="card-img-top" alt="Card Image">
                    <a href="plant.jsp"> <button class="btn btn-category">Plants</button></a>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="https://img.freepik.com/free-photo/beautiful-house-plants-flower-pots-table_181624-23920.jpg?size=626&ext=jpg&uid=R113732626&ga=GA1.1.1413596509.1704338526&semt=ais" class="card-img-top" alt="Card Image">
                     <a href="pots.jsp"><button class="btn btn-category">Pots/Decoration</button></a>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="https://img.freepik.com/premium-photo/fertile-loam-soil-suitable-planting_38663-893.jpg?size=626&ext=jpg&uid=R113732626&ga=GA1.1.1413596509.1704338526&semt=sph" class="card-img-top" alt="Card Image">
                    <a href="soil_fertizer.jsp"> <button class="btn btn-category">Soil-Fertilizers</button></a>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="https://img.freepik.com/free-photo/still-life-with-gardening-objects_23-2148060608.jpg?size=626&ext=jpg&uid=R113732626&ga=GA1.1.1413596509.1704338526&semt=ais" class="card-img-top" alt="Card Image">
                     <a href="equipment.jsp"><button class="btn btn-category">Equipment</button></a>
                </div>
            </div>
        </div>
    </div>

    <div class="shop-now-heading">Shop Now</div>

    
    
    <div class="container">
        <div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
  


            <%
    
        String url = "jdbc:mysql://localhost:4306/web_plant";
            String username = "root";
            String password = "";
               Class.forName("com.mysql.cj.jdbc.Driver");
    try (Connection connection = DriverManager.getConnection(url, username, password)) {
        String plantQuery = "SELECT * FROM plant ORDER BY amount DESC LIMIT 1";
        String soilQuery = "SELECT * FROM soil ORDER BY amount DESC LIMIT 1";
        String equipmentQuery = "SELECT * FROM equipments ORDER BY amount DESC LIMIT 1";
        String potQuery = "SELECT * FROM pot ORDER BY amount DESC LIMIT 1";

        // Plant card
        Statement plantStatement = connection.createStatement();
        ResultSet plantResultSet = plantStatement.executeQuery(plantQuery);
        if (plantResultSet.next()) {
%>
<div class="col">
    <div class="card">
        <img src="images/<%= plantResultSet.getString("file_name") %>" class="card-img-top" alt="Card Image">
        <div class="card-body">
            <h5 class="card-title"><%= plantResultSet.getString("plant_name") %></h5>
            <p class="card-text"><%= plantResultSet.getString("plant_care") %></p>
            <p class="price">Price: Rs. <%= plantResultSet.getString("amount") %></p>
        </div>
    </div>
</div>
<%
        }
        plantResultSet.close();
        plantStatement.close();

        // Soil card
        Statement soilStatement = connection.createStatement();
        ResultSet soilResultSet = soilStatement.executeQuery(soilQuery);
        if (soilResultSet.next()) {
%>
<div class="col">
    <div class="card">
        <img src="images/<%= soilResultSet.getString("file_name") %>" class="card-img-top" alt="Card Image">
        <div class="card-body">
            <h5 class="card-title"><%= soilResultSet.getString("type") %></h5>
            <p class="card-text"><%= soilResultSet.getString("description") %></p>
            <p class="price">Price: Rs. <%= soilResultSet.getString("amount") %></p>
        </div>
    </div>
</div>
<%
        }
        soilResultSet.close();
        soilStatement.close();

        // Equipment card
        Statement equipmentStatement = connection.createStatement();
        ResultSet equipmentResultSet = equipmentStatement.executeQuery(equipmentQuery);
        if (equipmentResultSet.next()) {
%>
<div class="col">
    <div class="card">
        <img src="images/<%= equipmentResultSet.getString("file_name") %>" class="card-img-top" alt="Card Image">
        <div class="card-body">
            <h5 class="card-title"><%= equipmentResultSet.getString("eq_name") %></h5>
            <p class="card-text"><%= equipmentResultSet.getString("description") %></p>
            <p class="price">Price: Rs. <%= equipmentResultSet.getString("amount") %></p>
        </div>
    </div>
</div>
<%
        }
        equipmentResultSet.close();
        equipmentStatement.close();

        // Pot card
        Statement potStatement = connection.createStatement();
        ResultSet potResultSet = potStatement.executeQuery(potQuery);
        if (potResultSet.next()) {
%>
<div class="col">
    <div class="card">
        <img src="images/<%= potResultSet.getString("file_name") %>" class="card-img-top" alt="Card Image">
        <div class="card-body">
            <h5 class="card-title"><%= potResultSet.getString("pot_category") %></h5>
            <p class="card-text"><%= potResultSet.getString("color") %> <%= potResultSet.getString("pot_type") %></p>
            <p class="price">Price: Rs. <%= potResultSet.getString("amount") %></p>
        </div>
    </div>
</div>
<%
        }
        potResultSet.close();
        potStatement.close();

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error occurred: " + e.getMessage());
    }
%>

        





        </div> 


        <div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
            
            
            
            
            
            
        </div>
    </div>


<div class="about-us">
    <div class="container text-center">
        <h2 class="mb-4">About Us</h2>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="glass-effect p-4">
                    <img src="https://img.freepik.com/free-photo/close-up-soil-sprout_23-2148905253.jpg?size=626&ext=jpg&uid=R113732626&ga=GA1.1.1413596509.1704338526&semt=ais" alt="Team Image" class="img-fluid rounded mb-4">
                    <p>Welcome to Grow Leaf Web, where our team of passionate individuals is dedicated to bringing the beauty of nature into your life. We believe in the positive impact of plants on well-being and the environment.</p>
                    <p>Our diverse team of experts is here to assist you on your journey to becoming a successful gardener. Whether you are a seasoned enthusiast or a beginner, we are committed to providing the resources and support you need.</p>
                    <p>Join us in our mission to make the world greener, one plant at a time. Happy gardening!</p>
                </div>
            </div>
        </div>
    </div>
</div>





</div>

</body>
</html>

