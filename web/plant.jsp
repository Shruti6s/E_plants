

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Plant Details</title>
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
            height: 180px;
        }
    </style>
</head>
<body>
      <jsp:include page="navbar.jsp" />
<div class="container">
    <h2 class="page-heading">Plant Details</h2>

    <div class="container-fluid mb-2">
        <div class="search-bar-container">
            <span class="search-label">Search Here:</span>
              <form method="get" action="plant.jsp">
                  <input class="form-control search-bar" type="text" name="searchKeyword" placeholder="Enter name to search"><br>
                <button class='btn btn-success' type="submit">Search</button>
            </form>
            
            <form method="get" action="plant.jsp" class="container-fluid my-20">
                <input  type="checkbox" name="sortAscending" value="true">Sort Ascending
                <input type="checkbox" name="sortDescending" value="true">Sort Descending
                <button  class='btn btn-success' type="submit">Apply Sort</button>
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
                
                String query = "SELECT * FROM plant";
                
                if (!searchKeyword.isEmpty()) {
                    query += " WHERE plant_name LIKE '%" + searchKeyword + "%'";
                }
                
                if (sortAscending != null) {
                    query += " ORDER BY amount ASC";
                } else if (sortDescending != null) {
                    query += " ORDER BY amount DESC";
                }
                
                ResultSet resultSet = statement.executeQuery(query);

                int count = 0;

                while(resultSet.next()) {
                    String plantName = resultSet.getString("plant_name");
                    String plantCare = resultSet.getString("plant_care");
                    String amount = resultSet.getString("amount");
                    String imageName = resultSet.getString("file_name");
                    String email = (String) session.getAttribute("email");
        %>

        <div class="col-md-3">
            <div class="card">
                <form action="AddToCartServlet" method="post">
                    <img src="images/<%= imageName %>" class="card-img-top" alt="<%= plantName %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= plantName %></h5>
                        <p class="card-text"><%= plantCare %></p>
                        <p class="card-text"><b>Amount:</b> <%= amount %></p>
                        <div class="quantity-container">
                                <input type="hidden" id="name" name="email" value="<%= email %>">
                                <input type="hidden"  id="plant_name" name="plant_name" value="<%= plantName %>">
                                <input type="hidden" id="plant_care" name="plant_care" value="<%= plantCare %>">
                                <input type="hidden" id="price" name="price" value="<%= amount %>">
                                <input type="hidden" id="image_path" name="image_path" value="<%= imageName %>">
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
    
               
                           
                    </div>
                </form>
                 <form action='AddToFavServlet' method='post'>
                <input type="hidden" name="email" value="<%= email %>">
                <input type="hidden" name="plant_name" value="<%= plantName %>">
                <input type="hidden" name="plant_care" value="<%= plantCare %>">
                <input type="hidden" name="price" value="<%= amount %>">
                <input type="hidden" name="image_path" value="<%= imageName %>">
                <button type="submit" class="btn btn-success">Add to Favorite</button>
            </form>        
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
