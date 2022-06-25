<%-- 
    Document   : view
    Created on : 7 Jun, 2022, 11:19:13 AM
    Author     : riddhi
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<jsp:include page="header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Docs | View Page</title>
        
    </head>
    <body>
        
        <div id="wrap">
                <form method="post">
                    <input style="margin-top: 20px;margin-left:1000px; font-size: 17px; " type="text" name="document" placeholder="Search Document..">
                    
                    </form>

                    <%
                        
                        try
                        {
                        
                        String uid = (String)session.getAttribute("user");
                        if(uid==null){response.sendRedirect("login.jsp");}
                        Class.forName("org.postgresql.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db","postgres","postgres");
                        String query=request.getParameter("document");
                        String Data;
                        if(query!=null)
                        {
                            Data="select fileid,filename,description,size,created_on from document where created_by='"+uid+"' and (filename like '%"+query+"%' or description like '%"+query+"%')";
                        }
                        else
                        {
                            Data="select fileid,filename,description,size,created_on from document where created_by='"+uid+"'";
                        }
                        Statement stmt=conn.createStatement();
                        ResultSet rs=stmt.executeQuery(Data);
                        
                        if(rs.isBeforeFirst())
                        {
                            
                    %>
                    <center>
                        <h1 style="margin-top: 40px;"> View Documents </h1>
                        <table style="margin-top: 30px;width: 70%; "border=1">
                    <tr style="background: rgba(237, 145, 33, 1)">
                    <th>File Id</th>
                    <th>File Name</th>
                    <th>Description</th>
                    <th>File Size</th>
                    <th>Date </th>
                    <th>Update</th>
                    <th>Download</th>
                    <th>Delete</th>
                </tr>
                <%
                    while(rs.next()){%>
                <tr>
                    <td style="width:10%"><center><%=rs.getString(1)%></center></td>
                        <td style="width:15%"><center><%=rs.getString(2)%></center></td>
     
        <td style="width:10%"><center><%=rs.getString(3)%></center></td>
        <td style="width:10%"><center><%=rs.getString(4)%></center></td>
        <td style="width:10%"><center><%=rs.getString(5)%></center></td>
        <td style="width:10%"><center><a href="update.jsp?id=<%=rs.getString(1)%>"> <img height="40px" width="40px" src="image/Modify.png"/></center></a></td>
                    <td style="width:10%"><center><a href="/project_emerging/file/<%=rs.getString(2)%>" target='_blank' download><img src="image/download.jpeg" height="40px" width="40px" /></center></td>
        <td style="width:10%"><center><a href="delete.jsp?id=<%=rs.getString(1)%>"><img src="image/delete.jpeg" height="50px" width="50px" onclick=""/></center></a></td>
                </tr>
                <% } 
                   }
else
{
out.print("<center><h1 style=margin-top:100px;>Record Not Found Please Enter Document...! <h1></center>");
}}
catch(SQLException ex){
    out.print("<h1>No record found<h1>");
}
                catch(Exception e)
{
e.printStackTrace();
}%>
            </table><br/><br/>
            <center><a href="upload.jsp"><img height="50px" width="100px" src="image/add.jpg" /></a></center><br/><br/>

                    </center>    
             <div class= "clear"></div>
            <div>
            <jsp:include page="footer.jsp"/>
        </div>
        </div>
        
    </body>
</html>
