<!DOCTYPE html>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit") != null)
    {
        String name=request.getParameter("name");
        String mnumber=request.getParameter("mnumber");
        String price=request.getParameter("amount");
        String pic="image_url";
        String ctgr="plant";
        
     
        String plant_name=request.getParameter("plant_name");
        String plant_care=request.getParameter("plant_care");
        
        
    Connection con ;
    PreparedStatement pst ; 
    ResultSet rs ;

    Class.forName("com.mysql.jdbc.Driver") ;
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_plant" , "root" , "");

    pst = con.prepareStatement("insert into plants(name,mnumber,amount,cat,image_url,plant,care) values (?,?,?,?,?,?,?)");
    pst.setString(1,name);
    pst.setString(2,mnumber);
    pst.setString(3,price);
    pst.setString(4,ctgr);
    pst.setString(5,pic);
    pst.setString(6,plant_name);
    pst.setString(7,plant_care);
    pst.executeUpdate();
    
%>
<script>
    alert("record addedd...");
    </script>
    <%
        }
    %>
    
<html lang="en">
   
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>Product Selling Form</title>
    <style>
       

        .additional-fields {
            display: none;
        }
   
    
        body { background-color: #f8f9fa; }
        .container {
            max-width: 500px;
            margin: auto;
            margin-top: 50px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
        }
        h2 {
            color: #76B947;
             text-align: center;
        }
        label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .custom-file-label::after { content: "Choose File"; }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4">Product Selling Form</h2>
    <form onsubmit="return validateForm()"
           action="UploadImageServleat"
            method="post"
            enctype="multipart/form-data">
        
         <div class="form-group">
          <label for="name">Name:</label>
          <input
            type="text"
            class="form-control"
            id="name"
            name="name"
            required
          />
        </div>
        <div class="form-group">
          <label for="mobile">Mobile Number:</label>
          <input
            type="tel"
            class="form-control"
            id="mobile"
            name="mobile"
            required
          />
        </div>
        <div class="form-group">
          <label for="amount">Amount:</label>
          <input
            type="number"
            class="form-control"
            id="amount"
            name="amount"
            required
          />

         <div class="form-group">
          <label for="image">Image:</label>
          <input
            type="file"
            class="form-control-file"
            id="image"
            name="image_url"
            accept="image/jpeg"
            required
          />
        </div>

        <div class="form-group">
            <label>What do you want to sell?</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="plant" id="Plants" value="Plants" onclick="showPlantFields()">
                <label class="form-check-label" for="Plants">Plants</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="pot" id="Pots" value="Pots" onclick="showPotFields()">
                <label class="form-check-label" for="Pots">Pots/Decorators</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="soil" id="Soil" value="Soil" onclick="showSoilFields()">
                <label class="form-check-label" for="Soil">Soil</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="eqp" id="Equipments" value="Equipments" onclick="showEquipmentsFields()">
                <label class="form-check-label" for="Equipments">Garden Equipments</label>
            </div>
        </div>

  
        <div class="additional-fields" id="plantFields">
            
         <div class="form-group">
          <label for="plantName">Plant Name:</label>
          <input
            type="text"
            class="form-control"
            id="plantName"
            name="plantName"
            required
          />
        </div>
        <div class="form-group">
          <label for="plantCare">Plant Care:</label>
          <textarea
            class="form-control"
            id="plantCare"
            name="plantCare"
            rows="3"
            required
          ></textarea>
           
        </div>

    
        <div class="additional-fields" id="potFields">
            <div class="form-group">
                <label for="potCategory">Category:</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="potCategory" id="ceramic" value="Ceramic">
                    <label class="form-check-label" for="ceramic">Ceramic</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="potCategory" id="clay" value="Clay">
                    <label class="form-check-label" for="clay">Clay</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="potCategory" id="plasticFiber" value="Plastic Fiber">
                    <label class="form-check-label" for="plasticFiber">Plastic Fiber</label>
                </div>
            </div>
            <div class="form-group">
                <label for="color">Color:</label>
                <input type="text" class="form-control" id="color" placeholder="Enter color">
            </div>
            <div class="form-group">
                <label for="type">Type:</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="potType" id="decorative" value="Decorative">
                    <label class="form-check-label" for="decorative">Decorative</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="potType" id="classic" value="Classic">
                    <label class="form-check-label" for="classic">Classic</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="potType" id="handmade" value="Handmade">
                    <label class="form-check-label" for="handmade">Handmade</label>
                </div>
            </div>
        </div>

      
        <div class="additional-fields" id="soilFields">
            <div class="form-group">
                <label for="soilType">Type:</label>
                <input type="text" class="form-control" id="soilType" placeholder="Enter soil type">
            </div>
            <div class="form-group">
                <label for="soilDescription">Description:</label>
                <textarea class="form-control" id="soilDescription" placeholder="Enter soil description"></textarea>
            </div>
            <div class="form-group">
                <label for="characteristics">Characteristics:</label>
                <textarea class="form-control" id="characteristics" placeholder="Enter characteristics"></textarea>
            </div>
            <div class="form-group">
                <label for="goodFor">Good For:</label>
                <input type="text" class="form-control" id="goodFor" placeholder="Enter good for information">
            </div>
        </div>

       
        <div class="additional-fields" id="equipmentsFields">
            <div class="form-group">
                <label for="equipmentsDescription">Description:</label>
                <textarea class="form-control" id="equipmentsDescription" placeholder="Enter equipments description"></textarea>
            </div>
            <div class="form-group">
                <label for="usage">Usage:</label>
                <input type="text" class="form-control" id="usage" placeholder="Enter usage information">
            </div>
        </div>



        <button type="submit" name="submit" class="btn btn-success">Submit</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
   

    function showPlantFields() {
        document.getElementById('plantFields').style.display = 'block';
        document.getElementById('potFields').style.display = 'none';
        document.getElementById('soilFields').style.display = 'none';
        document.getElementById('equipmentsFields').style.display = 'none';
    }

    function showPotFields() {
        document.getElementById('plantFields').style.display = 'none';
        document.getElementById('potFields').style.display = 'block';
        document.getElementById('soilFields').style.display = 'none';
        document.getElementById('equipmentsFields').style.display = 'none';
    }

    function showSoilFields() {
        document.getElementById('plantFields').style.display = 'none';
        document.getElementById('potFields').style.display = 'none';
        document.getElementById('soilFields').style.display = 'block';
        document.getElementById('equipmentsFields').style.display = 'none';
        
        
        
    }

    function showEquipmentsFields() {
        document.getElementById('plantFields').style.display = 'none';
        document.getElementById('potFields').style.display = 'none';
        document.getElementById('soilFields').style.display = 'none';
        document.getElementById('equipmentsFields').style.display = 'block';
    }
</script>

</body>
</html>
