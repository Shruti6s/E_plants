<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.io.IOException" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Favourite</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .heading {
            text-align: center;
            color: #28a745;
            margin-top: 50px;
        }

        .container {
            justify-content: center;
            align-items: center;
            height: 280px;
        }
        
        .flexing {
            
            align-content: center ;
            justify-content:  center ;
            display: flex ; 
            margin-left: 10px ;
            margin-right : 10px ; 
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
   

      <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success" role="alert">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
<%
    String email = (String) session.getAttribute("email");
    String url = "jdbc:mysql://localhost:4306/web_plant";
    String username = "root";
    String password = "";

    try 
    {
     Class.forName("com.mysql.cj.jdbc.Driver");
     Connection connection = DriverManager.getConnection(url, username, password);
    
    String checkQuery = "SELECT COUNT(*) AS count FROM fav_plant WHERE email = ?";
        PreparedStatement ps = connection.prepareStatement(checkQuery);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next() && rs.getInt("count") > 0) {
%>
<div class="container mt-4">
    <h2 class="mb-4 heading">My Garden</h2>
    <div class="container mt-4">
        <div class="card mb-3">
            <%
                PreparedStatement itemPs = connection.prepareStatement("SELECT * FROM fav_plant WHERE email = ?");
                itemPs.setString(1, email);
                ResultSet resultSet = itemPs.executeQuery();
                while (resultSet.next()) {
                    String plantName = resultSet.getString("plant_name");
                    String plantCare = resultSet.getString("plant_care");
                    String amount = resultSet.getString("amount");
                    String imageName = resultSet.getString("image");
                    String qty = resultSet.getString("qty") ; 
            %>
            <div class="row no-gutters">
                <div class="col-md-4">
                    <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Product Image">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><%= plantName %></h5>
                        <p class="card-text"> <%= plantCare %></p>
                      
                        <div class="flexing mx-10"> 
                            <div class="flexing mx-10">
                        <form action="DeleteFavItemServlet" method="post">
                            <input type="hidden" name="plant_name" value="<%= plantName %>">
                            <button class="btn btn-danger ">Remove</button>
                        </form>
                            </div>
                         
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
     
    </div>
</div>
<%
        } else {
%>
<div class="container" align="center">
    <img src="fav.gif" height="300" width="350" alt="Animated GIF">
</div>
<div style="text-align: center; margin-top: 20px;">
    <p>Your Garden is empty.</p>
    <p>Looks like you have not added anything to your Garden. Go ahead & explore top items.</p>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
