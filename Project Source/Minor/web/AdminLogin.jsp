<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Admin login</title>
    
    
    <link rel="stylesheet" href="css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style1.css">

    
    
    
  </head>

  <body>

    
<!-- Mixins-->
<!-- Pen Title-->


<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title"> Login</h1>
    <form action="VerifyAdmin" method="post">
      <div class="input-container">
        <input type="text" id="Username" name="adminid" required="required"/>
        <label for="Username">ID</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id="password" name="password" required="required"/>
        <label for="Password">Password</label>
        <div class="bar"></div>
      </div>
      <div class="button-container">
        <button><span>Go</span></button>
      </div>
     
    </form>
  </div>
 
</div>


        <script src="js/index.js"></script>

    
    
    
  </body>
</html>
