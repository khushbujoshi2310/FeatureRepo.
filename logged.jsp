<%-- 
    Document   : logged
    Created on : 7 Jun, 2022, 11:23:01 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("user");
            if (uid == null) {
                out.println("<li style=margin-top: 5px;margin-left: 500px;>You login as : " + uid + "</li>");
        %><!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
        <jsp:forward page="login.jsp"/>
        <%
        } else {//IF THE VALUE IN SESSION IS NOT NULL THEN THE IS USER IS VALID
        %>
        <!-- WE HAVE GIVEN LOGOUT.JSP FILE INORDER TO LOGOUT THE SESSION -->
        <jsp:forward page="view.jsp"/>
        <%}
        %>
    </body>
</html>
