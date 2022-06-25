<%-- 
    Document   : explore
    Created on : 11 Jun, 2022, 10:13:24 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.sql.*"%>
<html>
    <body>
        <%
            String filename = "d:\\csv_file.csv";
            Connection conn = null;
            String url = "jdbc:postgresql://127.0.0.1:5432/";
            String dbName = "emerging_db";
            String driver = "org.postgresql.Driver";
            String userName = "postgres";
            String password = "postgres";
            Statement stmt;
            try {
                FileWriter fw = new FileWriter(filename);
                fw.append("File Id");
                fw.append(',');
                fw.append("User Name");
                fw.append(',');
                fw.append("User");
                fw.append(',');
                fw.append("File Name");
                fw.append(',');
                fw.append("Description");
                fw.append(',');
                fw.append("File Size");
                fw.append(',');
                fw.append("Created Date");

                fw.append('\n');

                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url + dbName, userName, password);
                String query = request.getParameter("doc");

                String Data;
                if (query == null) {
                    Data = "select fileid,concat(first_name,last_name) as UserName,filename,description,size,created_by,document.created_on from document,usermaster where document.created_by=usermaster.email";
                } else {
                    Data = "select fileid,concat(first_name,last_name) as UserName,filename,description,size,created_by,document.created_on from document,usermaster where document.created_by=usermaster.email and (filename like '%" + query + "%' or description like '%" + query + "%' or created_by like '%" + query + "%')";
                }
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(Data);

                while (rs.next()) {
                    fw.append(rs.getString(1));
                    fw.append(',');
                    fw.append(rs.getString(2));
                    fw.append(',');
                    fw.append(rs.getString(3));
                    fw.append(',');
                    fw.append(rs.getString(4));
                    fw.append(',');
                    fw.append(rs.getString(5));
                    fw.append(',');
                    fw.append(rs.getString(6));
                    fw.append(',');
                    fw.append(rs.getString(7));

                    fw.append('\n');
                }
                fw.flush();
                fw.close();
                conn.close();
                out.println("Successfully Created Csv file.");
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>