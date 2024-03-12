<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Selling Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .green-heading {
            color: green;
        }

        .btn-primary {
            background-color: green;
            border-color: green;
        }

        .btn-primary:hover {
            background-color: darkgreen;
            border-color: darkgreen;
        }
    </style>
</head>
<body>
      <jsp:include page="navbar.jsp" />
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center mb-4 green-heading">Product Selling Form</h2>
                        <form action="UploadImageServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="number">Number:</label>
                                <input type="number" class="form-control" id="number" name="number" required>
                            </div>
                            <div class="form-group">
                                <label for="amount">Amount:</label>
                                <input type="text" class="form-control" id="amount" name="amount" required>
                            </div>
                            <div class="form-group">
                                <label for="file">File Upload:</label>
                                <input type="file" class="form-control-file" id="file" name="file">
                            </div>
                            <div class="form-group">
                                <label>Product Type:</label><br>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="productType" id="plantRadio" value="plant">
                                    <label class="form-check-label" for="plantRadio">Plant</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="productType" id="potRadio" value="pots">
                                    <label class="form-check-label" for="potRadio">Pots/Decorators</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="productType" id="soilRadio" value="soil">
                                    <label class="form-check-label" for="soilRadio">Soil</label>
                                </div>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="productType" id="equipmentRadio" value="equipments">
                                    <label class="form-check-label" for="equipmentRadio">Garden Equipments</label>
                                </div>
                            </div>
                            <div id="plantFields" style="display: none;">
                                <div class="form-group">
                                    <label for="plantName">Plant Name:</label>
                                    <input type="text" class="form-control" id="plantName" name="plantName">
                                </div>
                                <div class="form-group">
                                    <label for="plantCare">Plant Care:</label>
                                    <input type="text" class="form-control" id="plantCare" name="plantCare">
                                </div>
                            </div>
                            <div id="soilFields" style="display: none;">
                                <div class="form-group">
                                    <label for="soilType">Soil type:</label>
                                    <input type="text" class="form-control" id="soilType" name="soilType">
                                </div>
                                <div class="form-group">
                                    <label for="soilDisc">Soil discription:</label>
                                    <input type="text" class="form-control" id="soilDisc" name="soilDisc">
                                </div>
                                <div class="form-group">
                                    <label for="soilChar">Soil characteristics:</label>
                                    <input type="text" class="form-control" id="soilChar" name="soilChar">
                                </div>
                                <div class="form-group">
                                    <label for="goodFor">Goods for:</label>
                                    <input type="text" class="form-control" id="goodFor" name="goodFor">
                                </div>
                            </div>
                            <div id="potFields" style="display: none;">
                                <div class="form-group">
                                    <label for="potCategory">Category:</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="potCategory" id="ceramic" value="Ceramic">
                                        <label class="form-check-label" for="ceramic">Ceramic</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="potCategory" id="clay" value="Clay">
                                        <label class="form-check-label" for="clay">Clay</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="potCategory" id="plasticFiber" value="Plastic Fiber">
                                        <label class="form-check-label" for="plasticFiber">Plastic Fiber</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="color">Color:</label>
                                    <input type="text" class="form-control" id="color" name="color" placeholder="Enter color">
                                </div>
                                <div class="form-group">
                                    <label for="type">Type:</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="potType" id="decorative" value="Decorative">
                                        <label class="form-check-label" for="decorative">Decorative</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="potType" id="classic" value="Classic">
                                        <label class="form-check-label" for="classic">Classic</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="potType" id="handmade" value="Handmade">
                                        <label class="form-check-label" for="handmade">Handmade</label>
                                    </div>
                                </div>
                            </div>
                            <div id="equipmentsFields" style="display: none;">
                                <div class="form-group">
                                      <div class="form-group">
                                    <label for="usage">Name:</label>
                                    <input type="text" class="form-control" id="usage" name="eq_name" placeholder="Enter usage information">
                                </div>
                                    <label for="equipmentsDescription">Description:</label>
                                    <textarea class="form-control" id="equipmentsDescription" name="eq_discription" placeholder="Enter equipments description"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="usage">Usage:</label>
                                    <input type="text" class="form-control" id="usage" name="eq_usefor" placeholder="Enter usage information">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success btn-block">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Script to show/hide additional fields based on product type selection
        document.querySelectorAll('input[name="productType"]').forEach(function(elem) {
            elem.addEventListener('change', function() {
                var plantFields = document.getElementById('plantFields');
                var soilFields = document.getElementById('soilFields');
                var equipmentsFields = document.getElementById('equipmentsFields');
                var potFields = document.getElementById('potFields');
                if (this.value === 'plant') {
                    plantFields.style.display = 'block';
                    soilFields.style.display = 'none';
                    potFields.style.display = 'none';
                    equipmentsFields.style.display = 'none';
                } else if (this.value === 'soil') {
                    plantFields.style.display = 'none';
                    soilFields.style.display = 'block';
                    potFields.style.display = 'none';
                    equipmentsFields.style.display = 'none';
                } else if (this.value === 'pots') {
                    plantFields.style.display = 'none';
                    soilFields.style.display = 'none';
                    potFields.style.display = 'block';
                    equipmentsFields.style.display = 'none';
                } else if (this.value === 'equipments') {
                    plantFields.style.display = 'none';
                    soilFields.style.display = 'none';
                    potFields.style.display = 'none';
                    equipmentsFields.style.display = 'block';
                }
            });
        });
    </script>
</body>
</html>
