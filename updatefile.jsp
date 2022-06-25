<%-- 
    Document   : updatefile
    Created on : 7 Jun, 2022, 10:27:54 PM
    Author     : riddhi
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<%
    try
    {
        String Path = "C:\\Users\\riddhi\\Documents\\NetBeansProjects\\wp\\project_emerging\\web\\file\\";
        
        MultipartRequest m = new MultipartRequest(request,Path);
        
        
        String img = m.getParameter("fileid");
        String fid = m.getParameter("file1");
        String desc=m.getParameter("disc");
        //String fnm = m.getParameter("fnm");
        String Size = m.getParameter("size");
        String Type = m.getParameter("type");
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db","postgres","postgres");
        Statement stmt = con.createStatement();
        //String sql1 = "insert into document(filepath) values('"+Path+"')";
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("YYYY/MM/dd");
        String date=sdf.format(d);
        String sql = "update document set filename='"+fid+"',document_type='"+Type+"',description='"+desc+"',size="+Size+",filepath='"+Path+"',created_on='"+ date+"' where fileid="+img+"";
        int res = stmt.executeUpdate(sql);
        if(res<1)
        {
            %>
            <script>
                alert("Something went wrong...!!");
                window.location='update.jsp';
            </script>
            <%
        }
        else
        {
            %>
            <script>
                alert("Document Updated Successfully...");
                window.location='view.jsp';
            </script>
            <%
        }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
