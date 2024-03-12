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

@WebServlet("/AddSoilToCartServlet")
public class AddSoilToCartServlet extends HttpServlet {
    boolean status = false;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        
        String soilName = request.getParameter("soil_name");
        String amount = request.getParameter("amount");
        String fileName = request.getParameter("file_name");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String characteristics = request.getParameter("characteristics");
        String goodFor = request.getParameter("good_for");
        Integer qty = 1;
        
        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            String checkQuery = "SELECT COUNT(*) AS count FROM cart_soil WHERE email=? AND soil_name=?";
            PreparedStatement ps = connection.prepareStatement(checkQuery);
            ps.setString(1, email);
            ps.setString(2, soilName);
            ResultSet rs = ps.executeQuery();
            status = rs.next();

            if (!(rs.getInt("count") > 0)) {
                String insertQuery = "INSERT INTO cart_soil (email, soil_name, amount, file_name, type, description, characteristics, good_for, qty) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, soilName);
                preparedStatement.setString(3, amount);
                preparedStatement.setString(4, fileName);
                preparedStatement.setString(5, type);
                preparedStatement.setString(6, description);
                preparedStatement.setString(7, characteristics);
                preparedStatement.setString(8, goodFor);
                preparedStatement.setInt(9, qty);

                preparedStatement.executeUpdate();
                preparedStatement.close();
                response.getWriter().println("<script>alert('Item added successfully');  window.location.replace('soil_fertizer.jsp');</script>");
            } else {
                response.getWriter().println("<script>alert('Item already in cart !! ');  window.location.replace('soil_fertizer.jsp');</script>");
            }
            
        } catch (Exception e) {
            out.println("error" + e);
            // Redirect to an error page
           
        }
    }
}
