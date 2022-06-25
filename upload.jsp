<%-- 
    Document   : upload
    Created on : 7 Jun, 2022, 11:20:07 AM
    Author     : riddhi
--%>

<jsp:include page="header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Docs | Upload Page</title>
        <script>
            function fileInfo() {
                var fileName = document.getElementById('userfile').files[0].name;
                var fileSize = document.getElementById('userfile').files[0].size;
                var fileType = document.getElementById('userfile').files[0].type;
                document.frm.fnm.value = fileName;
                document.frm.size.value = fileSize;
                document.frm.type.value = fileType;

                var fileInput =
                        document.getElementById('userfile');

                var filePath = fileInput.value;

                // Allowing file type
                var allowedExtensions = /(\.doc|\.docx|\.pdf|\.txt|\.wpd|\.jpeg|\.xls|\.jpg|\.png|\.csv|\.xlsx)$/i;

                if (!allowedExtensions.exec(filePath)) {
                    alert('Invalid file type');
                    fileInput.value = '';
                    return false;
                }
                const fi = document.getElementById('userfile');
                // Check if any file is selected.
                if (fi.files.length > 0) {
                    for (const i = 0; i <= fi.files.length - 1; i++) {

                        const fsize = fi.files.item(i).size;
                        const file = Math.round((fsize / 1024));
                        // The size of the file.
                        if (file >= 15360) {
                            alert(
                                    "File too Big, please select a file less than 15mb");
                            fileInput.value = '';
                            return false;
                        } else {
                            document.getElementById('size').innerHTML = '<b>'
                                    + file + '</b> KB';
                        }
                    }
                }
            }


        </script>
    </head>
    <body>
        <div id="wrap">

            <form action= "uploadcode.jsp" method="post" name="frm" ENCTYPE="multipart/form-data">
                <br/><br/><br/><br/> <h1><center>Upload File</center></h1><br/><br/><br/>
                <center><table width="350" border="0" cellpadding="1" cellspacing="1" class="box">
                        <tr>
                            <td style="font-weight: bold;font-size: 20px;">Please Select a file</td>
                            <td>
                                <input name="userfile" onchange="fileInfo()" type="file" id="userfile" required> 
                            </td>
                            <td style="color: chocolate;size: 50px;" >Enter Only .doc,.docx, .pdf,.txt,.wpd,.jpeg,.jpg, .png,.csv,.xls,.xlsx Formated File </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; font-size: 20px;">Description: </td>
                            <td><textarea name="disc" placeholder="Description" rows="5"></textarea></td>

                        </tr>
                        <tr>
                            <td colspan="2"><center><input name="upload"type="submit"  class="box" id="upload" value=" Upload "></center></td>
                        </tr>  
                        <input type="hidden" name="fnm" id="fnm" value="" />
                        <input type="hidden" name="size" id="size" value="" />
                        <input type="hidden" name="type" id="type" value="" />
                    </table></center><br/><br/><br/><br/><br/>
            </form>

            <div class= "clear"></div>
            <div>
                <jsp:include page="footer.jsp"/>
            </div>
        </div>  
    </body>
</html>