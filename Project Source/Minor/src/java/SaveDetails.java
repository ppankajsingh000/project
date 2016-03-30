/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Administrator
 */
public class SaveDetails extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String name = request.getParameter("name");
            String studentid = request.getParameter("studentid");
            String password = request.getParameter("password");
            String fathername = request.getParameter("fathername");
            String mothername = request.getParameter("mothername");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("abc");
            String image = request.getParameter("image");
            String branch = request.getParameter("branch");
                
           
        //  Class.forName("com.mysql.jdbc.Driver");
    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","pankaj0");
            ServletContext context = getServletContext();
            Connection con = (Connection) context.getAttribute("DataConnection");
       //out.println(con);
      String qr = "insert into studentdetails(name,id,password,fname,mname,address,mobile,gender,photo,branch)value(?,?,?,?,?,?,?,?,?,?) ";
            // String qr = "insert into user02578.studentdetails values(?,?,?,?,?,?,?,?,?,?) ";
       PreparedStatement ps = con.prepareStatement(qr);
       
        ps.setString(1, name);
        ps.setString(2, studentid);
        ps.setString(3, password);
        ps.setString(4, fathername);
        ps.setString(5, mothername);
        ps.setString(6, address);
        ps.setString(7, mobile);
        ps.setString(8, gender);
        ps.setString(9, image);
        ps.setString(10,branch);
         ps.executeUpdate();
         //con.close();
      //   Connection con1 = (Connection) context.getAttribute("DataConnection");
         String a = "0";
         String qr1="insert into studentfee(id,fee)value(?,?)";
         PreparedStatement ps1 = con.prepareStatement(qr1);
          ps1.setString(1,studentid);
          ps1.setString(2,a);
          ps1.executeUpdate();
         
           String a1 = "0";
         String qr2="insert into attendance(id,a,b,c)value(?,?,?,?)";
         PreparedStatement ps2 = con.prepareStatement(qr2);
          ps2.setString(1,studentid);
     
      ps2.setString(2,a1);
      ps2.setString(3,a1);
      ps2.setString(4,a1);
          ps2.executeUpdate();
          
           
         String qr3="insert into midsem(id,a,b,c)value(?,?,?,?)";
         PreparedStatement ps3 = con.prepareStatement(qr3);
          ps3.setString(1,studentid);  
      ps3.setString(2,a1);
      ps3.setString(3,a1);
      ps3.setString(4,a1);
          ps3.executeUpdate();
          
          
          String qr4="insert into sessional(id,a,b,c)value(?,?,?,?)";
         PreparedStatement ps4 = con.prepareStatement(qr4);
          ps4.setString(1,studentid);  
      ps4.setString(2,a1);
      ps4.setString(3,a1);
      ps4.setString(4,a1);
          ps4.executeUpdate();
         /* out.println("<html>");
            out.println("<head>");
            out.println("<title>SaveUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 style='border:1px solid blue'>Successfully Registered..</h1>");
            out.println("<h4 style='border:1px solid red'><a href =\"index.jsp\"> Back To The login page </a></h4>");
            
            out.println("</body>");
            out.println("</html>");*/
         response.sendRedirect("Home.jsp");
         //   String name = 
        }catch(Exception ex)
        {
            out.println(ex);
            ex.printStackTrace();
        }
        finally {            
            //out.close();
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
