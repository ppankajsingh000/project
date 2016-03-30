<%-- 
    Document   : FacultyHome
    Created on : Feb 20, 2016, 8:10:40 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/faculty.css">

    </head>
    <body>
        
       <div class="facultycontainer">
           <div class="facultycontainerin">
              <div class="topheader"> 
                 <a href='EndSession'>LOGOUT</a>
                
              </div> 
              <div class="facultycontainerinbody"> 
              <div class="facultycontainerincol1">
                 <form action="UpdateSession">
                     <div class="facultycontainerinbodyrow">
                         <label class="facultylabel">Choose Branch :</label>
                         <select name="branch">
                           <option>CSE</option>
                           <option>IT</option>
                         </select>
                     </div>
                     
                     <div class="facultycontainerinbodyrow">
                         <label class="facultylabel">Choose Subject:</label>
                         <select name="subject">
                            <option>a</option>
                            <option>b</option>
                            <option>c</option>
                          </select>
                     </div> 
                     
                     <input type="submit" value="Attendace Counter"/>
                </form>
              </div>
              
              <div class="facultycontainerincol1">
                  <form action="MidUpdateSession">
                       <div class="facultycontainerinbodyrow">
                           <label class="facultylabel"> Choose Branch :</label>
                           <select name="branch">
                             <option>CSE</option>
                             <option>IT</option>
                            </select>
                       </div>
                       <div class="facultycontainerinbodyrow">
                           <label class="facultylabel"> Choose Subject:</label>
                           <select name="subject">
                              <option>a</option>
                              <option>b</option>
                              <option>c</option>
                           </select>
                       </div>
                       <div class="facultycontainerinbodyrow">
                          <input type="submit" value="Mid Sem Counter"/>
                       </div>
                  </form> 
              </div>
                
                
              <div class="facultycontainerincol1"> 
                  <form action="SessionalUpdateSession">
                      <div class="facultycontainerinbodyrow">
                         <label class="facultylabel">Choose Branch :</label>
                         <select name="branch">
                             <option>CSE</option>
                             <option>IT</option>
                         </select>
                      </div>
                      <div class="facultycontainerinbodyrow">
                         <label class="facultylabel">Choose Subject:</label>
                         <select name="subject">
                            <option>a</option>
                            <option>b</option>
                            <option>c</option>
                         </select>
                      </div>
                      <div class="facultycontainerinbodyrow">
                          <input type="submit" value="Sessional Counter"/>
                      </div>
                   </form>
              </div>
            </div>    
          </div>
        </div>
    </body>
</html>
