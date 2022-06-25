<%-- 
    Document   : login
    Created on : 7 Jun, 2022, 11:21:13 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Docs | Login</title>
        <script src="https://smtpjs.com/v3/smtp.js"></script>  
        <script>
            function validate()
            {
                var eml = document.Myform.email.value;
                var email = /^[a-z0-9]+@[a-z]+.(com|org)$/;
                if (email.test(eml) == false)
                {
                    alert("Please Enter in Formated Email Address...");
                    document.Myform.email.focus();
                    return false;
                }

                var pas = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]+$/;
                var pass = document.Myform.psw.value;
                var compass = document.Myform.cpsw.value;

                if (pass == "")
                {
                    alert("Please Enter Password...");
                    document.Myform.psw.focus();
                    return false;
                }
                if (pas.test(pass) == false)
                {
                    alert("password should contain atleast one number and one special character");
                    document.Myform.psw.focus();
                    return false;
                }

                if (pass.length < 6)
                {
                    alert("Please Enter Password atleast 6 Characters...");
                    document.Myform.psw.focus();
                    return false;
                }


            }
        </script>      
    </head>
    <div id="wrap">

        <form name="Myform" id="Myform" action="logindata.jsp" method="post" onsubmit="return Validate();">
            <div id="error" style="color:red; font-size:16px; font-weight:bold; padding:5px"></div>
            <center><h1 style=" margin-top: 20px;">Sign In</h1><br/>

                <table style="width:100px;" border="1">

                    <tr>
                        <td style="font-size: 20px; font-weight: bold"><center>UserName: </center></td>
                    <td><input style="font-size: 20px;margin-top: 10px;font-family: Garamond;margin-bottom: 10px;" placeholder="Enter Email Id" type="text" name="uname" id="fname" onkeydown="HideError()" size="20px;"/></td>
                    </tr>

                    <tr>
                        <td style="font-size: 20px;font-weight: bold"><center>Password: </center></td>
                    <td><input type="password" style="font-size: 20px;margin-top: 10px;font-family: Garamond;margin-bottom: 10px;" placeholder="Enter Password" name="password" id="password" onkeydown="HideError()" size="20px;"/></td>
                    </tr>

                    <tr>
                        <td colspan="2"><center><input type="submit" name="submit" value="Login" style="font-size: 20px;font-weight: bold;margin-top: 10px;margin-bottom: 10px;"  onclick="alert(ValidCaptcha());" /></center></td>
                    </tr>
                    <tr> 
                        <td><center><a href="registration.jsp" style="font-size: 20px;margin-top: 10px;margin-bottom: 10px;font-weight: bold;">Sign Up</a></center></td><br/>
                    <td><center><a href="forgetpassword.jsp" style="font-size: 20px;font-weight: bold;margin-top: 10px;margin-bottom: 10px;">Forget Password..!</a></center></td>
                    </tr>


                </table></center>
        </form>
        <br/><br/>

        <div class= "clear"></div>

        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</body>
</html>
