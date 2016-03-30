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

/**
 *
 * @author Administrator
 */
public class FeePayment extends HttpServlet {

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
            
           String id = request.getParameter("id");
           int amount = Integer.parseInt(request.getParameter("amount"));
           ServletContext context = getServletContext();
           Connection con = (Connection) context.getAttribute("DataConnection");
             String qr = "select * from studentfee where id = ?";
             PreparedStatement ps = con.prepareStatement(qr);
                 ps.setString(1,id);
                  ResultSet rs = ps.executeQuery();
                 
                  while(rs.next())
                  {
                      int remainingamount = rs.getInt(2);
                      if(amount<=remainingamount)
                      {
                          String qr1 = "update studentfee set fee = ? where id = ?";
                          PreparedStatement ps1 = con.prepareStatement(qr1);
                          ps1.setInt(1,remainingamount-amount);
                          ps1.setString(2,id);
                          ps1.executeUpdate();
                           out.println("Payment is successfully recieved ........");
                          
                 out.println("<a href='index.jsp'>Login Page</a>");
                      }else
                      {
                          out.println("Please check your fee details correctly");
                          out.println("<a href='index.jsp'>Login Page</a>");
                      }
                      
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
