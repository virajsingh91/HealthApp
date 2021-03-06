<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #C9D6FF;
}

li {
  float: left;
}

li a {
  display: block;
  color: Black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: #fff;
}
body{
  background: #fff;
  font-family: "Poppins", sans-serif;
  height: 100vh;

}
.emp-profile{
    padding: 1%;
    margin-top: 1%;
    margin-bottom: 1%;
    border-radius: 0.5rem;
    background: #fff;
}
/* .profile-img{
    text-align: center; */

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 50px;
  width: 7000px;
  max-width: 450px;
  position: relative;
  padding: 50px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
  margin-top:50px;
  
}

/* .profile-img img{
    width: 70%;
    height: 100%;
} */
/* .profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
} */
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: #000;
    border-radius: 1.5rem;
    width: 10%;
    padding: 1%;
    font-weight: 600;
    color: #000;
    background:#C9D6FF;
    cursor: pointer;
    margin-top:50px;
    
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
</style>
<script type="text/javaScript">
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
</script>
</head>
<body onload="disableBackButton()">


<%
String fname = (String)request.getAttribute("fname"); 
String lname = (String)request.getAttribute("lname"); 
String mi = (String) request.getAttribute("mi");
String dob = (String) request.getAttribute("dob");
String bloodgroup = (String) request.getAttribute("bloodgroup");
String phoneno = (String) request.getAttribute("phoneno");
String email = (String) request.getAttribute("email");
String gender = (String) request.getAttribute("gender");
String address = (String) request.getAttribute("address");


%>



<ul>
  <li><a>Welcome : <%= fname %><%= " "%><%= lname%></a></li>
    <li style="float:right"><a class="active" href="#about">Patient ID:78622</a></li>
    
         <li style="float:right"><form method="post" action="Logout">
      <input type="submit" value="Logout" >
    </form></li>
<!-- 
  <li><a href="contact.asp">Contact</a></li>
  <li><a href="about.asp">About</a></li>  -->
</ul>
<div align="center";>
<div id="formContent">
<!-- <div class="container emp-profile">
 -->                <!-- <form method="post" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
<!--                     </div> 
 -->                    <div class="container emp-profile"
 >
<!--                         <div class="profile-head">
 -->                                  <!--   <h5>
     
                                        Profile
                                    </h5>
                                    <h6>
                                        Patient ID :
                                    </h6> -->
<!--                                     <p class="proile-rating">RANKINGS : <span>8/10</span></p>
 -->                            <!-- <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
                                </li>
                            </ul> -->
                        </div>
                    
<!--                 </div>
 -->                <!-- <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>WORK LINK</p>
                            <a href="">Website Link</a><br/>
                            <a href="">Bootsnipp Profile</a><br/>
                            <a href="">Bootply Profile</a>
                            <p>SKILLS</p>
                            <a href="">Web Designer</a><br/>
                            <a href="">Web Developer</a><br/>
                            <a href="">WordPress</a><br/>
                            <a href="">WooCommerce</a><br/>
                            <a href="">PHP, .Net</a><br/>
                        </div> 
                    </div> -->
                    <div class="container emp-profile">
                        <!-- <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"> -->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>First Name</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= fname%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                         <div class="col-md-6">
                                                <label>Last Name</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= lname%>
                                            	</div>	
                                            </div>
                                        </div>
                                        <div class="row">
                                        	<div class="col-md-6">
                                                <label>Middle Initials</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= mi%>
                                            	</div>	
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Date of Birth</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= dob%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Blood Group</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            	<%= bloodgroup%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone No</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= phoneno%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div>
                                             	<div class="col-md-6">
                                            		<%= email%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Gender</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= gender%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Address</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%= address%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        </div>
                                        <!-- <div class="row">
                                       
                                            <div class="col-md-6">
                                                <p>Date of Birth</p>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Blood Group</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Phone Number</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Gender</p>
                                            </div>
                                            <div class="row">
                                            <div class="col-md-6">
                                                <label>Address</label>
                                            </div>
                                        </div> -->
                                       <!--  <div class="row">
                                            <div class="col-md-6">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Web Developer and Designer</p>
                                            </div>
                                        </div>
                            </div>
                            <div class="col-md-2">
                        				<input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                    					</div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Experience</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Hourly Rate</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$/hr</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">s
                                                <label>Total Projects</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>English Level</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Availability</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div> -->
                                <!-- <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p> -->
                                        <!-- <div class="row">
�                        				<input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile" />
                        					<div
                        					align="center">
                        					</div>
                    					</div> -->
                    					</div>
                    					<div  align="center">
                        				<input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                    					</div>
                    					</div>
<!--                                     </div>
 -->                                <!-- </div> -->
                          <!--   </div>
                        </div> -->
                    <!-- </div>
                </div>
             </div> -->
                
          <!--   </form> <!--  -->          
<!-- </div> 
 --></body>
</html>