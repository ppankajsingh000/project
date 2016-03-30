/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class FacultyVerify extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
           // out.println(id);
           // out.println(password);
            ServletContext context = getServletContext();
            Connection con = (Connection) context.getAttribute("DataConnection");
           String qr = "select * from faculty where id = ? and password = ?";
            PreparedStatement ps = con.prepareStatement(qr);
                       ps.setString(1,id);
                       ps.setString(2,password);
                         ps.executeQuery();
                       ResultSet rs = ps.executeQuery();
                       HttpSession session = request.getSession();
                               //out.println(rs.next());
                       while(rs.next())
                       {
                           session.setAttribute("id",id);
                          response.sendRedirect("NewFaculty");
                       }
                    //   out.println("hello");
                       
                       response.sendRedirect("FacultyLogin.jsp");
                
        }catch(Exception ex)
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
