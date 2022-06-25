<%-- 
    Document   : registration
    Created on : 7 Jun, 2022, 11:17:26 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Docs | Registration Page</title>
        <link rel="stylesheet" href="index1.css">

        <script type="text/javascript">

            function error(message) {

                $('#error').show(500, function () {
                    $('#error').html(message);

                })
            }
            function HideError() {
                $('#error').hide(500, function () {});
            }

            function validate()
            {
                var fname = /^[a-zA-Z]+$/;
                var fnm = document.Myform.fname.value;
                if (fnm == "")
                {
                    alert("Please Enter First Name...");
                    document.Myform.fname.focus();
                    return false;
                }
                if (fname.test(fnm) == false)
                {
                    alert("Please Enter Only Alphabets in First Name...");
                    document.Myform.fname.focus();
                    return false;
                }
                if (fnm.length < 2)
                {
                    alert("Please Enter Firsr Name atleast 2 characters...");
                    document.Myform.fname.focus();
                    return false;
                }

                if (fnm.length > 64)
                {
                    alert("Please Enter Firsr Name must be 64 characters...");
                    document.Myform.fname.focus();
                    return false;
                }

                var lname = /^[a-zA-Z]+$/;
                var lnm = document.Myform.lname.value;
                if (lnm == "")
                {
                    alert("Please Enter Last Name...");
                    document.Myform.lname.focus();
                    return false;
                }

                if (lname.test(lnm) == false)
                {
                    alert("Please Enter Only Alphabets in Last Name...");
                    document.Myform.lname.focus();
                    return false;
                }
                if (lnm.length < 2)
                {
                    alert("Please Enter Last Name atleast 2 characters...");
                    document.Myform.lname.focus();
                    return false;
                }
                if (lnm.length > 64)
                {
                    alert("Please Enter Last Name must be 64 characters...");
                    document.Myform.lname.focus();
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
                if (compass == "")
                {
                    alert("Please Enter Confirm Password...");
                    document.Myform.cpsw.focus();
                    return false;
                }

                if (pass != compass)
                {
                    alert("Please Enter Confirm Password Same as Password");
                    document.Myform.cpsw.focus();
                    return false;
                }
                var mobno = /[1-9]{1}[0-9]{9}/;
                var mob = document.Myform.mobile.value;
                if (mob == "")
                {
                    alert("Please Enter Mobile Number...");
                    document.Myform.mobile.focus();
                    return false;
                }

                if (mob.length < 10)
                {
                    alert("Please Enter 10 digit Mobile Number...");
                    document.Myform.mobile.focus();
                    return false;
                }

                if (mob.length > 15)
                {
                    alert("Please Mobile Number must be 15 character...");
                    document.Myform.mobile.focus();
                    return false;
                }

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
                var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                var str2 = removeSpaces(document.getElementById('txtCompare').value);
                if (str2 == "")
                {
                    alert("Please Enter Captcha...");
                    document.Myform.txtCompare.focus();
                    return false;
                }

                if (str1 != str2)
                {
                    alert("Invalid Captcha...!");
                    document.Myform.txtCompare.focus();
                    return false;
                }
                return true;



            }
            function disablePaste()
            {
                alert("You can't Paste In Password Field...!");
                return false;
            }

            function disableCopy()
            {
                alert("You can't Copy Captcha...!");
                return false;
            }
            function disablepCopy()
            {
                alert("You can't Copy Password...!");
                return false;
            }
            function disablecpCopy()
            {
                alert("You can't Copy Confirm Password...!");
                return false;
            }

            function disablecPaste()
            {
                alert("You can't Paste In Confirm Password Field...!");
                return false;
            }
            function disablecaPaste()
            {
                alert("You can't Paste In Captcha Field...!");
                return false;
            }

            /* Function to Generat Captcha */
            function GenerateCaptcha() {
                var chr1 = Math.ceil(Math.random() * 10) + '';
                var chr2 = Math.ceil(Math.random() * 10) + '';
                var chr3 = Math.ceil(Math.random() * 10) + '';

                var str = new Array(4).join().replace(/(.|$)/g, function () {
                    return ((Math.random() * 36) | 0).toString(36)[Math.random() < .5 ? "toString" : "toUpperCase"]();
                });
                var captchaCode = str + chr1 + chr2 + chr3;
                document.getElementById("txtCaptcha").value = captchaCode
            }

            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode

                if (charCode < 31 || (charCode >= 48 && charCode <= 57))
                    return true;
                return false;
            }
            /* Validating Captcha Function */
            /* Remove spaces from Captcha Code */
            function removeSpaces(string) {
                return string.split(' ').join('');
            }

        </script>
    </head>

    <body onload="return GenerateCaptcha();">
        <div id="wrap">
            <div id="header">
                <div id="logo">
                    <h1 style="text-align: center;color: green;"><span><img src="image/logo2.jpg" style=""height="60px" width="60px"alt="logo"/></span> Document Management </h1>  
                </div>
            </div>

            <form name="Myform" id="Myform" action="registercode.jsp" method="post" onsubmit="return validate();">
                <div id="error" style="color:red; font-size:16px; font-weight:bold; padding:10px"></div>
                <center><h1>User Registration form </h1></center><br/><br/>
                <center>
                    <table style="width:500px;">
                        <tr>
                            <td style="font-size: 20px;"><center><b>FirstName:</b> </center></td>
                        <td><input placeholder="Enter FirstName" class="input-field" type="text" name="fname" id="fname" style="font-size: 20px;color:black;" onkeydown="HideError()"/></td>
                        </tr>
                        <tr>
                            <td style="font-size: 20px;"><center><b>LastName: </b></center></td>
                        <td><input placeholder="Enter LastName" type="text" class="input-field" name="lname" style="font-size: 20px;color:black;" id="lname" onkeydown="HideError()" /></td>
                        </tr>
                        <tr>
                            <td style="font-size: 20px;"><center><b>Password:</b> </center></td>
                        <td><input placeholder="Enter Password" id="password" class="input-field" type="password" name="psw" style="font-size: 20px;color:black;" id="psw" maxlength="15" onkeydown="HideError()" oncopy="return disablepCopy();" onpaste="return disablePaste();" oncontextmenu="return disableContextMenu();" /></td>
                        </tr>
                        <tr>
                            <td style="font-size: 20px;"><center><b>Confirm Password: </b></center></td>
                        <td><input type="password" style="font-size: 20px;color:black;" name="cpsw" id="cpsw" class="input-field" placeholder="Enter Confirm Password"  onkeydown="HideError()" onpaste="return disablecPaste();" oncopy='return disablecpCopy();' oncontextmenu="return disableContextMenu(); "/></td>
                        </tr>

                        <tr>
                            <td style="font-size: 20px;"><center><b>Mobile Number: </b></center></td>
                        <td><input placeholder="Enter Phone Number" type="number" class="input-field" style="font-size: 20px;color:black;" name="mobile" id="mobile" onkeypress="return isNumberKey(event)" onkeydown="HideError()" /></td>
                        </tr>
                        <tr>
                            <td style="font-size: 20px;"><center><b>Email Id: </b></center></td>
                        <td><input placeholder="Enter EmailId" type="text" class="input-field" name="email" style="font-size: 20px;color:black;" id="email" onkeydown="HideError()" /></td>
                        </tr>
                        <tr>
                            <td style="font-size: 20px;"><center><b>Capcha: </b></center></td>
                        <td><input type="text" name="txtCompare" id="txtCompare" style=" font-size: 20px;color:black;" class="input-field" placeholder="Enter Capcha" />  </td>
                    </tr><tr><td></td> <td><input type="text" id="txtCaptcha" style="text-align: center; border: none;font-weight: bold; font-size: 20px; font-family: Modern;color:black;" oncopy='return disableCopy();' disabled="none" />  </td>
                    <td> <img id="btnrefresh" src="image/refresh.jpeg" onclick="GenerateCaptcha();" height="40" width="50"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input id="mybtn" style="font-size: 20px;margin-top: 15px; font-weight: bold" type="submit" name="submit" value="Register" /></td>
                </tr>
            </table></center>
        <br/><br/>
    </form>

    <div class= "clear"></div>
    <div>
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>
