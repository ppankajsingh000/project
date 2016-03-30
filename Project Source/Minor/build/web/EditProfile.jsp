

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
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
         
        
         ServletContext context = getServletContext();
        Connection con = (Connection) context.getAttribute("DataConnection");
        
         
    
        String id= (String) session.getAttribute("id");
        String qr = "select * from studentdetails where id = ?";
        PreparedStatement ps = con.prepareStatement(qr);
            ps.setString(1,id);
             ResultSet rs = ps.executeQuery();
             String name ="" ;
              String password="";
              String fathername="";
              String mothername="";
              String address ="";
              String mobile ="";
               String gender = "" ;
                String image ="";
                String branch ="";
              while (rs.next())
                                   {
           name = rs.getString(1);
         password = rs.getString(3);
        fathername = rs.getString(4);
        mothername = rs.getString(5);
         address = rs.getString(6);
        mobile = rs.getString(7);
        gender = rs.getString(8);
        //out.println(gender);
        image = rs.getString(9);
        branch = rs.getString(10);
      //  String name = (String)session.getAttribute("name");
       // String id= (String) session.getAttribute("id");
       // String password = (String)session.getAttribute("password");
       // String fathername = (String)session.getAttribute("fathername");
       // String mothername = (String)session.getAttribute("mothername");
       // String address = (String)session.getAttribute("address");
        //String mobile = (String)session.getAttribute("mobile");
        
        //out.println(gender);
       // String image = (String)session.getAttribute("image");
        
               }
               String genders = (String)session.getAttribute("gender");
        %>
        
   <div class="afterlogincontainer">  
      <div class="afterlogincontainerleft">     
         <jsp:include page="Left.jsp" /> 
      </div> 
      <div id="ProfilePage" class="afterlogincontainerright">
          
       <div class="editprofile">   
         <form action="EditSaveProfile" method ="post">
             <ul>
                 
                 <li>
                     <strong> Name        :</strong>
                     <span><input type="text" name="name1" value="<%=name%>" /></span> 
                 </li>
                 <li>
                     <strong> Student ID  : </strong>
                     <span><input type="text" name="studentid1" value="<%=id%>" readonly="readonly"/></span> 
                 </li>
                 <li>
                     <strong> Password    : </strong>
                     <span><input type="password" name="password1" value="<%=password%>"/></span> 
                 </li>
                 <li>
                     <strong> Branch      : </strong>
                     <span>
                         <input type="text" name="studentid1" value="<%=branch%>" readonly="readonly"/>
                         
                         <div class="submessage">(For Changing please contract your department)</div>
                         
                     </span> 
                 </li>
                 <li>
                     <strong> Father Name : </strong>
                     <span><input type="text" name="fathername1" value="<%=fathername%>" /></span> 
                 </li>
                 <li>
                     <strong> Mother Name :  </strong>
                     <span><input type="text" name="mothername1" value="<%=mothername%>" /></span> 
                 </li>
                 
                 <li>
                     <strong> Address     : </strong>
                     <span><input type="text" name="address1" value="<%=address%>" /></span> 
                 </li>
                 <li>
                     <strong> Mobile NO.  : </strong>
                     <span> <input type="text" name="mobile1" value="<%=mobile%>"/></span> 
                 </li>
                 
                 <li>
                     <strong>  &nbsp;</strong>
                      <span>   <%
     
                                                 
                if(genders.equals("male"))
                                       {
     
                   
     %>
    Male        : <input type="radio" name="abc1" value="male"  checked="checked" />
                 
    Female      : <input type="radio" name="abc1" value="female" />
              
<% 
                }
                else
                                       {
           //  out.println("hii");
 %>                
    
    Male        : <input type="radio" name="abc1" value="male" />
                 
    Female      : <input type="radio" name="abc1" value="female" checked="checked"/>
 <%  
  }
      
          

 %></span>
    
                 </li>
                 
                 <li>
                     <strong>  &nbsp;</strong>
                     <span>
                         <input type="submit" value="EDIT DETAILS"/>
                     </span>
                     
                 </li>
                 
                 
             </ul> 
      

                  
            </pre>
        </form>
       </div>
      </div>
   </div>
    </body>
</html>
