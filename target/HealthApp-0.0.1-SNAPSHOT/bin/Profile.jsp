<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
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
    cursor: pointer;
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
</head>
<body>
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
 -->                                    <h5>
     
                                        Profile
                                    </h5>
                                    <h6>
                                        Patient ID :
                                    </h6>
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
                                            		<%String Fname = (String)request.getAttribute("myname"); %><%= Fname%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                         <div class="col-md-6">
                                                <label>Last Name</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String Lname = (String)request.getAttribute("myname"); %><%= Lname%>
                                            	</div>	
                                            </div>
                                        </div>
                                        <div class="row">
                                        	<div class="col-md-6">
                                                <label>Middle Initials</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String MI = (String)request.getAttribute("myname"); %><%= MI%>
                                            	</div>	
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Date of Birth</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String DOB = (String)request.getAttribute("myname"); %><%= DOB%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Blood Group</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String BG = (String)request.getAttribute("myname"); %><%= BG%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone No</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String phone = (String)request.getAttribute("myname"); %><%= phone%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String email = (String)request.getAttribute("myname"); %><%= email%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Gender</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String gender = (String)request.getAttribute("myname"); %><%= gender%>
                                            	</div>	
                                            </div>
                                       
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Address</label>
                                            </div>
                                            <div>
                                             	<div class="row">
                                            		<%String address = (String)request.getAttribute("myname"); %><%= address%>
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
÷                        				<input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile" />
                        					<div
                        					align="center">
                        					</div>
                    					</div> -->
                    					<div  align="center">
                        				<input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
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
        