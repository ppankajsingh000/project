<%-- 
    Document   : AttendanceView
    Created on : Feb 21, 2016, 10:42:00 AM
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
        <title>Attendance</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
        <link rel="stylesheet" href="css/style.css"></link>
        <style>
        
      body{ background: url("light.jpg") no-repeat center center fixed;
    background-size: cover;
    background-repeat: no-repeat;
    padding-top:5px;}
    </style>
    </head>
    <body>
           <%    
         String check = (String) session.getAttribute("id");
      // out.println(check);
       if(check==null)
                     {
           response.sendRedirect("index.jsp");
       }
         
         
        
         String b1 = (String) session.getAttribute("a1");
            // out.println(b1);
             if(b1.equals("true"))
                                 {
                 String alertname = (String) session.getAttribute("alertname1");
                 String alert = (String) session.getAttribute("alert1");
                 %>
          
                 <div class="alert-box notice"><span><%=alertname%> : </span><%=alert%>
                     <a href="AlertClose?id=1" style="float:right;"><img src="uck.gif" /></a>  </div>
                 <%
             }
         
            String b2 = (String) session.getAttribute("a2");
              if(b2.equals("true"))
                                   {
                  String alertname1 = (String) session.getAttribute("alertname2");
                 String alert1 = (String) session.getAttribute("alert2");
              
                      %>
                  <div class="alert-box success"><span><%=alertname1%> : </span><%=alert1%> <a href="AlertClose?id=2" style="float:right;"><img src="uck.gif" /></a></div>    
                      
                      
        <%
               }
            
            
              String b3 = (String) session.getAttribute("a3");
              if(b3.equals("true"))
                                   {
                String alertname2 = (String) session.getAttribute("alertname3");
                 String alert2 = (String) session.getAttribute("alert3");
              
                      %>
              
              <div class="alert-box warning "><span><%=alertname2%> : </span><%=alert2%> <a href="AlertClose?id=3" style="float:right;"><img src="uck.gif" /></a></div>
              
              
              
              <%
                           }
       
        String marksa ="";
        String marksb ="";
        String marksc ="";
        String id = (String)session.getAttribute("id");
         ServletContext context = getServletContext();
             Connection con = (Connection) context.getAttribute("DataConnection");  
             String qr = "select * from attendance where id = ?";
             PreparedStatement ps = con.prepareStatement(qr);
              ps.setString(1,id);
          ResultSet rs = ps.executeQuery();
  %>
          
          
          
    <div class="afterlogincontainer"> 
      <div class="afterlogincontainerleft">     
         <jsp:include page="Left.jsp" /> 
      </div> 
      
      <div id="ProfilePage" class="afterlogincontainerright">
         
   <table>
               <tr>
                   <th><h5> Subject Name  </h5></th>
                   <th><h5>   Attendance  </h5></th>
                   
                   
               </tr>
               <%
          while(rs.next())
                           {
              marksa = rs.getString(2);
              marksb = rs.getString(3);
              marksc = rs.getString(4);
                          }
        %>
        
        
        <tr>
                   <td><h4>a</h4></td>
                   <td><h4><%=marksa%></h4></td>              
               </tr>
                <tr>
                   <td><h4> b  </h4></td>
                   <td><h4> <%=marksb%>  </h4></td>              
               </tr>
                <tr>
                   <td><h4> c  </h4></td>
                   <td><h4> <%=marksc%>  </h4></td>              
               </tr>
   </table>
               <hr>
               <a href="StudentHome.jsp">Back to the Home page </a>
      </div>      
    </div>           
        
    </body>
</html>
