<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
        body {
            background-color: #f8f9fa;
        }

        .card-img {
            width: 200px;
            height: 245px;
            object-fit: cover;
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

        .grand-total {
            margin-top: 50px;
            padding: 20px;
            background-color: #28a745;
            color: #ffffff;
            border-radius: 5px;
            text-align: center;
        }

        .flexing {
            align-content: center;
            justify-content: center;
            display: flex;
            margin-left: 10px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<h2 class="mb-4 heading">My Favorites</h2>

<%
// Get user's email from session
String email = (String) session.getAttribute("email");

// Database connection parameters
String url = "jdbc:mysql://localhost:4306/web_plant";
String username = "root";
String password = "";

// Initialize grand total
double grandTotal = 0;

try {
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    
   
    Connection connection = DriverManager.getConnection(url, username, password);

    // Fetch data from fav_plant table
    PreparedStatement plantPs = connection.prepareStatement("SELECT * FROM fav_plant WHERE email = ?");
    plantPs.setString(1, email);
    ResultSet plantResultSet = plantPs.executeQuery();

    // Fetch data from fav_pots table
    PreparedStatement potsPs = connection.prepareStatement("SELECT * FROM fav_pots WHERE email = ?");
    potsPs.setString(1, email);
    ResultSet potsResultSet = potsPs.executeQuery();

    // Fetch data from fav_soil table
    PreparedStatement soilPs = connection.prepareStatement("SELECT * FROM fav_soil WHERE email = ?");
    soilPs.setString(1, email);
    ResultSet soilResultSet = soilPs.executeQuery();

    // Fetch data from fav_equipment table
    PreparedStatement equipmentPs = connection.prepareStatement("SELECT * FROM fav_equipment WHERE email = ?");
    equipmentPs.setString(1, email);
    ResultSet equipmentResultSet = equipmentPs.executeQuery();
   
%>

<%
    // Display favorite plants
    while (plantResultSet.next()) {
%>
        <div class="container mt-4">
            <div class="card mb-3">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <% String imageName = plantResultSet.getString("image"); %>
                        <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Plant Image">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <% String plantName = plantResultSet.getString("plant_name"); %>
                            <h5 class="card-title"><%= plantName %></h5>
                            <% String plantcare = plantResultSet.getString("plant_care"); %>
                            <p><%= plantcare %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%
    }
    plantResultSet.close();
    plantPs.close();
%>

<%
    // Display favorite pots
    while (potsResultSet.next()) {
%>
        <div class="container mt-4">
            <div class="card mb-3">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <% String imageName = potsResultSet.getString("image"); %>
                        <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Pot Image">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <% String potCategory = potsResultSet.getString("pot_category"); %>
                            <h5 class="card-title"><%= potCategory %> Pot</h5>
                            <% String potType = potsResultSet.getString("pot_type"); %>
                            <p><%= potType %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%
    }
    potsResultSet.close();
    potsPs.close();
%>

<%
    // Display favorite soil
    while (soilResultSet.next()) {
%>
        <div class="container mt-4">
            <div class="card mb-3">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <% String imageName = soilResultSet.getString("image"); %>
                        <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Soil Image">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <% String soilName = soilResultSet.getString("soil_name"); %>
                            <h5 class="card-title"><%= soilName %> Soil</h5>
                            <% String description = soilResultSet.getString("description"); %>
                            <p><%= description %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%
    }
    soilResultSet.close();
    soilPs.close();
%>

<%
    // Display favorite equipment
    while (equipmentResultSet.next()) {
%>
        <div class="container mt-4">
            <div class="card mb-3">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <% String imageName = equipmentResultSet.getString("image"); %>
                        <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Equipment Image">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <% String equipmentName = equipmentResultSet.getString("equipment_name"); %>
                            <h5 class="card-title"><%= equipmentName %></h5>
                            <% String description = equipmentResultSet.getString("description"); %>
                            <p><%= description %></p>
                        </div>
                    </div>
                </div>
            </div>
