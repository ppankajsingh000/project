
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
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
              
 