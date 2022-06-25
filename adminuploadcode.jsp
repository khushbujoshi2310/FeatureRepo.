<%-- 
    Document   : adminuploadcode
    Created on : 10 Jun, 2022, 2:03:30 PM
    Author     : riddhi
--%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%

    try {
        String filePath = "C:\\Users\\riddhi\\Documents\\NetBeansProjects\\wp\\project_emerging\\web\\file\\";

        MultipartRequest m = new MultipartRequest(request, filePath);
        String fnm = m.getParameter("fnm");
        String Size = m.getParameter("size");
        String Type = m.getParameter("type");
        String disc = m.getParameter("disc");
        String uid = "admin";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db", "postgres", "postgres");
        Statement stmt = conn.createStatement();
        String sql = "insert into document(filename,document_type,description,size,filepath,created_by) values('" + fnm + "','" + Type + "','" + disc + "'," + Size + ",'" + filePath + "','" + uid + "')";
        int res = stmt.executeUpdate(sql);
        if (res < 1) {
            out.println("<script>");
            out.println("alert(Something went wrong..!!)");
            out.println("window.location='adminupload.jpg'");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('File Uploaded Successfully..')");
            out.println("window.location='adminviewfile.jsp'");
            out.println("</script>");

        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

