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
public class VerifyAdmin extends HttpServlet {

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
           ServletContext context = getServletContext();
            Connection con = (Connection) context.getAttribute("DataConnection");
           // out.println(con);
            String id = request.getParameter("adminid");
            String password = request.getParameter("password");
            String qr = "select * from admin where id = ? and password = ?";
            PreparedStatement ps = con.prepareStatement(qr);
              ps.setString(1,id);
              ps.setString(2,password);
             ResultSet rs = ps.executeQuery();
             HttpSession session = request.getSession();
              boolean b = rs.next();
             if(b)
             {
                 if(rs.getString(1).equals("234"))
                 {
                     response.sendRedirect("Registration.jsp");
                 }
                 else
                 {
                 session.setAttribute("AdminId",id);
                 response.sendRedirect("AdminHome.jsp");
                 }
             }
             else
             {
                 response.sendRedirect("AdminLogin.jsp");
             }
            
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
