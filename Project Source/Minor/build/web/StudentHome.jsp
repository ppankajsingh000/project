<%-- 
    Document   : StudentHome
    Created on : Jan 24, 2016, 7:42:01 PM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>Student Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">
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
     //   Class.forName("com.mysql.jdbc.Driver");
          //   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","pankaj0");
                ServletContext context = getServletContext();
             Connection con = (Connection) context.getAttribute("DataConnection");  
            //out.println(con1);               
           String qr="select * from notification";
         Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
             ResultSet rs = stmt.executeQuery(qr);
              rs.afterLast();
              boolean b = true;
              int i = 1;
               while(rs.previous())
                                     {
                    session.setAttribute("alertname"+i,rs.getString(1));
                    session.setAttribute("alert"+i,rs.getString(2));
                    if(i==3)
                                               {
                        break ;
                    }
                   i++;
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
         // Class.forName("com.mysql.jdbc.Drivers");
         // Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/student","root","pankaj0");
          //out.println(con);
            String name = (String)session.getAttribute("name");
             String image = (String) session.getAttribute("image");
              String id = (String)session.getAttribute("id");
              String fathername =(String) session.getAttribute("fathername");
              String mothername=(String)session.getAttribute("mothername");
              String mobile = (String)session.getAttribute("mobile");
            // out.println("<h2 style ='text-align:left'> Welcome "+name+"</h2>");
           //  out.println("<img  src="+image+" height='100' widht='100'");
           
           
         %>
         
         
     
<div class="afterlogincontainer"> 

<div class="afterlogincontainerleft">
     <jsp:include page="Left.jsp" /> 
</div>    
<div id="ProfilePage" class="afterlogincontainerright">
    <div id="LeftCol">
        <center>
        <div id="Photo">
             <img src = "http://pankaj-minor.mybluemix.net/RetrieveImage.jsp" height="200" widht="200"/> 
             <%--    <img src = "http://project-ppankajsingh000.rhcloud.com/Minor/RetrieveImage.jsp" height="200" widht="200"/> --%>
        </div>
        <div id="ProfileOptions">
            <%=name%>
        </div>
        </center>
       
    </div>
    
    <div id="Info">
        <ul>
            <li>
              <strong>Name:</strong>
              <span><%=name%></span>  
            </li>
            
            <li>
                <strong>ID:</strong>
                <span><%=id%></span>
            </li>
            <li>
                <strong>Father Name:</strong>
                <span><%=fathername%></span>
            </li>
            <li>
                <strong>Mother Name:</strong>
                <span><%=mothername%></span>
            </li>
            <li>
                <strong>Mobile:</strong>
                <span><%=mobile%></span>
            </li>
            
        </ul>
        
    </div>

    <!-- Needed because other elements inside ProfilePage have floats -->
    <div style="clear:both"></div>
</div>
        

</div>  
               
        
</body>
    
</html>
