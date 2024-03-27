<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Currency" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: none;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            color: #28a745;
        }
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .payment-success-gif {
            display: none;
            text-align: center;
        }
        #paymentFormContainer {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
        }
        #paymentForm {
            width: 100%;
        }
        #paymentSuccessGIF {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4 text-center">Checkout</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Payment Details</h5>
                        <div id="paymentFormContainer">
                            <form id="paymentForm" onsubmit="showPaymentSuccess()">
                                <div class="form-group">
                                    <label for="cardNumber">Card Number</label>
                                    <input type="text" class="form-control" id="cardNumber" placeholder="Enter card number">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="expiryDate">Expiry Date</label>
                                        <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="cvv">CVV</label>
                                        <input type="text" class="form-control" id="cvv" placeholder="CVV">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cardHolderName">Cardholder Name</label>
                                    <input type="text" class="form-control" id="cardHolderName" placeholder="Enter cardholder name">
                                </div>
                                <% String email = (String) session.getAttribute("email"); %>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <label for="email"><%= email %></label>
                                </div>
                                <div class="form-group">
                                    <label for="email">Amount</label>
                                    <label><%= session.getAttribute("grandTotal") %></label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Pay Now</button>
                            </form>
                            <div id="paymentSuccessGIF" class="payment-success-gif">
                                <img src="payment_success.gif" alt="Payment Successful">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showPaymentSuccess() {
            // Prevent form submission
            event.preventDefault();
            
            // Show payment success GIF
            document.getElementById("paymentSuccessGIF").style.display = "block";
        }
    </script>
</body>
</html>
