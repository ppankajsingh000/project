<%-- 
    Document   : EndPage
    Created on : Mar 6, 2016, 11:22:47 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
             <SCRIPT type="text/javascript">
    window.history.forward();
function noBack() { window.history.forward(); } 
</SCRIPT>
    </head>
    
    <BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload=""> 
    
    
        <h1>Successfully logout .....</h1>
        <a href="Home.jsp"> <h4>go to login page</h4></a>
    </body>
</html>
