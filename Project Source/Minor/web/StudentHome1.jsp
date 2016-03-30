<%-- 
    Document   : StudentHome
    Created on : Jan 24, 2016, 7:42:01 PM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		
		<link href="http://fonts.googleapis.com/css?family=Raleway:400,300,700" rel="stylesheet" type="text/css">
		
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/ns-default.css" />
		<link rel="stylesheet" type="text/css" href="css/ns-style-growl.css" />
		<script src="js/modernizr.custom.js"></script>
        <title>Student Home</title>
    <style type="text/css">
        
        .container h2 { margin-top:30px;}

.box h3{
	text-align:center;
	position:relative;
	top:80px;
}
.box {
	width:70%;
	height:200px;
	background:#FFF;
	margin:40px auto;
}
          div.position {
    position:relative;
   
    top:-500px;
   
}
div.xyz{
    
    position:relative;
     left: 10px;
    top:-180px;
}
         .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration:blink;
    display: inline-block;
    font-size: 14px;
   
    margin: 2px 1px;
    cursor: pointer;
}
.button1 {
    background-color: white; 
    color: black; 
    border: 3px solid #008CBA;
}
            .alert-box {
    color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;font-size:11px;
    padding:10px 10px 10px 36px;
    margin:10px;
}
.alert-box span {
    font-weight:bold;
    text-transform:uppercase;
}
.error {
    background:#ffecec url('images/error.png') no-repeat 10px 50%;
    border:1px solid #f5aca6;
}
.success {
    background:#e9ffd9 url('images/notice.gif') no-repeat 10px 50%;
    border:2px solid #a6ca8a;
    top:-50px;
    position:relative;
}
.warning {
    background:#fff8c4 url('images/notice.gif') no-repeat 10px 50%;
    border:1px solid #f2c779;
     top:-50px;
    position:relative;
}
.notice {
    background:#e3f7fc url('images/notice.gif') no-repeat 10px 50%;
    border:3px solid #8ed9f6;
     top: -50px;
     position:relative;
}
        #ProfilePage
{
    /* Move it off the top of the page, then centre it horizontally */
    margin: 50px auto;
    width: 635px;
top:200px;
/* For visibility. Delete me */
border: 1px solid red;
}

#LeftCol
{
    /* Move it to the left */
    float: left;

    width: 200px;
    text-align: center;

    /* Move it away from the content */
    margin-right: 20px;

/* For visibility. Delete me */
border: 1px solid brown;
}

#Photo
{
    /* Width and height of photo container */
    width: 200px;
    height: 200px;

/* For visibility. Delete me */
border: 1px solid green;
}

#PhotoOptions
{
    text-align: center;
    width: 200px;

/* For visibility. Delete me */
border: 1px solid brown;
}

#Info
{
    width: 400px;
    text-align: center;

    /* Move it to the right */
    float: right;

/* For visibility. Delete me */
border: 1px solid blue;
}

#Info strong
{
    /* Give it a width */
    display: inline-block;
    width: 100px;

/* For visibility. Delete me */
border: 1px solid orange;
}

