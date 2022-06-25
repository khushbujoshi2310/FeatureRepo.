<%-- 
    Document   : viewregistration
    Created on : 10 Jun, 2022, 10:35:33 AM
    Author     : riddhi
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<jsp:include page="adminheader.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Docs | View User</title>
        
    </head>
    <body>
        
        <div id="wrap">
            <div id="content">
                   <%
                        try
                        {
                    
                         Class.forName("org.postgresql.Driver");
                         Connection conn=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db","postgres","postgres");
                         Statement stmt=conn.createStatement();
                         ResultSet rs=stmt.executeQuery("select * from usermaster");
                    %>
                    <center>
                        <h1 style="margin-top: 40px; ">View User</h1>
                        <table style="margin-top: 30px; " border=1>
                <tr style="background: rgba(237, 145, 33, 1)">
                    <th>User Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>E-mail</th>
                    <th>Phone Number</th>
                    
                </tr>
                <% while(rs.next()){%>
                
                <tr>
                    <td style="width:8%"><center><%=rs.getString(1)%></center></td>
                    <td style="width:8%"><center><%=rs.getString(2)%></center></td>
                    <td style="width:8%"><center><%=rs.getString(3)%></center></td>
                    <td style="width:8%"><center><%=rs.getString(4)%></center></td>
                    <td style="width:8%"><center><%=rs.getString(5)%></center></td>
                </tr>
                <% } 
                   }
                catch(Exception e)
{
e.printStackTrace();
}%>
                
            </table>
        </center>    
            </div>
             <div class= "clear"></div>
            <div>
            <jsp:include page="footer.jsp"/>
        </div>
        </div>
        
    </body>
</html>
