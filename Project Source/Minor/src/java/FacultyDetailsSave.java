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

/**
 *
 * @author Administrator
 */
public class FacultyDetailsSave extends HttpServlet {

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
            String fname = request.getParameter("fname");
            String fgender = request.getParameter("fgender");
            String faddress = request.getParameter("faddress");
            String fmobile = request.getParameter("fmobile");
            String fid = request.getParameter("fid");
            ServletContext context = getServletContext();
            Connection con = (Connection) context.getAttribute("DataConnection");
           String qr = "insert into facultydetails(name,gender,address,mobile,id)values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(qr);
             ps.setString(1,fname);
             ps.setString(2,fgender);
             ps.setString(3,faddress);
             ps.setString(4,fmobile);
             ps.setString(5,fid);
              int a = ps.executeUpdate();
              if(a==1)
              {
                  response.sendRedirect("FacultyHome.jsp");
              }
              else
              {
                  out.println("Error");
              }
            out.println("<a href='FacultyLogin.jsp'>BACK TO >>>>LOGIN IN PAGE</a>");
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
