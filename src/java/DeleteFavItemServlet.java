import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteFavItemServlet")
public class DeleteFavItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
        String itemName = request.getParameter("item_name");
        String itemType = request.getParameter("item_type");

        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            String deleteQuery = "";

            // Determine the table based on itemType
            switch (itemType) {
                case "plant":
                    deleteQuery = "DELETE FROM fav_plant WHERE email = ? AND plant_name = ?";
                    break;
                case "soil":
                    deleteQuery = "DELETE FROM fav_soil WHERE email = ? AND soil_name = ?";
                    break;
                case "equipment":
                    deleteQuery = "DELETE FROM fav_equipment WHERE email = ? AND equipment_name = ?";
                    break;
                case "pot":
                    deleteQuery = "DELETE FROM fav_pots WHERE email = ? AND pot_category = ?";
                    break;
                default:
                   
                    break;
            }

            try (PreparedStatement statement = connection.prepareStatement(deleteQuery)) {
                statement.setString(1, email);
                statement.setString(2, itemName);
                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the page from where deletion was initiated
        response.sendRedirect("add_to_favourite.jsp");
    }
}
