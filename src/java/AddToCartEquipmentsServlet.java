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
import static java.lang.System.out;

@WebServlet("/AddToCartEquipmentsServlet")
public class AddToCartEquipmentsServlet extends HttpServlet {
    boolean status = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String equipmentName = request.getParameter("equipment_name");
        String number = request.getParameter("number");
        String amount = request.getParameter("amount");
        String fileName = request.getParameter("file_name");
        String description = request.getParameter("description");
        String useFor = request.getParameter("usefor");
        Integer qty = 1;

        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // Check if the record already exists
            String checkQuery = "SELECT COUNT(*) AS count FROM cart_equipments WHERE email=? AND equipment_name=? AND number=?";
            PreparedStatement ps = connection.prepareStatement(checkQuery);
            ps.setString(1, email);
            ps.setString(2, equipmentName);
            ps.setString(3, number);
            ResultSet rs = ps.executeQuery();
            status = rs.next();

            if (!(rs.getInt("count") > 0)) {
                String insertQuery = "INSERT INTO cart_equipments (email, equipment_name, number, amount, file_name, description, use_for, qty) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, equipmentName);
                preparedStatement.setString(3, number);
                preparedStatement.setString(4, amount);
                preparedStatement.setString(5, fileName);
                preparedStatement.setString(6, description);
                preparedStatement.setString(7, useFor);
                preparedStatement.setInt(8, qty);

                preparedStatement.executeUpdate();
                preparedStatement.close();
                response.getWriter().println("<script>alert('Item added successfully');  window.location.replace('equipment.jsp');</script>");
            } else {
                response.getWriter().println("<script>alert('Item already in cart !! ');  window.location.replace('equipment.jsp');</script>");
            }
            ps.close();
            rs.close();
            connection.close();
        } catch (Exception e) {
            out.println("error" + e);
            // Redirect to an error page
        }
    }
}
