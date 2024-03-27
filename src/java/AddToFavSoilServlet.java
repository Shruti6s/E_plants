import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToFavSoilServlet")
public class AddToFavSoilServlet extends HttpServlet {
    boolean status = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        String soilName = request.getParameter("soil_name");
        String description = request.getParameter("description");
        String amount = request.getParameter("amount");
        String imagePath = request.getParameter("image_path");
        Integer qty = 1;

        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            String checkQuery = "SELECT COUNT(*) AS count FROM fav_soil WHERE email=? AND soil_name=?";
            PreparedStatement ps = connection.prepareStatement(checkQuery);
            ps.setString(1, email);
            ps.setString(2, soilName);
            ResultSet rs = ps.executeQuery();
            status = rs.next();

            if (!(rs.getInt("count") > 0)) {
                String insertQuery = "INSERT INTO fav_soil (email, soil_name, description, amount, image, qty) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, soilName);
                preparedStatement.setString(3, description);
                preparedStatement.setString(4, amount);
                preparedStatement.setString(5, imagePath);
                preparedStatement.setInt(6, qty);

                preparedStatement.executeUpdate();
                preparedStatement.close();
                response.getWriter().println("<script>alert('Item added to favorites successfully'); window.location.replace('soil_fertizer.jsp');</script>");
            } else {
                response.getWriter().println("<script>alert('Item already in favorites'); window.location.replace('soil_fertizer.jsp');</script>");
            }
            ps.close();
            rs.close();
            connection.close();
        } catch (Exception e) {
            // Handle exceptions properly
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred while adding item to favorites'); window.location.replace('soil_fertizer.jsp');</script>");
        }
    }
}
