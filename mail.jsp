<%-- 
    Document   : mailmsg
    Created on : 8 Jun, 2022, 5:03:26 PM
    Author     : 91942
--%>

<%@page import = "java.util.*"%>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String result;

            final String to = request.getParameter("email");
            final String from = "12108106.gvp@gujaratvidyapith.org";
            final String pass = "Mahadev@2310";
            final String message = "your original password";
            String host = "smtp.gmail.com";
            String port = "587";

            try {

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
                //msg.setSubject(subject);
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

                out.println("Email sent.");
            } catch (Exception ex) {
                out.println("Could not send email.");
                ex.printStackTrace();
            }
        %>
    </body>
</html>
