import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class sign_up extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/web_plant", "root", "")) {
                PreparedStatement ps = con.prepareStatement("insert into loginData(firstname,lastname,email,password) value (?,?,?,?)");
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, password);

                int i = ps.executeUpdate();
                pw.println(i + " RECORD INSERTED SUCCESSFULLY");

                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.forward(request, response);

                con.close();
            }

        } catch (ClassNotFoundException | SQLException ex) {
            pw.println(ex);
        }
    }
}
