<%-- 
    Document   : admin
    Created on : Jun 11, 2022, 10:06:18 PM
    Author     : Archana
--%>
<%@include file="adminheader.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <style>
        pg-normal {
            color: #000000;
            font-size: 15px;
            cursor: pointer;
            background: #D0B389;
            padding: 2px 4px 2px 4px;
        }

        .pg-selected {
            color: #fff;
            font-size: 15px;
            background: #000000;
            padding: 2px 4px 2px 4px;
        }

        table.yui {
            font-family:arial;
            border-collapse:collapse;
            border: solid 3px #7f7f7f;
            font-size:small;
        }

        table.yui td {
            padding: 5px;
            border-right: solid 1px #7f7f7f;
        }

        table.yui .even {
            background-color: #EEE8AC;
        }

        table.yui .odd {
            background-color: #F9FAD0;
        }

        table.yui th {
            border: 1px solid #7f7f7f;
            padding: 5px;
            height: auto;
            background: #D0B389;
        }

        table.yui th a {
            text-decoration: none;
            text-align: center;
            padding-right: 20px;
            font-weight:bold;
            white-space:nowrap;
        }

        table.yui tfoot td {
            border-top: 1px solid #7f7f7f;
            background-color:#E1ECF9;
        }

        table.yui thead td {
            vertical-align:middle;
            background-color:#E1ECF9;
            border:none;
        }

        table.yui thead .tableHeader {
            font-size:larger;
            font-weight:bold;
        }

        table.yui thead .filter {
            text-align:right;
        }

        table.yui tfoot {
            background-color:#E1ECF9;
            text-align:center;
        }

        table.yui .tablesorterPager {
            padding: 10px 0 10px 0;
        }

        table.yui .tablesorterPager span {
            padding: 0 5px 0 5px;
        }

        table.yui .tablesorterPager input.prev {
            width: auto;
            margin-right: 10px;
        }

        table.yui .tablesorterPager input.next {
            width: auto;
            margin-left: 10px;
        }

        table.yui .pagedisplay {
            font-size:10pt; 
            width: 30px;
            border: 0px;
            background-color: #E1ECF9;
            text-align:center;
            vertical-align:top;
        }

    </style>
    <script>


        function Pager(tableName, itemsPerPage) {

            this.tableName = tableName;
            this.itemsPerPage = itemsPerPage;
            this.currentPage = 1;
            this.pages = 0;
            this.inited = false;
            this.showRecords = function (from, to) {
                var rows = document.getElementById(tableName).rows;
                for (var i = 1; i < rows.length; i++) {
                    if (i < from || i > to)
                        rows[i].style.display = 'none';
                    else
                        rows[i].style.display = '';
                }
            }
            this.showPage = function (pageNumber) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var oldPageAnchor = document.getElementById('pg' + this.currentPage);
                oldPageAnchor.className = 'pg-normal';
                this.currentPage = pageNumber;
                var newPageAnchor = document.getElementById('pg' + this.currentPage);
                newPageAnchor.className = 'pg-selected';
                var from = (pageNumber - 1) * itemsPerPage + 1;
                var to = from + itemsPerPage - 1;
                this.showRecords(from, to);
            }
            this.prev = function () {
                if (this.currentPage > 1)
                    this.showPage(this.currentPage - 1);
            }
            this.next = function () {
                if (this.currentPage < this.pages) {
                    this.showPage(this.currentPage + 1);
                }
            }
            this.init = function () {
                var rows = document.getElementById(tableName).rows;
                var records = (rows.length - 1);
                this.pages = Math.ceil(records / itemsPerPage);
                this.inited = true;
            }
            this.showPageNav = function (pagerName, positionId) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var element = document.getElementById(positionId);
                var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span> ';
                for (var page = 1; page <= this.pages; page++)
                    pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';
                pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal"> Next »</span>';
                element.innerHTML = pagerHtml;
            }
        }

    </script>

