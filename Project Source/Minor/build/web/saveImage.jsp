<%-- 
    Document   : saveImage
    Created on : Mar 24, 2016, 10:35:17 PM
    Author     : Administrator
--%>

<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        String id = (String)session.getAttribute("id");
       ServletContext context = getServletContext();
         Connection con = (Connection) context.getAttribute("DataConnection");
    
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   // conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/image","root", "pankaj0");
  
   PreparedStatement psImageInsertDatabase=null;
   
   byte[] b=null;
   try{
      String sqlImageInsertDatabase="update studentdetails set photo = ? where id ="+id;
      psImageInsertDatabase=con.prepareStatement(sqlImageInsertDatabase);
      
      DiskFileItemFactory factory = new DiskFileItemFactory();

        ServletFileUpload sfu = new ServletFileUpload(factory);
       List items = sfu.parseRequest(request);
 
       Iterator iter = items.iterator();
      
      while (iter.hasNext()) {
          FileItem item = (FileItem) iter.next();
         if (!item.isFormField()) {
              b = item.get();
          }
      }
      psImageInsertDatabase.setBytes(1,b);
      psImageInsertDatabase.executeUpdate();
      out.println("Upload successfull....<br>");
      out.println("Go to login page .....");
      out.println("<a href='index.jsp'>Student Login</a>");
      //response.sendRedirect("retrieve_image.jsp");
     // response.sendRedirect("abc3.jsp");
   }
   catch(Exception e)
   {
     e.printStackTrace();
     out.println(e);
    // response.sendRedirect("addimage.jsp");
   }

%>

    </body>
</html>
