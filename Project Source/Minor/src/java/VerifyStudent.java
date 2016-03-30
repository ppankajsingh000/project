/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VerifyStudent extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             String studentid = request.getParameter("studentid");
             String password = request.getParameter("password");
          //  Class.forName("com.mysql.jdbc.Driver");
           // Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","pankaj0");
            ServletContext context = getServletContext();
              Connection con = (Connection) context.getAttribute("DataConnection");
            // out.println(con);
            String qr = "select * from studentdetails where id = ? and password = ?";
            PreparedStatement ps = con.prepareStatement(qr);
            ps.setString(1,studentid);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
           boolean b = rs.next();
           if(b)
           {
               String user = rs.getString(1);
               String id   = rs.getString(2);
               String pass = rs.getString(3);                
               String fathername = rs.getString(4);
       String mothername =  rs.getString(5);
         String address  =  rs.getString(6);
            String mobile = rs.getString(7);
            String gender =  rs.getString(8);
                               
               String photo = rs.getString(9);
               String branch = rs.getString(10);
               
               //out.println(photo);
               HttpSession session = request.getSession();
                session.setAttribute("name",user);
                session.setAttribute("id", id);
                session.setAttribute("password", pass);
                session.setAttribute("fathername", fathername);
                session.setAttribute("mothername",mothername);
                session.setAttribute("address",address);
                session.setAttribute("mobile", mobile);
                session.setAttribute("gender",gender);
                
                session.setAttribute("image",photo);
                session.setAttribute("branch",branch);
                String b2 = "true";
                session.setAttribute("a1",b2);
                 session.setAttribute("a2",b2);
                  session.setAttribute("a3",b2);
              // out.println(user);
             response.sendRedirect("StudentHome.jsp");
           }
           else
           {
               response.sendRedirect("index.jsp");
           }
             
        }
        catch(Exception ex)
        {
            out.println(ex);
        }
        finally {            
            out.close();
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
