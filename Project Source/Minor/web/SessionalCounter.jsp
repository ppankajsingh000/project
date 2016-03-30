<%-- 
    Document   : SessionalCounter
    Created on : Feb 21, 2016, 9:53:49 AM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sessional Counter</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/faculty.css">
    </head>
    <body>
        
        <div class="facultycontainer">
           <div class="facultycontainerin">
              <div class="topheader"> 
                   <a href='FacultyHome.jsp'>BACK</a>
                
              </div> 
              <div class="facultycontainerinbody"> 
          <%
        String id = "";
        String name ="";
      
            String branch = (String)session.getAttribute("sessionalbranch");
              String subject = (String)session.getAttribute("sessionalsubject");
        ServletContext context = getServletContext();
           Connection con = (Connection) context.getAttribute("DataConnection");
           String qr = "select id,name from studentdetails where branch = ?";
        
           PreparedStatement ps = con.prepareStatement(qr);
           ps.setString(1,branch);
           ResultSet rs = ps.executeQuery();
           %>
           
             <form action="SessionalUpdater">
               <table border="1">
               <tr>
                   <td><h4>  ID   </h4></td>
                   <td><h4>   NAME   </h4></td>
                   <td><h4> MARKS(<%=subject%>)   </h4></td>
                   
                   
               </tr>
           
           <%
           int i = 0;
           while(rs.next())
                             {
               i++;
                id = rs.getString(1);
                name = rs.getString(2);
                
           
        %>
       
         
       
        <tr>
            <td> <%=id%> </td>
            <td> <%=name%> </td>
            <input type="hidden" name="id" value="<%=id%>"/>
         <td><input type="textfield" name="marks" value="" size="10"/> </td>
         
                            
        </tr>
        
        
        <%
               }
         %>
         
               </table>
         
             <p><input type="submit" value="SUBMIT" /></p>
    
             </form>
              </div>
           </div>
        </div>
    </body>
</html>
