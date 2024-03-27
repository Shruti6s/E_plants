<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<script>
    // Function to show alert and redirect
    function showAlertAndRedirect() {
        alert("You have been logged out successfully.");
        window.location.href = "signin.jsp";
    }
</script>
</head>
<body>

<%
    // Invalidate the session
    HttpSession sessions = request.getSession(false);
    if (sessions != null) {
        sessions.invalidate();
    }
%>

<!-- Call the JavaScript function on body load to show the alert and redirect -->
<body onload="showAlertAndRedirect()">
</body>

</html>
