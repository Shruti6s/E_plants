/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author HP
 */
public class Business_Form extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>\n" +
"<html lang=\"en\">\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"    <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
"    <title>Product Selling Form</title>\n" +
"    <style>\n" +
"        body {\n" +
"            background-color: #f8f9fa;\n" +
"        }\n" +
"\n" +
"        .container {\n" +
"            max-width: 500px;\n" +
"            margin: auto;\n" +
"            margin-top: 50px;\n" +
"            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" +
"            padding: 20px;\n" +
"            border-radius: 10px;\n" +
"            background-color: #ffffff;\n" +
"        }\n" +
"\n" +
"        h2 {\n" +
"            color: #007bff;\n" +
"            text-align: center;\n" +
"        }\n" +
"\n" +
"        label {\n" +
"            font-weight: bold;\n" +
"        }\n" +
"\n" +
"        .btn-primary {\n" +
"            background-color: #007bff;\n" +
"            border-color: #007bff;\n" +
"        }\n" +
"\n" +
"        .btn-primary:hover {\n" +
"            background-color: #0056b3;\n" +
"            border-color: #0056b3;\n" +
"        }\n" +
"\n" +
"        .custom-file-label::after {\n" +
"            content: \"Choose File\";\n" +
"        }\n" +
"    </style>\n" +
"</head>\n" +
"<body>\n" +
"\n" +
"<div class=\"container\">\n" +
"    <h2 class=\"mb-4\">Product Selling Form</h2>\n" +
"    <form onsubmit=\"return validateForm()\">\n" +
"        <div class=\"form-group\">\n" +
"            <label for=\"name\">Name:</label>\n" +
"            <input type=\"text\" class=\"form-control\" id=\"name\" placeholder=\"Enter your name\">\n" +
"        </div>\n" +
"\n" +
"        <div class=\"form-group\">\n" +
"            <label for=\"number\">Number:</label>\n" +
"            <input type=\"tel\" class=\"form-control\" id=\"number\" placeholder=\"Enter your phone number\">\n" +
"        </div>\n" +
"\n" +
"        <div class=\"form-group\">\n" +
"            <label for=\"amount\">Amount (INR):</label>\n" +
"            <input type=\"text\" class=\"form-control\" id=\"amount\" placeholder=\"Enter the amount\" oninput=\"formatCurrency(this)\">\n" +
"        </div>\n" +
"\n" +
"        <div class=\"form-group\">\n" +
"            <label>What do you want to sell?</label>\n" +
"            <div class=\"form-check\">\n" +
"                <input class=\"form-check-input\" type=\"radio\" name=\"productType\" id=\"Plants\" value=\"Plants\">\n" +
"                <label class=\"form-check-label\" for=\"Plants\">Plants</label>\n" +
"            </div>\n" +
"            <div class=\"form-check\">\n" +
"                <input class=\"form-check-input\" type=\"radio\" name=\"productType\" id=\"Seeds\" value=\"Seeds\">\n" +
"                <label class=\"form-check-label\" for=\"Seeds\">Equipments</label>\n" +
"            </div>\n" +
"            <div class=\"form-check\">\n" +
"                <input class=\"form-check-input\" type=\"radio\" name=\"productType\" id=\"soil\" value=\"soil/fertilizer\">\n" +
"                <label class=\"form-check-label\" for=\"soil\">Soil/Fertilizer</label>\n" +
"            </div>\n" +
"            <div class=\"form-check\">\n" +
"                <input class=\"form-check-input\" type=\"radio\" name=\"productType\" id=\"pots\" value=\"pots/decorators\">\n" +
"                <label class=\"form-check-label\" for=\"pots\">Pots/Decorators</label>\n" +
"            </div>\n" +
"        </div>\n" +
"\n" +
"        <div class=\"form-group\">\n" +
"            <label for=\"pictures\">Upload Pictures:</label>\n" +
"            <div class=\"custom-file\">\n" +
"                <input type=\"file\" class=\"custom-file-input\" id=\"pictures\" accept=\"image/*\">\n" +
"                <label class=\"custom-file-label\" for=\"pictures\"></label>\n" +
"            </div>\n" +
"        </div>\n" +
"\n" +
"        <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n" +
"    </form>\n" +
"</div>\n" +
"\n" +
"<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>\n" +
"<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js\"></script>\n" +
"<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n" +
"\n" +
"<script>\n" +
"    function validateForm() {\n" +
"        var name = document.getElementById('name').value.trim();\n" +
"        var number = document.getElementById('number').value.trim();\n" +
"        var amount = document.getElementById('amount').value.trim();\n" +
"\n" +
"        if (name === '' || number === '' || amount === '') {\n" +
"            alert('All fields are required.');\n" +
"            return false;\n" +
"        }\n" +
"\n" +
"        // Simple phone number validation (you may need to enhance this)\n" +
"        var phoneRegex = /^[0-9]{10}$/;\n" +
"        if (!phoneRegex.test(number)) {\n" +
"            alert('Invalid phone number.');\n" +
"            return false;\n" +
"        }\n" +
"\n" +
"        // You can add more validation for the amount field if needed\n" +
"\n" +
"        return true;\n" +
"    }\n" +
"\n" +
"    function formatCurrency(input) {\n" +
"        // Format the amount as currency (Indian Rupees)\n" +
"        var value = input.value.replace(/,/g, ''); // Remove commas\n" +
"        var formattedValue = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR' }).format(value);\n" +
"        input.value = formattedValue;\n" +
"    }\n" +
"</script>\n" +
"</body>\n" +
"</html>\n" +
"");
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

//plant---> drop down --> care,name
//pots-->category-->ceramic,clay,plastic fiber
//       color--->option 
//       type-->decorative,classic,handmade

//soil-->name-->
//         type-->,discription...,characteristics...,good for....

//equipments-->name,discription,usage