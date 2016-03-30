<%-- 
    Document   : FeeUpdater
    Created on : Feb 12, 2016, 9:46:32 PM
    Author     : Administrator
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fee Update</title>
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
        <%
        String branch = request.getParameter("admin_branch");
        //out.println(branch);
        ServletContext context = getServletContext();
           Connection con = (Connection) context.getAttribute("DataConnection");
           String qr = "select id,name from studentdetails where branch = ?";
         //  out.println(qr);
           PreparedStatement ps = con.prepareStatement(qr);
           ps.setString(1,branch);
           ResultSet rs = ps.executeQuery();
           %>
           
           <form action="FeeUpdater">
              
           <h2>Student list</h2>
           <table border ="2">
               <tr>
                   <td><h4> ID </h4></td>
                   <td><h4> NAME </h4></td>
                   <td><h4> SELECT </h4></td>
               </tr>
               
           <%
           int i = 0;
            while(rs.next())
                               {
                String id = rs.getString(1);
                String name = rs.getString(2);
                
             i++;
                 
        %>
        <tr>
            <td> <%=id%> </td>
            <td> <%=name%> </td>
            <td> <input type="checkbox" name="check" value="<%=id%>" /> </td>
        </tr>
             
                  
                        <%
                                               }
                        
              %>
 
           </table>
      
        <div class="facultycontainerinbodyrow admintop">
            <div class="abminlrftside">Fee : </div>
               <div class="abminrightside">
                   <input type="text" name="fee" />
               </div>
         </div
         
          <div class="facultycontainerinbodyrow">
              <div class="abminlrftside">&nbsp;</div>
               <div class="abminrightside">
                   <input type ="submit" value="UPDATE"/>
               </div>
         </div>
       
      </form>
    </div>
   </div>
 </div>
</body>
</html>
