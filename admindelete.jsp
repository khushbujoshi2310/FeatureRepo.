<%-- 
    Document   : delete
    Created on : 7 Jun, 2022, 5:39:57 PM
    Author     : riddhi
--%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<jsp:include page="header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <div id="wrap">

            <%
                String uid = (String) session.getAttribute("user");

                String fid = request.getParameter("id");
                String filePath = "C:\\Users\\riddhi\\Documents\\NetBeansProjects\\wp\\project_emerging\\web\\file\\";

                try {
                    Class.forName("org.postgresql.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db", "postgres", "postgres");

                    Statement stmt = conn.createStatement();

                    String sql = "delete from document where fileid=" + fid;
                    int res = stmt.executeUpdate(sql);

                    if (res < 1) {
                        out.println("<script>");
                        out.println("alert(Something went wrong..!!)");
                        out.println("window.location='adminview.jsp'");
                        out.println("</script>");
                    } else {
                        out.println("<script>");
                        out.println("alert('File Deleted Successfully..')");
                        out.println("window.location='adminview.jsp'");
                        out.println("</script>");
                    }

                    stmt.close();
                    conn.close();

                } catch (Exception e) {
                    out.println("" + e);
                }


            %>  

            <div>
                <jsp:include page="footer.jsp"/>
            </div>
        </div>
    </body>
</html>
