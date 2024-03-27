<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.io.IOException" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DecimalFormat" %>

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

<h2 class="mb-4 heading">My Cart</h2>

<%
String email = (String) session.getAttribute("email");
String url = "jdbc:mysql://localhost:4306/web_plant";
String username = "root";
String password = "";

double grandTotal = 0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, password);

    // Fetch data from flower_plant table
    PreparedStatement flowerPlantPs = connection.prepareStatement("SELECT * FROM cart_plant WHERE email = ?");
    flowerPlantPs.setString(1, email);
    ResultSet flowerPlantResultSet = flowerPlantPs.executeQuery();

    // Fetch data from cart_soil table
    PreparedStatement cartSoilPs = connection.prepareStatement("SELECT * FROM cart_soil WHERE email = ?");
    cartSoilPs.setString(1, email);
    ResultSet cartSoilResultSet = cartSoilPs.executeQuery();

    // Fetch data from cart_pot table
    PreparedStatement cartPotPs = connection.prepareStatement("SELECT * FROM cart_pot WHERE email = ?");
    cartPotPs.setString(1, email);
    ResultSet cartPotResultSet = cartPotPs.executeQuery();

    // Fetch data from cart_equipments table
    PreparedStatement cartEquipmentsPs = connection.prepareStatement("SELECT * FROM cart_equipments WHERE email = ?");
    cartEquipmentsPs.setString(1, email);
    ResultSet cartEquipmentsResultSet = cartEquipmentsPs.executeQuery();

    boolean cartEmpty = !flowerPlantResultSet.next() && !cartSoilResultSet.next() && !cartPotResultSet.next() && !cartEquipmentsResultSet.next();

    if (cartEmpty) {
%>
<div class="container" align="center">
    <img src="newcart.gif" height="300" width="350" alt="Animated GIF">
</div>
<div style="text-align: center; margin-top: 20px;">
    <p>Your Cart is empty.</p>
    <p>Looks like you have not added anything to your Cart. Go ahead & explore top items.</p>
</div>
<%
} else {
%>

<% while (flowerPlantResultSet.next()) {
%>

<div class="container mt-4">
    <div class="card mb-3">
        <div class="row no-gutters">
            <div class="col-md-4">
                <%-- Display image here --%>
                <% String imageName = flowerPlantResultSet.getString("image"); %>
                <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Product Image">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <%-- Display plant details here --%>
                    <% String plantName = flowerPlantResultSet.getString("plant_name"); %>
                    <h5 class="card-title"><%= plantName %></h5>
                    <% String plantCare = flowerPlantResultSet.getString("plant_care"); %>
                    <p class="card-text"><%= plantCare %></p>
                    <%-- Display quantity here --%>
                    <% int qty = Integer.parseInt(flowerPlantResultSet.getString("qty"));
                    double amount = Double.parseDouble(flowerPlantResultSet.getString("amount"));
                    grandTotal += amount * qty;
                    %>
                    <p class="card-text">QTY: <%= qty %></p>
                    <p class="card-text">Amount: <%= amount %></p>
                    <div class="flexing mx-10">
                        <div class="flexing mx-10">
                            <%-- Form for removing item --%>
                            <form action="DeleteItemServlet" method="post">
                                <input type="hidden" name="plant_name" value="<%= plantName %>">
                                <button class="btn btn-danger">Remove</button>
                            </form>
                        </div>
                        <div>
                            <%-- Form for updating quantity --%>
                            <form action="UpdateItemServlet" method="post">
                                <input type="hidden" name="plant_name" value="<%= plantName %>">
                                <input type="number" name="qty" value="<%= qty %>" min="1" max="10">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<!-- HTML code for displaying cart_soil data -->
<% while (cartSoilResultSet.next()) { %>
<div class="container mt-4">
    <div class="card mb-3">
        <div class="row no-gutters">
            <div class="col-md-4">
                <%-- Display image here --%>
                <% String imageName = cartSoilResultSet.getString("file_name"); %>
                <img src="images/<%= imageName %>" width="150" height="200" class="card-img" alt="Product Image">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <%-- Display soil details here --%>
                    <% String soilName = cartSoilResultSet.getString("soil_name"); %>
                    <h5 class="card-title"><%= soilName %></h5>
                    <% String description = cartSoilResultSet.getString("description"); %>
                    <p class="card-text"><%= description %></p>
                    <%-- Display quantity here --%>
                    <% int qty = Integer.parseInt(cartSoilResultSet.getString("qty"));
                    double amount = Double.parseDouble(cartSoilResultSet.getString("amount"));
                    grandTotal += amount * qty;
                    %>
                    <p class="card-text">QTY: <%= qty %></p>
                    <p class="card-text">Amount: <%= amount %></p>
                    <div class="flexing mx-10">
                        <div class="flexing mx-10">
                            <%-- Form for removing item --%>
                            <form action="DeleteItemServlet" method="post">
                                <input type="hidden" name="SoilType" value="<%= soilName %>">
                                <button class="btn btn-danger">Remove</button>
                            </form>
                        </div>
                        <div>
                            <%-- Form for updating quantity --%>
                            <form action="UpdateItemServlet" method="post">
                                <input type="hidden" name="SoilType" value="<%= soilName %>">
                                <input type="number" name="qty" value="<%= qty %>" min="1" max="10">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<!-- HTML code for displaying cart_pot data -->
<% while (cartPotResultSet.next()) { %>
<div class="container mt-4">
    <div class="card mb-3">
        <div class="row no-gutters">
            <div class="col-md-4">
                <%-- Display image here --%>
                <% String imageName = cartPotResultSet.getString("image"); %>
                <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Product Image">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <% String potCategory = cartPotResultSet.getString("pot_category"); %>
                    <h5 class="card-title"><%= potCategory %> Pot</h5>
                    <% String potType = cartPotResultSet.getString("pot_type"); %>
                    <p class="card-text"><%= potType %></p>
                    <% int qty = Integer.parseInt(cartPotResultSet.getString("qty"));
                    double amount = Double.parseDouble(cartPotResultSet.getString("amount"));
                    grandTotal += amount * qty;
                    %>
                    <p class="card-text">QTY: <%= qty %></p>
                    <p class="card-text">Amount: <%= amount %></p>
                    <div class="flexing mx-10">
                        <div class="flexing mx-10">
                            <form action="DeleteItemServlet" method="post">
                                <input type="hidden" name="pot_category" value="<%= potCategory %>">
                                <button class="btn btn-danger">Remove</button>
                            </form>
                        </div>
                        <div>
                            <form action="UpdateItemServlet" method="post">
                                <input type="hidden" name="pot_category" value="<%= potCategory %>">
                                <input type="number" name="qty" value="<%= qty %>" min="1" max="10">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<!-- HTML code for displaying cart_equipments data -->
<% while (cartEquipmentsResultSet.next()) { %>
<div class="container mt-4">
    <div class="card mb-3">
        <div class="row no-gutters">
            <div class="col-md-4">
                <%-- Display image here --%>
                <% String imageName = cartEquipmentsResultSet.getString("file_name"); %>
                <img src="images/<%= imageName %>" width="200" height="200" class="card-img" alt="Product Image">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <% String equipmentName = cartEquipmentsResultSet.getString("equipment_name"); %>
                    <h5 class="card-title"><%= equipmentName %></h5>
                    <% String description = cartEquipmentsResultSet.getString("description"); %>
                    <p class="card-text"><%= description %></p>
                    <% int qty = Integer.parseInt(cartEquipmentsResultSet.getString("qty"));
                    double amount = Double.parseDouble(cartEquipmentsResultSet.getString("amount"));
                    grandTotal += amount * qty;
                    %>
                    <p class="card-text">QTY: <%= qty %></p>
                    <p class="card-text">Amount: <%= amount %></p>
                    <div class="flexing mx-10">
                        <div class="flexing mx-10">
                            <form action="DeleteItemServlet" method="post">
                                <input type="hidden" name="equipment_name" value="<%= equipmentName %>">
                                <button class="btn btn-danger">Remove</button>
                            </form>
                        </div>
                        <div>
                            <form action="UpdateItemServlet" method="post">
                                <input type="hidden" name="equipment_name" value="<%= equipmentName %>">
                                <input type="number" name="qty" value="<%= qty %>" min="1" max="10">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<%
// Calculate grand total for updation 
DecimalFormat df = new DecimalFormat("#.##");
String grandTotalFormatted = df.format(grandTotal);

// Set grand total in session attribute
session.setAttribute("grandTotal", grandTotalFormatted);
%>
<div>
   <div class="grand-total">
    <h3>Grand Total: <%= grandTotal %></h3>
</div>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <a href="checkout.jsp" class="btn btn-success btn-lg">Checkout</a>
        </div>
    </div>
</div>
 
<div>




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
