<%-- 
    Document   : AdminHome
    Created on : Feb 11, 2016, 11:39:18 PM
    Author     : Administrator
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
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
              <div class="topheader"> 
                  <a href="EndSession">LOGOUT</a>
                
              </div> 
              <div class="facultycontainerinbody"> 
         <%    
         String check = (String) session.getAttribute("AdminId");
      // out.println(check);
       if(check==null)
                     {
           response.sendRedirect("index.jsp");
       }
        
         %>
        <form action="AlertSave" method="post">
            <ul class="adminbodyul">
                <li>
                    <div class="abminlrftside">Alert Name :</div>
                    <div class="abminrightside">
                        <input type="text" name="AlertName"/>
                    </div>
                </li>
                <li> 
                    <div class="abminlrftside">Message :</div>
                    <div class="abminrightside">
                        <textarea name="Message" rows="4" cols="20"></textarea>
                    </div>
                </li>
                <li>
                    <div class="abminlrftside">&nbsp;</div>
                    <div class="abminrightside">
                        <input type="submit" value="SUBMIT"/>
                    </div>
                    </li>
                    <li><hr> </li>
            </ul>
        </form>
        
       
        <h3></h3>     
        <form action="FeeUpdater.jsp">
             <ul class="adminbodyul">
                 <li>
                   <div class="abminlrftside">Choose Department</div>
                   <div class="abminrightside">
                       <select name="admin_branch">
                          <option>CSE</option>
                          <option>IT</option>
                       </select>
                   </div> 
                 </li>
                 
                 <li>
                     <div class="abminlrftside">&nbsp;</div>
                     <div class="abminrightside">
                        <input type="submit" value="Fee Updater"/>
                     </div> 
                 </li>
             </ul>
           </form>
         </div>
       </div>
     </div>
    </body>
</html>
