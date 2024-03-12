import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;
import java.sql.ResultSet;


@WebServlet("/AddToFavServlet")
public class AddToFavServlet extends HttpServlet {
     boolean status = false;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
         HttpSession session = request.getSession();
         String  email= (String) session.getAttribute("email");
//        String email = request.getParameter("email");
        String plantName = request.getParameter("plant_name");
        String plantCare = request.getParameter("plant_care");
        String price = request.getParameter("price");
        String imagePath = request.getParameter("image_path");
        Integer qty =  1 ; 
        
//        String quantity = request.getParameter("quantity");

        String url = "jdbc:mysql://localhost:4306/web_plant";
        String username = "root";
        String password = "";
     

        
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, password);

    // Check if the record already exists
    String checkQuery = "SELECT COUNT(*) AS count FROM fav_plant WHERE email=? AND plant_name=?";
   PreparedStatement ps = connection.prepareStatement(checkQuery);
            ps.setString(1, email);
            ps.setString(2, plantName);
            ResultSet rs = ps.executeQuery();
            status = rs.next();

    if (!(rs.getInt("count") > 0)) { 
        String insertQuery = "INSERT INTO fav_plant (email, plant_name, plant_care, amount, image, qty) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, plantName);
        preparedStatement.setString(3, plantCare);
        preparedStatement.setString(4, price);
        preparedStatement.setString(5, imagePath);
        preparedStatement.setInt(6, qty);

        preparedStatement.executeUpdate();
        preparedStatement.close();
             response.getWriter().println("<script>alert('Item added in garden successfully ');  window.location.replace('plant.jsp');</script>");
    }
    else {
         response.getWriter().println("<script>alert('Item already in garden !! ');  window.location.replace('plant.jsp');</script>");
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
