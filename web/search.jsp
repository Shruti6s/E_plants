<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Plant" %>

<%
    String searchQuery = request.getParameter("search");
    if (searchQuery != null && !searchQuery.isEmpty()) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/web", "root", "");
            String sql = "SELECT * FROM plant WHERE plant_name LIKE ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchQuery + "%");
            ResultSet rs = pstmt.executeQuery();

            List<Plant> plantList = new ArrayList<>();
            while (rs.next()) {
                Plant plant = new Plant();
                plant.setImageName(rs.getString("image_name"));
                plant.setPlantName(rs.getString("plant_name"));
                plant.setPlantCare(rs.getString("plant_care"));
                plant.setAmount(rs.getInt("amount"));
                plantList.add(plant);
            }

            request.setAttribute("plants", plantList);
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<%@ include file="plant.jsp" %>
