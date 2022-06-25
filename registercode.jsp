<%-- 
    Document   : registercode
    Created on : 7 Jun, 2022, 11:18:21 AM
    Author     : riddhi
--%>

<%@page import = "java.util.*"%>
<%@page import = "java.util.Date"%>
<%@page import = "javax.mail.Authenticator"%>
<%@page import = "javax.mail.Message"%>
<%@page import = "javax.mail.MessagingException"%>
<%@page import = "javax.mail.PasswordAuthentication"%>
<%@page import = "javax.mail.Session"%>
<%@page import = "javax.mail.Transport"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.mail.internet.MimeBodyPart"%>

<%@ page import = "javax.mail.internet.MimeMessage"%>
<%@ page import = "javax.mail.internet.MimeMultipart"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<jsp:include page="header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrap">
            <div id="content">
                <%

                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String password = request.getParameter("psw");
                    String mobno = request.getParameter("mobile");
                    final String to = request.getParameter("email");

                    final String from = "12108106.gvp@gujaratvidyapith.org";
                    final String pass = "Mahadev@2310";

                    String host = "smtp.gmail.com";
                    String port = "587";

                    final String message = "Your Are Successfully Register as " + fname + " " + lname;
                    //String message="your original password";

                    try {
                        Class.forName("org.postgresql.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db", "postgres", "postgres");

                        Statement stmt = conn.createStatement();
                        int i = stmt.executeUpdate("insert into usermaster(first_name,last_name,email,phone_number,password) values('" + fname + "','" + lname + "','" + to + "'," + mobno + ",'" + password + "')");
                        Properties properties = new Properties();
                        properties.put("mail.smtp.host", host);
                        properties.put("mail.smtp.port", port);
                        properties.put("mail.smtp.auth", "true");
                        properties.put("mail.smtp.starttls.enable", "true");
                        properties.put("mail.user", from);
                        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
                        properties.put("mail.password", pass);

                        Authenticator auth = new Authenticator() {
                            public PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(from, pass);
                            }
                        };

                        Session session1 = Session.getInstance(properties, auth);

                        // creates a new e-mail message
                        Message msg = new MimeMessage(session1);

                        msg.setFrom(new InternetAddress(from));
                        InternetAddress[] toAddresses = {new InternetAddress(to)};
                        msg.setRecipients(Message.RecipientType.TO, toAddresses);
                        msg.setSubject("Welcome To Document Management System");
                        msg.setSentDate(new Date());
                        // msg.setText(message);

                        MimeBodyPart messageBodyPart = new MimeBodyPart();
                        messageBodyPart.setContent(message, "text/html");

                        // creates multi-part
                        Multipart multipart = new MimeMultipart();
                        multipart.addBodyPart(messageBodyPart);

                        msg.setContent(multipart);

                        // sends the e-mail
                        Transport.send(msg);

                        if (i < 1) {
                %>
                <script>
                    alert('Something went wrong..!!');
                    window.location = 'registration.jsp';
                </script>
                <%
                } else {
                %>
                <script>
                    alert('Register Successfully.We Send E-mail On Your E-mail Id...!!');
                    window.location = 'home.jsp';
                </script>

                <%
                        }
                        stmt.close();
                        conn.close();

                    } catch (Exception e) {
                        out.println("Could not send email.");

                        out.println("" + e);
                    }


                %>  
            </div>
            <div>
                <jsp:include page="footer.jsp"/>
            </div>
        </div>
    </body>
</html>