#Info span
{
    /* Give it a width */
    display: inline-block;
    width: 250px;

/* For visibility. Delete me */
border: 1px solid purple;
}
body {
    background: url("light.jpg") no-repeat center center fixed;
   -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
} 
    </style>
    
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
                               <div class="main clearfix" >
					<button id="notification-trigger" class="progress-button">
						<span class="content">Show Notification</span>
						<span class="progress"></span>
					</button>
				</div>
        <%
     //   Class.forName("com.mysql.jdbc.Driver");
          //   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","pankaj0");
                ServletContext context = getServletContext();
             Connection con = (Connection) context.getAttribute("DataConnection");  
            //out.println(con1);               
           String qr="select * from notification";
         Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
             ResultSet rs = stmt.executeQuery(qr);
              rs.afterLast();
              String alertarr[] = new String[3];
              boolean b = rs.previous();
             if(b)
                                 {
                 String alertname = rs.getString(1);
                 String alert = rs.getString(2);
                  alertarr[0] = alert; 
                 %>
          
             
                 <%
             }
              boolean b1 = rs.previous();
              if(b1)
                                   {
                  String alertname1 = rs.getString(1);
                 String alert1 = rs.getString(2);
                 alertarr[1] = alert1;
              
                      %>
                    
                      
                      
        <%
               }
              String th = "";
               boolean b2 = rs.previous();
              if(b2)
                                   {
                  String alertname2 = rs.getString(1);
                 String alert2 = rs.getString(2);
                th=alert2;
                
              
                      %>
              
                      
              
              
              
              <%
                           }
         // Class.forName("com.mysql.jdbc.Drivers");
         // Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/student","root","pankaj0");
          //out.println(con);
            String name = (String)session.getAttribute("name");
             String image = (String) session.getAttribute("image");
              String id = (String)session.getAttribute("id");
              String fathername =(String) session.getAttribute("fathername");
              String mothername=(String)session.getAttribute("mothername");
              String mobile = (String)session.getAttribute("mobile");
            // out.println("<h2 style ='text-align:left'> Welcome "+name+"</h2>");
           //  out.println("<img  src="+image+" height='100' widht='100'");
           
           
         %>
         
         
       
         <div class="xyz">  
        <div id="ProfilePage">
    <div id="LeftCol">
        <div id="Photo">
            <img src = "<%=image%>"  height='200' widht='200'/>
        </div>
        <div id="ProfileOptions">
          
            <font color="green"><%=name%></font>
            
        </div>
    </div>

    <div id="Info">
        <p>
            <strong><font color="purple">Name:</font></strong>
            <span><font color="red"><%=name%></font></span>
        </p>
        <p>
            <strong><font color="purple">ID:</font></strong>
            <span><font color="red"><%=id%></font></span>
        </p>
        <p>
            <strong><font color="purple">Father Name:</font></strong>
            <span><font color="red"><%=fathername%></font></span>
        </p>
        <p>
            <strong><font color="purple">Mother Name:</font></strong>
            <span><font color="red"><%=mothername%></font></span>
        </p>
        <p>
            <strong><font color="purple">Mobile:</font></strong>
            <span><font color="red"><%=mobile%></font></span>
        </p>
    </div>

    <!-- Needed because other elements inside ProfilePage have floats -->
    <div style="clear:both"></div>
</div>
         </div>
        <div class="position">
         <pre>

     <a href="EditProfile.jsp" class="button button1">Edit Profile</a><br>
     <a href="FeePayment.jsp" class="button button1">Fee Payment </a><br>
     <a href="AttendanceView.jsp" class="button button1"> Attendance </a><br>
     <a href="MidSemView.jsp" class="button button1">  MidSem    </a><br>
     <a href="SessionalView.jsp" class="button button1">  Sessional </a><br>
     <a href="EndSession" class="button button1">  <b><U>Logout</u></b>    </a>   

         </pre>
              
    
       
        </div>
        <script src="js/classie.js"></script>
		<script src="js/notificationFx.js"></script>
        <script>
            
           
                 
			(function() {
				var bttn = document.getElementById( 'notification-trigger' );
                                   
				// make sure..
				bttn.disabled = false;

				bttn.addEventListener( 'click', function() {
					// simulate loading (for demo purposes only)
                                        var i = 0;
                                       for( i = 0 ; i < 3 ; i++)
                                           {
                                               
                                   if(i==0)
                                       {
                                          
					classie.add( bttn, 'active' );
					setTimeout( function() {

						classie.remove( bttn, 'active' );
						
						// create the notification
                                               
						var notification = new NotificationFx({
                                                                                                                  
                                                        
                                     
							message : '<p><%=alertarr[0]%> </p>',
                                                      
							layout : 'growl',
							effect : 'slide',
							type : 'notice', // notice, warning or error
							onClose : function() {
								bttn.disabled = false;
							}
						});

						// show the notification
						notification.show();

					}, 1200 );
                                     }
                                     
                                     
                                      if(i==1)
                                       {
                                          
					classie.add( bttn, 'active' );
					setTimeout( function() {

						classie.remove( bttn, 'active' );
						
						// create the notification
                                               
						var notification = new NotificationFx({
                                                                                                                  
                                                        
                                     
							message : '<p><%=alertarr[1]%> </p>',
                                                      
							layout : 'growl',
							effect : 'slide',
							type : 'notice', // notice, warning or error
							onClose : function() {
								bttn.disabled = false;
							}
						});

						// show the notification
						notification.show();

					}, 1200 );
                                     }
                                     
                                     if(i==2)
                                       {
                                          
					classie.add( bttn, 'active' );
					setTimeout( function() {

						classie.remove( bttn, 'active' );
						
						// create the notification
                                               
						var notification = new NotificationFx({
                                                                                                                  
                                                        
                                     
							message : '<p>hiiiiiiii</p>',
                                                      
							layout : 'growl',
							effect : 'slide',
							type : 'notice', // notice, warning or error
							onClose : function() {
								bttn.disabled = false;
							}
						});

						// show the notification
						notification.show();

					}, 1200 );
                                     }
                                  }
					
					// disable the button (for demo purposes only)
					this.disabled = true;
				} );
			})();
                        
                                                                               
		</script>
      
    </body>
    
</html>
