
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/UploadImageServlet")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String amount = request.getParameter("amount");
        String productType = request.getParameter("productType");
        
        

        // File upload handling
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        Part filePart = request.getPart("file");
        String fileName = "";
        if (filePart != null) {
            fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            String imagePath = uploadPath + File.separator + fileName;
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, new File(imagePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        }

        // Database connection and data insertion
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UploadImageServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/web_plant", "root", "");

            if (productType.equals("plant")) {
                String sql = "INSERT INTO plant (name, number, amount , file_name, plant_name, plant_care) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                String plantName = request.getParameter("plantName");
                String plantCare = request.getParameter("plantCare");
                
                statement.setString(1, name);
                statement.setString(2, number);
                statement.setString(3, amount);
                statement.setString(4, fileName);
                statement.setString(5,plantName);
                statement.setString(6, plantCare);
                statement.executeUpdate();
                conn.close();

            } else if (productType.equals("soil")) {
                String sql = "INSERT INTO soil (name, number, amount , file_name , type , description , characteristics , goodfor) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                
                String soilType = request.getParameter("soilType");
                String soilDisc = request.getParameter("soilDisc");
                String soilChar = request.getParameter("soilChar");
                String goodFor = request.getParameter("goodFor");
                     
                statement.setString(1, name);
                statement.setString(2, number);
                statement.setString(3, amount);
                statement.setString(4, fileName);
                statement.setString(5, soilType);
                statement.setString(6, soilDisc);
                statement.setString(7, soilChar);
                statement.setString(8, goodFor);
                statement.executeUpdate();
                conn.close();
            }
            else if(productType.equals("equipments")){
                 String sql = "INSERT INTO equipments (name, number, amount , file_name ,eq_name, description , usefor) VALUES (?, ?, ?,?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                
                String eq_name=request.getParameter("eq_name");
                String eq_discription = request.getParameter("eq_discription");
                String eq_usefor = request.getParameter("eq_usefor");
               
                
                statement.setString(1, name);
                statement.setString(2, number);
                statement.setString(3, amount);
                statement.setString(4, fileName);
                statement.setString(5, eq_name);
                statement.setString(6, eq_discription);
                statement.setString(7, eq_usefor);
                statement.executeUpdate(); 
                 conn.close();
            }
            
            else if (productType.equals("pots")) {
    String sql = "INSERT INTO pot (name, number, amount, file_name, pot_category, color, pot_type) VALUES (?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement statement = conn.prepareStatement(sql);
    String potCategory = request.getParameter("potCategory");
    String color = request.getParameter("color");
    String potType = request.getParameter("potType");
                     
    statement.setString(1, name);
    statement.setString(2, number);
    statement.setString(3, amount);
    statement.setString(4, fileName);
    statement.setString(5, potCategory);
    statement.setString(6, color);
    statement.setString(7, potType);
    statement.executeUpdate();
    conn.close();
}
  // Send success message and redirect
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Data inserted successfully'); window.location.replace('index.html');</script>");

            
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection error: " + e.getMessage());
        }
    }
}
