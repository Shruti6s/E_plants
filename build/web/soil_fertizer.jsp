<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Soil Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        .card {
            margin-bottom: 20px;
        }
        .quantity-container {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .page-heading {
            color: darkgreen;
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
        }
        .card-img-top {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
      <jsp:include page="navbar.jsp" />
<div class="container">
    <h2 class="page-heading">Soil Details</h2>

    <div class="container-fluid mb-2">
        <div class="search-bar-container">
            <span class="search-label">Search Here:</span>
            <input type="text" class="form-control search-bar">
        </div>
    </div>

    <div class="row">
        <% 
            String url = "jdbc:mysql://localhost:4306/web_plant";
            String username = "root";
            String password = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(url, username, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM soil");

                int count = 0;

                while(resultSet.next()) {
                    String soilType = resultSet.getString("type");
                    String amount = resultSet.getString("amount");
                    String fileName = resultSet.getString("file_name");
                  
                    String soilDisc = resultSet.getString("description");
                    String soilChar = resultSet.getString("characteristics");
                    String goodFor = resultSet.getString("goodfor");
                    String email = (String) session.getAttribute("email");
        %>

        <div class="col-md-3">
            <div class="card">
                <form action="AddSoilToCartServlet" method="post">
                <img src="images/<%= fileName %>" class="card-img-top" >
                <div class="card-body">
                   
                    <p class="card-text"><b>Amount:</b> <%= amount %></p>
                    <p class="card-text"><b>Type:</b> <%= soilType %></p>
                    <p class="card-text"><b>Description:</b> <%= soilDisc %></p>
                    <p class="card-text"><b>Characteristics:</b> <%= soilChar %></p>
                    <p class="card-text"><b>Good For:</b> <%= goodFor %></p>
                    <div class="quantity-container">
                        <input type="hidden" name="email" value="<%= email %>">
                        <input type="hidden" name="soil_name" value="<%= soilType %>">
                        <input type="hidden" name="amount" value="<%= amount %>">
                        <input type="hidden" name="file_name" value="<%= fileName %>">
                       
                        <input type="hidden" name="description" value="<%= soilDisc %>">
                        <input type="hidden" name="characteristics" value="<%= soilChar %>">
                        <input type="hidden" name="good_for" value="<%= goodFor %>">
                        <button type="submit" class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
                </form>
            </div>
        </div>

        <%  
                count++;
                if (count % 4 == 0) {
        %>
        </div>
        <div class="row">
        <%      }
            }
            
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