</head>
<body>

    <div class="header">

        <form method="post" action="adminview.jsp">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <% String name1 = request.getParameter("document");
                if (name1 == null) {
                    name1 = "";
                } else {
                    name1 = name1;
                }%>
            <input style="margin-top: 40px; font-size: 18px; " type="text"  id="document" name="document" value="<%=name1%>"  placeholder="Search Document..">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <% String date3 = request.getParameter("date1");
                if (date3 == null) {
                    date3 = "";
                } else {
                    date3 = date3;
                }%>

            <label>FROM DATE :</label>
            <input type="date" value="<%=date3%>" name="date1">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <% String date4 = request.getParameter("date2");
                if (date4 == null) {
                    date4 = "";
                } else {
                    date4 = date4;
                }%>

            <label>TO DATE:</label>
            <input type="date" value="<%= date4%>" name = date2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="Go" onclick="return callhdn();"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="button" id="btn">
                <a href="explore.jsp">Excel export</a>
            </button>


        </form>
    </div>
    <br><br>
    <%
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db", "postgres", "postgres");
            Statement statement = connection.createStatement();

            String name = request.getParameter("document");
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");

            String query = "";
            if (name == null && (date1 == null && date2 == null)) {
                query = "select fileid,concat(first_name,last_name) as UserName,filename,description,size,created_by,document.created_on from document,usermaster where document.created_by=usermaster.email";
            } else if (name.length() != 0 && (date1.length() != 0 && date2.length() != 0)) {
                query = "select fileid,concat(first_name,last_name) as UserName,filename,description,size,created_by,document.created_on from document,usermaster where document.created_by=usermaster.email and (filename like '%" + name + "%' or description like '%" + name + "%' or created_by like '%" + name + "%') AND (document.created_on BETWEEN '" + date1 + "' AND '" + date2 + "')";
            } else if (name.length() != 0 || (date1.length() == 0 && date2.length() == 0)) {
                query = "select fileid,concat(first_name,last_name) as UserName,filename,description,size,created_by,document.created_on from document,usermaster where document.created_by=usermaster.email and (filename like '%" + name + "%' or description like '%" + name + "%' or created_by like '%" + name + "%')";
            } else if (name.length() == 0 || (date1.length() != 0 && date2.length() != 0)) {
                query = "select fileid,concat(first_name,last_name) as UserName,filename,description,size,created_by,document.created_on from document,usermaster where document.created_by=usermaster.email and (document.created_on BETWEEN '" + date1 + "' AND '" + date2 + "')";
            }

            ResultSet resultset = statement.executeQuery(query);  %>
<center>
    <h1 style="margin-top: 40px;"> View Documents<a href="adminupload.jsp"><img align='right' height="30px" width="60px" src="image/add.jpg" /></a></h1>
    <table id="tablepaging" style="margin-top: 30px; width: 80% "border=1">
        <tr style="background: rgba(237, 145, 33, 1)">
            <th>File Id</th>
            <th>User Name</th>
            <th>User</th>
            <th>File Name</th>
            <th>Description</th>
            <th>File Size</th>
            <th>Date </th>
            <th>Download</th>
            <th>Delete</th>
        </tr>
        <% while (resultset.next()) {%>
        <tr>
            <td style="width:10%"><center><%=resultset.getString(1)%></center></td>
        <td style="width: 10%"><center><%=resultset.getString(2)%></center></td>
        <td style="width:10%"><center><%=resultset.getString(6)%></center></td>
        <td style="width:15%"><center><%=resultset.getString(3)%></center></td>

        <td style="width:10%"><center><%=resultset.getString(4)%></center></td>
        <td style="width:10%"><center><%=resultset.getString(5)%></center></td>

        <td style="width:10%"><center><%=resultset.getString(7)%></center></td>
        <td style="width:10%"><center><a href="/project_emerging/file/<%=resultset.getString(3)%>" target='_blank' download><img src="image/download.jpeg" height="40px" width="40px" /></center></td>
        <td style="width:10%"><center><a href="admindelete.jsp?id=<%=resultset.getString(1)%>"><img src="image/delete.jpeg" height="50px" width="50px" onclick=""/></center></a></td>
        </tr>
        <% }
            } catch (Exception e) {
                e.printStackTrace();

            }
        %>
    </table><br/>
    <div id="pageNavPosition" style="padding-top: 20px" align="center">
    </div>
    <script type="text/javascript">
        var pager = new Pager('tablepaging', 7);
        pager.init();
        pager.showPageNav('pager', 'pageNavPosition');
        pager.showPage(1);
    </script><br/><br/>

</center>    

</body>
</html>

