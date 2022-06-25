<%-- 
    Document   : home
    Created on : 15 Jun, 2022, 11:45:53 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Docs | LogIn</title>
        <link rel="stylesheet" href="style.css">
        <!---we had linked our css file----->
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
    <body>
        <div class="full-page">
            <div class="navbar">
                <div>
                    <img src="image/logo2.jpg" style="" height="60px" width="60px"/><a href='#'>  Document Management </a>
                </div>
                <!--<nav>
                    <ul>
                        <li><button class='loginbtn' onclick="document.getElementById('login-form').style.display='block'" style="width:auto;">Login</button></li>
                    </ul>
                </nav>-->
            </div>
            <div id='login-form'class='login-page'>
                <div class="form-box">
                    <div class='button-box'>
                        <div ></div>
                        <center><button type='button' onclick='login()'class='toggle-btn'><b>Sign In</b></button></center>
                    </div>
                    <form name="Myform" id="Myform" method="post" onsubmit="return validate();" class='input-group-login' action="logindata.jsp">
                        <input name="uname" type='text'class='input-field' placeholder='Email Id'>
                        <input name="password" type='password'class='input-field' placeholder='Enter Password'><br/>
                        <a href="forgetpassword.jsp" style="color: white;font-size: 15px;margin-left: 160px;">Forgot Password..!</a><br/>
                        <button style="margin-top: 20px;" type='submit'class='submit-btn'><b>Log In</b></button><br/>
                        <a href="registration.jsp" class="submit-btn" style="color: black;font-size: 15px;"><center><b>Sign Up</b></center></a><br/>
                    </form>
                </div>
            </div>
        </div>
        <script>
            var x = document.getElementById('login');
            var y = document.getElementById('register');
            var z = document.getElementById('btn');
            function register()
            {
                x.style.left = '-400px';
                y.style.left = '50px';
                z.style.left = '110px';
            }
            function login()
            {
                x.style.left = '50px';
                y.style.left = '450px';
                z.style.left = '0px';
            }
        </script>
        <script>
            var modal = document.getElementById('login-form');
            window.onclick = function (event)
            {
                if (event.target == modal)
                {
                    modal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
