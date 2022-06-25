<%-- 
    Document   : forgetpassword
    Created on : 7 Jun, 2022, 11:23:31 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="index1.css">
        <title> Docs | ForgetPassword Page</title>
        <script type="text/javascript">
            function validate()
            {

                var eml = document.Myform.email.value;
                var email = /^[a-z0-9]+@[a-z]+.(com|org)$/;
                if (eml == "")
                {
                    alert("Please Enter Email Address...");
                    document.Myform.email.focus();
                    return false;
                }

                if (email.test(eml) == false)
                {
                    alert("Please Enter in Formated Email Address...");
                    document.Myform.email.focus();
                    return false;
                }

            }

        </script>
    </head>
    <body>
        <div id='wrap'>
            <div id="header">
                <div id="logo">
                    <h1 style="text-align: center;color: green;"><span><img src="image/logo2.jpg" style="" height="60px" width="60px" alt="logo"/></span> Document Management</h1>  
                </div>
            </div>


            <center> <h1 style="margin-top: 130px;">Forgot Password</h1>
                <form name="Myform" action="forgetcode.jsp" method="post" onsubmit="return validate()">
                    <table><tr><td><h2>Email ID:</h2></td><td><input style="font-size: 20px;" class="input-field" type="text" name="email" placeholder='Enter Email Id'/></td></tr><br><br>
                        <tr><td colspan="2"><center> <input style="font-size: 20px;font-weight: bold " type="submit"></center> </td></tr>
                    </table><br/><br/><br/><br/><br/><br/><br/> </form></center>
            <div class="clear"></div>
            <div>
                <jsp:include page="footer.jsp"/> 
            </div>
        </div>

    </body>
</html>