<%-- 
    Document   : logout
    Created on : 7 Jun, 2022, 11:21:39 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
        request.getSession().invalidate();
    %>
    <script>
        window.location = 'home.jsp';
    </script>
</html>
