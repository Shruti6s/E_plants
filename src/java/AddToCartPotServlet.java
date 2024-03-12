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

@WebServlet("/AddToCartPotServlet")
public class AddToCartPotServlet extends HttpServlet {
    boolean status = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String potCategory = request.getParameter("pot_category");
        String potType = request.getParameter("pot_type");
        String color = request.getParameter("color");
        String amount = request.getParameter("amount");
        String image = request.getParameter("file_name");
        Integer qty = 1;

        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // Check if the record already exists
            String checkQuery = "SELECT COUNT(*) AS count FROM cart_pot WHERE email=? AND pot_category=? AND pot_type=? AND color=? AND image=?";
            PreparedStatement ps = connection.prepareStatement(checkQuery);
            ps.setString(1, email);
            ps.setString(2, potCategory);
            ps.setString(3, potType);
            ps.setString(4, color);
                  ps.setString(5, image);
            ResultSet rs = ps.executeQuery();
            status = rs.next();

            if (!(rs.getInt("count") > 0)) {
                String insertQuery = "INSERT INTO cart_pot (email, pot_category, pot_type, color, amount, image, qty) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, potCategory);
                preparedStatement.setString(3, potType);
                preparedStatement.setString(4, color);
                preparedStatement.setString(5, amount);
                preparedStatement.setString(6, image);
                preparedStatement.setInt(7, qty);

                preparedStatement.executeUpdate();
                preparedStatement.close();
                response.getWriter().println("<script>alert('Item added successfully');  window.location.replace('pots.jsp');</script>");
            } else {
                response.getWriter().println("<script>alert('Item already in cart !! ');  window.location.replace('pots.jsp');</script>");
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
