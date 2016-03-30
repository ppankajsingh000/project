/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class EditSaveProfile extends HttpServlet {

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
            String image=null;
            String image2=null;
            String blank="";
            String name = request.getParameter("name1");
            String studentid = request.getParameter("studentid1");
            String password = request.getParameter("password1");
            String fathername = request.getParameter("fathername1");
            String mothername = request.getParameter("mothername1");
            String address = request.getParameter("address1");
            String mobile = request.getParameter("mobile1");
            String gender = request.getParameter("abc1");
           
           // out.println(image2);
            ServletContext context = getServletContext();
         Connection con=(Connection) context.getAttribute("DataConnection");
        // String qr = "insert into studentdetails(name,id,password,fname,mname,address,mobile,gender,photo)value(?,?,?,?,?,?,?,?,?) ";
         String qr = "update studentdetails set name = ?, password = ? ,fname = ? ,mname = ? ,address = ? ,mobile = ? ,gender = ? where id = ? ";
           PreparedStatement ps = con.prepareStatement(qr);
           HttpSession session = request.getSession();
        ps.setString(1, name);
        
        ps.setString(2, password);
        ps.setString(3, fathername);
        ps.setString(4, mothername);
        ps.setString(5, address);
        ps.setString(6, mobile);
        ps.setString(7, gender);
      
        ps.setString(8, studentid);
         int a = ps.executeUpdate();
           
         
                session.setAttribute("name",name);
                session.setAttribute("id", studentid);
                session.setAttribute("password", password);
                session.setAttribute("fathername", fathername);
                session.setAttribute("mothername",mothername);
                session.setAttribute("address",address);
                session.setAttribute("mobile", mobile);
                session.setAttribute("gender",gender);
                
               // session.setAttribute("image",image);
          out.println("<html>");
            out.println("<head>");
            out.println("<title>SaveUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 style='border:1px solid blue'>Successfully Registered..</h1>");
            out.println("<h4 style='border:1px solid red'><a href =\"index.jsp\"> Back To The login page </a></h4>");
            
            out.println("</body>");
            out.println("</html>");
        
         
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
