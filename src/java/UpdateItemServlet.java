import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String plantName = request.getParameter("plant_name");
        String potCt = request.getParameter("pot_category");
        String soilType = request.getParameter("SoilType"); 
        String eqName = request.getParameter("equipment_name");

        int newQty = Integer.parseInt(request.getParameter("qty"));
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";
        String updateQuery = "";
        
        if (plantName != null && !"".equals(plantName)){
            potCt = null ;
            soilType = null ;
            eqName = null ;
            updateQuery = "UPDATE cart_plant SET qty = ?  WHERE plant_name = ? AND email = ?";
        } else if (potCt != null && !"".equals(potCt)){
            plantName = null ;
            soilType = null ;
            eqName = null ; 
            updateQuery = "UPDATE cart_pot SET qty = ?  WHERE pot_category = ? AND email = ?";
        } else if (soilType != null && !"".equals(soilType)){
            plantName = null ;
            eqName = null ; 
            potCt = null ; 
            updateQuery = "UPDATE cart_soil SET qty = ?  WHERE soil_name = ? AND email = ?"; 
        } else if (eqName != null && !"".equals(eqName)){
            plantName = null ; 
            potCt = null ; 
            soilType = null ; 
            updateQuery = "UPDATE cart_equipments SET qty = ?  WHERE equipment_name = ? AND email = ?";
        }
                
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            PreparedStatement statement = connection.prepareStatement(updateQuery);
            statement.setInt(1, newQty);
            statement.setString(2, (plantName != null) ? plantName : (potCt != null) ? potCt : (soilType != null) ? soilType : eqName);
            statement.setString(3, email);

            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated > 0) {
                request.setAttribute("message", "Item updated successfully");
                response.sendRedirect("cart.jsp");
            } else {
                response.getWriter().println("No rows updated.");
                response.getWriter().println("Update Query: " + updateQuery);
                response.getWriter().println("Email and New Quantity: " + email + " " + newQty);
                response.getWriter().println("Plant Name, Pot Category, Soil Type, Equipment Name: " + plantName + " " + potCt + " " + soilType + " " + eqName);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection error: " + e.getMessage());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Invalid quantity input: " + e.getMessage());
        }
    }
}
