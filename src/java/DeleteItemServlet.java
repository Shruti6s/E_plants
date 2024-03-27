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

@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String plantName = request.getParameter("plant_name");
        String potCt = request.getParameter("pot_category");
        String soilType = request.getParameter("SoilType"); 
        String eqName = request.getParameter("equipment_name");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";
        String deleteQuery = "";
        
        if (plantName != null && !"".equals(plantName)){
            potCt = null ;
            soilType = null ;
            eqName = null ;
            deleteQuery = "DELETE FROM cart_plant WHERE plant_name = ? AND email = ?";
        } else if (potCt != null && !"".equals(potCt)){
            plantName = null ;
            soilType = null ;
            eqName = null ; 
            deleteQuery = "DELETE FROM cart_pot WHERE pot_category = ? AND email = ?";
        } else if (soilType != null && !"".equals(soilType)){
            plantName = null ;
            eqName = null ; 
            potCt = null ; 
            deleteQuery = "DELETE FROM cart_soil WHERE soil_name = ? AND email = ?"; 
        } else if (eqName != null && !"".equals(eqName)){
            plantName = null ; 
            potCt = null ; 
            soilType = null ; 
            deleteQuery = "DELETE FROM cart_equipments WHERE equipment_name = ? AND email = ?";
        }
                
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            PreparedStatement statement = connection.prepareStatement(deleteQuery);
            statement.setString(1, (plantName != null) ? plantName : (potCt != null) ? potCt : (soilType != null) ? soilType : eqName);
            statement.setString(2, email);

            int rowsDeleted = statement.executeUpdate();

            if (rowsDeleted > 0) {
                request.setAttribute("message", "Item deleted successfully");
                response.sendRedirect("cart.jsp");
            } else {
                response.getWriter().println("No rows deleted.");
                response.getWriter().println("Delete Query: " + deleteQuery);
                response.getWriter().println("Email: " + email);
                response.getWriter().println("Plant Name, Pot Category, Soil Type, Equipment Name: " + plantName + " " + potCt + " " + soilType + " " + eqName);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection error: " + e.getMessage());
        }
    }
}
