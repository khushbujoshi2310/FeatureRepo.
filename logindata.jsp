<%-- 
    Document   : logindata
    Created on : 7 Jun, 2022, 11:22:22 AM
    Author     : riddhi
--%>

<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        String unm = request.getParameter("uname");
        String pass = request.getParameter("password");
        if (unm.equals("admin") && pass.equals("admin")) {
%>
<script>
    window.location = 'adminview.jsp';
</script>
<%
} else {
    if (unm.equals(unm) && pass.equals(pass)) {
        session.setAttribute("user", unm);

    } else {

        response.sendRedirect("home.jsp");
    }

    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db", "postgres", "postgres");
    Statement stmt = conn.createStatement();
    String sql = "select * from usermaster where email='" + unm + "' and password='" + pass + "'";
    ResultSet rs = stmt.executeQuery(sql);
    System.out.println("");
    if (rs.next()) {
        if (rs.getString("usertype").equals("user")) {
%><script>
    window.location = 'view.jsp';
</script>   
<%
} else {
%>
<jsp:forward page="adminhome.jsp"/>
<%
    }
    //out.println("login....");
} else {
%>
<script>
    alert('Invalid User..!!Please Sign Up');
    window.location = 'home.jsp';
</script>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

