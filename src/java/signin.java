import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class signin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        processRequest(request, response);

        
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("email") != null) {
                

            response.sendRedirect("index.jsp");
            return; 
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (validate(email, password)) {
            session = request.getSession();
            session.setAttribute("email", email);
            pw.println("Successfully logged in as " + email);

            java.util.Date lastLoginTime = (java.util.Date) session.getAttribute("lastLoginTime");
            if (lastLoginTime == null) {
                lastLoginTime = new java.util.Date();
            }
            session.setAttribute("lastLoginTime", new java.util.Date());
            response.sendRedirect("index.jsp");
        } else {
            pw.print("Sorry!!!\nUsername or Password incorrect");
            request.getRequestDispatcher("signin.jsp").include(request, response);
        }
        pw.close();
    }

    private boolean validate(String email, String password) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/web_plant", "root", "");
            String query = "select * from loginData where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return status;
    } 

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
