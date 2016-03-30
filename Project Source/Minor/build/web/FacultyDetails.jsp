<%-- 
    Document   : FacultyDetails
    Created on : Feb 20, 2016, 9:09:29 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        
        <div class="facultycontainer">
           <div class="facultycontainerin">
              <div class="topheader">  &nbsp; </div> 
              <div class="facultycontainerinbody"> 
        <%
        String id = (String)session.getAttribute("id");
         %>
        <form action="FacultyDetailsSave">
            <ul class="adminbodyul">
                <li>
                    <div class="abminlrftside">Name : </div>
                    <div class="abminrightside">
                        <input type="text" name="fname"/>
                    </div>
                </li>
                
                <li>
                    <div class="abminlrftside">Gender :</div>
                    <div class="abminrightside">
                        <select name="fgender">
                           <option>Male</option>
                           <option>Female</option>
                        </select>
                    </div>
                </li>
                
                 <li>
                    <div class="abminlrftside">Address :</div>
                    <div class="abminrightside">
                        <input type="text" name="faddress"/>
                    </div>
                </li>
                <li>
                    <div class="abminlrftside">mobile  :</div>
                    <div class="abminrightside">
                        <input type="text" name="fmobile"/>
                    </div>
                </li>
                <li>
                    <div class="abminlrftside">id     :</div>
                    <div class="abminrightside">
                       <input type="text" name="fid" value="<%=id%>" readonly="readonly"/>
                    </div>
                </li>
                <li>
                    <div class="abminlrftside">&nbsp;</div>
                    <div class="abminrightside">
                       <input type="submit" value="Submit"/>
                    </div>
                </li>
            </ul>  
            </form>
           </div>
         </div>
       </div>
    </body>
</html>
