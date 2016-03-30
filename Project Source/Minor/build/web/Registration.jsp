<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Registration </title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script>
    
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="studentid"]').removeClass('selected');
	});
        $('#studentid').focus(function() {
		$('label[for="studentid"]').addClass('selected');
	});
	$('#studentid').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
        
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
        $('#password1').focus(function() {
		$('label[for="password1"]').addClass('selected');
	});
	$('#password1').blur(function() {
		$('label[for="password1"]').removeClass('selected');
	});
          $('#fathername').focus(function() {
		$('label[for="fathername"]').addClass('selected');
	});
	$('#fathername').blur(function() {
		$('label[for="fathername"]').removeClass('selected');
	});
         $('#mothername').focus(function() {
		$('label[for="mothername"]').addClass('selected');
	});
	$('#mothername').blur(function() {
		$('label[for="mothername"]').removeClass('selected');
	});
          $('#address').focus(function() {
		$('label[for="address"]').addClass('selected');
	});
	$('#address').blur(function() {
		$('label[for="address"]').removeClass('selected');
	});
          $('#mobile').focus(function() {
		$('label[for="mobile"]').addClass('selected');
	});
	$('#studentid').blur(function() {
		$('label[for="mobile"]').removeClass('selected');
	});
          $('#male').focus(function() {
		$('label[for="male"]').addClass('selected');
	});
	$('#male').blur(function() {
		$('label[for="male"]').removeClass('selected');
	});
          $('#female').focus(function() {
		$('label[for="female"]').addClass('selected');
	});
	$('#female').blur(function() {
		$('label[for="female]').removeClass('selected');
	});
         $('#image').focus(function() {
		$('label[for="female"]').addClass('selected');
	});
	$('#image').blur(function() {
		$('label[for="female]').removeClass('selected');
	});
         $('#branch').focus(function() {
		$('label[for="branch"]').addClass('selected');
	});
	$('#branch').blur(function() {
		$('label[for="branch]').removeClass('selected');
	});
        
        
        function matchpass(){
   var firstpassword=document.f1.password.value;
    var secondpassword=document.f1.password1.value;

    if(firstpassword==secondpassword){
        alert("Successfully Registered :)");
     return true;
    }
else{
alert("password must be same!");
return false;
}
}
    </script>
        
</head>

<body>
    
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Student Registration<span> ! </span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Student Details </h2>
			</div>
                    <form name="f1" action="SaveDetails" onsubmit="return matchpass()">
                      
         
			<label for="username">Name</label>
			<br/>
			<input type="text" id="username" name="name" >
			<br/>
                        <label for="username">Student ID</label>
			<br/>
			<input type="text" id="studentid" name="studentid">
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password">
			<br/>
                        <label for="password1">Re-Enter Password</label>
			<br/>
			<input type="password" id="password1" name="password1">
			<br/>
                        <label for="branch">Branch</label>
                        <br/>
                        <select name="branch">
                            <option>CSE</option>
                            <option>IT</option>
                        </select>
                        <br/>
                        <br/>
                         <label for="username">Father Name</label>
			<br/>
			<input type="text" id="fathername" name="fathername">
			<br/>
			 <label for="username">Mother Name</label>
			<br/>
			<input type="text" id="mothername" name="mothername">
			<br/>
                         <label for="username">Address</label>
			<br/>
			<input type="text" id="address" name="address">
			<br/>
                        <label for="username">Mobile No.</label>
			<br/>
			<input type="text" id="mobile" name="mobile">
			<br/>
                        <label for="username">Male</label>
			<br/>
			<input type="radio" id="male" value="male" name="abc">
			<br/>
                        <label for="username">Female</label>
			<br/>
			<input type="radio" id="Female" value="female" name="abc">
			<br/>
                       
			<input type="hidden" name="image" value="abc" id="image" />
			
                        <input type="submit" value="SUBMIT DETAILS"/>
                       </form>  
                    
		</div>
            
            
            
	</div>
        
    
</body>

    

</html>