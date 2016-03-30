<%-- 
    Document   : FeePayment
    Created on : Feb 19, 2016, 7:24:23 PM
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
        <title>Fee Payment</title>
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
        
         %>
        <%
        String fee ="";
        ServletContext context = getServletContext();
         Connection con = (Connection)context.getAttribute("DataConnection");
         String qr = "select * from studentfee where id = ?";
         String id = (String) session.getAttribute("id");
         
         PreparedStatement ps = con.prepareStatement(qr);
         ps.setString(1,id);
          ResultSet rs = ps.executeQuery();
          while(rs.next())
                           {
              fee = rs.getString(2);
                           }
          
        %>
        <div class="alert-box error"><span> Your remaining fee is :</span><%=fee%></div>
        
    <div class="afterlogincontainer"> 
      <div class="afterlogincontainerleft">     
         <jsp:include page="Left.jsp" /> 
      </div> 
      <div id="ProfilePage" class="afterlogincontainerright">
          <div class="editprofile">  
        <form action="FeePayment">
            <ul>
                <li>
                    <strong> ID :</strong>
                    <span> <input type="text" name="id"/></span>
                </li>
                
                 <li>
                    <strong>Amount :</strong>
                    <span><input type="text" name="amount"/></span>
                </li>
                
                <li>
                    <strong>&nbsp;</strong>
                    <span> <input type="submit" value="Pay"/></span>
                </li>
            </ul>
           
        </form>
          </div>
      </div>
    </div>
    </body>
</html>
