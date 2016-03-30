
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Web application lifecycle listener.
 * @author Administrator
 */
public class StartHandler implements ServletContextListener {
Connection con;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
       // throw new UnsupportedOperationException("Not supported yet.");
         try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
       //      Class.forName("com.ibm.db2.jcc.DB2Driver");
  // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","pankaj0");
  //con = DriverManager.getConnection("jdbc:mysql://127.8.174.2:3306/project","adminuirYc2f","AsxqfFcCmW6B");
         //   con = DriverManager.getConnection("jdbc:db2://75.126.155.153:50000/SQLDB","user02578","vlP8R4SteW03");
        //con = DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-03.cleardb.net/ad_b057b5bf0872bc8?user=b11467a42e7ef4&password=dabc4d28","b11467a42e7ef4","dabc4d28");
  con = DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-03.cleardb.net/ad_d80d4223566e340?user=bef40340228449&password=d16163a3","bef40340228449","d16163a3");
        ServletContext context = sce.getServletContext();
               context.setAttribute("DataConnection",con);
         }
             catch(Exception ex)
             {
                 System.out.println(ex);
             }
         
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
       // throw new UnsupportedOperationException("Not supported yet.");
        try{ 
        con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
}
