<%-- 
    Document   : update
    Created on : 7 Jun, 2022, 5:38:10 PM
    Author     : riddhi
--%>

<jsp:include page="header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<html>
    <head>

        <%
            try {
                String fid = request.getParameter("id");

                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db", "postgres", "postgres");
                Statement stmt = conn.createStatement();
                String sql = "select * from document where fileid=" + fid;
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
        %>
        <script>
            function fileInfo() {
                var fileName = document.getElementById('userfile').files[0].name;
                var fileSize = document.getElementById('userfile').files[0].size;
                var fileType = document.getElementById('userfile').files[0].type;
                document.frm.fnm.value = fileName;
                document.frm.size.value = fileSize;
                document.frm.type.value = fileType;
            }
            function funcVal()
            {
                var file = document.getElementById("catimg");
                var image = document.getElementById("img");
                imgcat.value = file.files[0].name;
            }
            function funcdisp()
            {
                var disp = document.getElementById("show");
                disp.style.display = "block";
                var file = document.getElementById("catimg");
            }
            function funchide()
            {
                var disp = document.getElementById("show");
                disp.style.display = "none";
                var image = document.getElementById("img");
                image.src = "file/<%=rs.getString(2)%>";
            }
            var loadFile = function (event)
            {
                var fileName = document.getElementById('catimg').files[0].name;
                var fileSize = document.getElementById('catimg').files[0].size;
                var fileType = document.getElementById('catimg').files[0].type;
                var file = document.getElementById("catimg");
                var image = document.getElementById("img");
                image.src = URL.createObjectURL(event.target.files[0]);
                file.value = '';
                document.frm.file1.value = fileName;
                document.frm.size.value = fileSize;
                document.frm.type.value = fileType;

            }
        </script>
    </head>

    <div id="wrap">
        <form action="updatefile.jsp" name="frm" enctype="multipart/form-data" method="post" style="border-radius:20px;border-color:lightcoral;"> 
            <center>
                <h1 style="color: #ED9121; text-align:center;font-size:35px;font-family:Times New Roman">Edit Document</h1><br/>
                <br/>
                <h3>File Name: <input type="text" name="fnm" value="<%=rs.getString(2)%>" placeholder="&nbsp;&nbsp;Choose File " style="font-size: 15px;" required></h3>

                <br/>
                <a href="#" onclick="funcdisp()" style="font-size: 20px;" ><b>Edit File </b></a>
                <p style="font-size:20px;color:black">Please Select File : </p>
                <div id="show" style="display:none;">

                    <input type="file" onchange="loadFile(event)" accept=".jpg, .jpeg, .png" id="catimg" name="file"/>
                    <h3>Description: <input type="text" style="font-size: 18px;" name="disc"></textarea></h3> <br/><br/>
                </div>
                <input type="hidden" name="fileid" value="<%=rs.getString(1)%>"/>
                <input type="hidden" name="file1" id="imgcat" value="<%=rs.getString(2)%>"/>
                <!-- <input type="hidden" name="fnm" id="fnm" value="" />-->
                <input type="hidden" name="size" id="size" value="<%=rs.getString(5)%>" />
                <input type="hidden" name="type" id="type" value="<%=rs.getString(3)%>" />

                <input type="submit" style="font-weight: bold ;" value="Update File" onclick="funcVal()">
                <br/><br/>    

        </form>
    </center> 
    <div class="clear"></div>

    <div>
        <jsp:include page="footer.jsp"/>
    </div>
</div>   
</body>
</html>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
