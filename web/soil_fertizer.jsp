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
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .button-container button {
            flex: 1;
            margin-right: 5px;
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
            <form method="get" action="soil_fertizer.jsp">
                <input class="form-control search-bar" type="text" name="searchKeyword" placeholder="Enter name to search"><br>
                <button class='btn btn-success' type="submit">Search</button>
            </form>
            
            <form method="get" action="soil_fertizer.jsp" class="container-fluid my-20">
                <input type="checkbox" name="sortAscending" value="true">Sort Ascending
                <input type="checkbox" name="sortDescending" value="true">Sort Descending
                <button class='btn btn-success' type="submit">Apply Sort</button>
            </form>
        </div>
    </div>

    <div class="row my-10">
        <% 
            String searchKeyword = request.getParameter("searchKeyword");
            if (searchKeyword == null) {
                searchKeyword = "";
            }
            
            String sortAscending = request.getParameter("sortAscending");
            String sortDescending = request.getParameter("sortDescending");
        
            String url = "jdbc:mysql://localhost:4306/web_plant";
            String username = "root";
            String password = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(url, username, password);
                Statement statement = connection.createStatement();
                
                String query = "SELECT * FROM soil";
                
                if (!searchKeyword.isEmpty()) {
                    query += " WHERE type LIKE '%" + searchKeyword + "%'";
                }
                
                if (sortAscending != null) {
                    query += " ORDER BY amount ASC";
                } else if (sortDescending != null) {
                    query += " ORDER BY amount DESC";
                }
                
                ResultSet resultSet = statement.executeQuery(query);

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
                   
                   
                    <h5 class="card-text"> <%= soilType %></h5><br>
                    <p class="card-text"><b>Description:</b> <%= soilDisc %></p>
                    <p class="card-text"><b>Characteristics:</b> <%= soilChar %></p>
                    <p class="card-text"><b>Good For:</b> <%= goodFor %></p>
                     <p class="card-text"><b>Amount:</b> <%= amount %></p>
                    <div class="quantity-container">
                        <input type="hidden" name="email" value="<%= email %>">
                        <input type="hidden" name="soil_name" value="<%= soilType %>">
                        <input type="hidden" name="amount" value="<%= amount %>">
                        <input type="hidden" name="file_name" value="<%= fileName %>">
                       
                        <input type="hidden" name="description" value="<%= soilDisc %>">
                        <input type="hidden" name="characteristics" value="<%= soilChar %>">
                        <input type="hidden" name="good_for" value="<%= goodFor %>">
                        <div class="button-container">
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                                            </form>

                            <form action='AddToFavSoilServlet' method='post'>
                                <input type="hidden" name="email" value="<%= email %>">
                                <input type="hidden" name="soil_name" value="<%= soilType %>">
                                <input type="hidden" name="description" value="<%= soilDisc %>">
                                <input type="hidden" name="amount" value="<%= amount %>">
                                <input type="hidden" name="image_path" value="<%= fileName %>">
                                <button type="submit" class="btn btn-success">Add to Favorite</button>
                            </form>
                        </div>
                    </div>
                </div>
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

<!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6
