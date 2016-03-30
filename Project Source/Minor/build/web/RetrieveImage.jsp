<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
 <title>Image Retrieve</title>
</head>
<body bgcolor="lightblue">
     <%    
         String check = (String) session.getAttribute("id");
      // out.println(check);
       if(check==null)
                     {
           response.sendRedirect("index.jsp");
       }
        
         %>

      <%
            // declare a connection by using Connection interface
            Connection connection = null;

            /* Create string of connection url within specified format with machine
   name, port number and database name. Here machine name id localhost
   and database name is student. */

          // String connectionURL = "jdbc:mysql://localhost:3306/image";
          //  String connectionURL = "jdbc:mysql://127.8.174.2:3306/image";
            ServletContext context = getServletContext();
            connection =(Connection) context.getAttribute("DataConnection");
             String id = (String) session.getAttribute("id");
            /*declare a resultSet that works as a table resulted by execute a specified
   sql query. */
            ResultSet rs = null;

            // Declare statement.
            PreparedStatement psmnt = null;
          
      // declare InputStream object to store binary stream of given image.
   InputStream sImage;

            try {

                // Load JDBC driver "com.mysql.jdbc.Driver"
               // Class.forName("com.mysql.jdbc.Driver").newInstance();

    /* Create a connection by using getConnection() method that takes
    parameters of string type connection url, user name and password to
    connect to database. */
               //connection = DriverManager.getConnection(connectionURL, "root", "pankaj0");
               // connection = DriverManager.getConnection(connectionURL, "adminuirYc2f", "AsxqfFcCmW6B");

    /* prepareStatement() is used for create statement object that is
            used for sending sql statements to the specified database. */
                psmnt = connection.prepareStatement("SELECT photo FROM studentdetails WHERE id = ?");

                psmnt.setString(1,id);
                rs = psmnt.executeQuery();
                if(rs.next()) {
                      byte[] bytearray = new byte[1048576];
                      int size=0;
                      sImage = rs.getBinaryStream(1);
                      //response.reset();
                      response.setContentType("image/jpeg");
      %>

    
      
      <%
                      while((size=sImage.read(bytearray))!= -1 ){
                          
                          

                            response.getOutputStream().write(bytearray,0,size);
          }
       }
                
      }
            catch(Exception ex){
    out.println("error :"+ex);
            }
 
           finally {
                // close all the connections.
             //   rs.close();
                //psmnt.close();
              //  connection.close();
           }
   
     %>
     
     
     
 </body>
 </html>