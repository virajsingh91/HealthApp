<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Patient</title>

<!-- source for navigation pane from w3 schools 
source : https://www.w3schools.com/howto/howto_js_sidenav.asp -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav input {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  display: block;
  transition: 0.3s;
  width:100%
}

.sidenav input:hover {
  border-color:white;
  background-color:white;
  color:black;
}


.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #0000ff;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

iframe {
	display: block;
}


/*navbar*/
.top_nav
{
    background-color: #000046;
    color:white;
    
}

.top_nav h1
{
font-size: 26px;
margin-left: 50px;

}
.navbar-header{
margin-left: 38%;
}

.hamburger
{
    margin-left: 25px;
    font-size: 30px;
    margin-top: -55px;
    color: white;
    cursor: pointer;
    position: absolute;
    font-size:30px;
    cursor:pointer;
}

.side_navbar_btn
{
    background-color: transparent;
    border-color: black;
    color:white;
}
.center {
  margin: auto;
  width: 61%;
  border: 3px  solid #000046;
  padding: 10px;
}
 marquee{
         font-size: 20px;
         font-weight: 600;
         color: #000046;
         font-family: sans-serif;
        }
        
#profileImage {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background: #512DA8;
  font-size: 35px;
  color: #fff;
  text-align: center;
  line-height: 150px;
  margin: 20px 0;
}
        
</style>
<script type="text/javaScript">
	function disableBackButton() {
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>
</head>
<body onload="disableBackButton()">
<script>$(document).ready(function(){
	  var firstName = $('#firstName').text();
	  var lastName = $('#lastName').text();
	  var intials = $('#firstName').text().charAt(0) + $('#lastName').text().charAt(0);
	  var profileImage = $('#profileImage').text(intials);
	});
</script>
	<%
		String fname = (String) request.getAttribute("fname");
		String lname = (String) request.getAttribute("lname");
		String mi = (String) request.getAttribute("mi");
		String dob = (String) request.getAttribute("dob");
		String bloodgroup = (String) request.getAttribute("bloodgroup");
		String phoneno = (String) request.getAttribute("phoneno");
		String email = (String) request.getAttribute("email");
		String gender = (String) request.getAttribute("gender");
		String address = (String) request.getAttribute("address");
	%>
<nav class="navbar navbar-default top_nav">
  <div class="container-fluid">
    <div class="navbar-header">
      <h1><b>UA HEALTH CARE</b></h1>
    </div>
  </div>
</nav> 
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <form method="post" action="GoHome">
 <input type="submit" value="Home" class="side_navbar_btn">
  </form>
  <form method="post" action="Profile">
  <input type="submit" value="Profile" class="side_navbar_btn">
  </form>
<!--   <a href="#">Profile</a> -->
 <form method="post" action="CaseHistory">
 <input type="submit" value="Case History" class="side_navbar_btn">
  </form>
<!--   <a href="#">Case History</a> -->
   <form method="post" action="GetSpecializations">
   <input type="submit" value="Book Appointment" class="side_navbar_btn">
     </form>
     
 <form method="post" action="Logout">
      <input type="submit" value="Logout" class="side_navbar_btn">
    </form>
</div>

<span class="hamburger" onclick="openNav()">&#9776;</span><br>
<!-- <marquee>Beat the Flu...and ASU!
Who will get more flu shots, Wildcats or Sun Devils? Protect yourself, your community, and help us earn bragging rights!  #AZFluVaxChallenge</marquee>
<div class="center">
<iframe src="http://169.254.164.209:3000" height="645" width="900" name="Patient"></iframe>
</div> -->
<hr style="margin-top:-2px;">
<div class="container bootstrap snippet" >
    <div class="row">
         <div class="col-sm-10">
            <h1><%=fname%> <%=lname%></h1></div>
        <div class="col-sm-2">
        <span id="firstName" style="color:white;"><%=fname%></span>
<span id="lastName" style="color:white;"><%=lname%></span> 
<div id="profileImage"></div>
<!--             <a href="/users" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="https://bootdey.com/img/Content/avatar/avatar1.png"></a>
 -->        </div> 
    </div>
    <div class="row">
        <div class="col-sm-3">
            <!--left col-->

            <ul class="list-group">
                <li class="list-group-item text-muted">Profile</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Blood Group :</strong></span>  <%=bloodgroup%></li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Gender :</strong></span>  <%=gender%></li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Date of Birth : </strong></span> <%=dob%></li>

            </ul>

           <!--  <div class="panel panel-default">
                <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                <div class="panel-body"><a href="https://bootdey.com">https://bootdey.com</a></div>
            </div> -->

            <!-- <ul class="list-group">
                <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
            </ul>

            <div class="panel panel-default">
                <div class="panel-heading">Social Media</div>
                <div class="panel-body">
                    <i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
                </div>
            </div> -->

        </div>
        <!--/col-3-->
        <div class="col-sm-9">

            <!-- <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
                <li><a href="#messages" data-toggle="tab">Messages</a></li>
                <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul> -->

           <!--  <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Label 1</th>
                                    <th>Label 2</th>
                                    <th>Label 3</th>
                                    <th>Label </th>
                                    <th>Label </th>
                                    <th>Label </th>
                                </tr>
                            </thead>
                            <tbody id="items">
                                <tr>
                                    <td>1</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                    <td>Table cell</td>
                                </tr>
                            </tbody>
                        </table>
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4 text-center">
                                <ul class="pagination" id="myPager"></ul>
                            </div>
                        </div>
                    </div>
                    /table-resp

                    <hr>

                </div>
                /tab-pane
                <div class="tab-pane" id="messages">

                    <h2></h2>

                    <ul class="list-group">
                        <li class="list-group-item text-muted">Inbox</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Here is your a link to the latest summary report from the..</a> 2.13.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Hi Joe, There has been a request on your account since that was..</a> 2.11.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Nullam sapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Thllam sapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Wesm sapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">For therepien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Also we, havesapien massaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>
                        <li class="list-group-item text-right"><a href="#" class="pull-left">Swedish chef is assaortor. A lobortis vitae, condimentum justo...</a> 2.11.2014</li>

                    </ul>

                </div> -->
                <!--/tab-pane-->
                <div class="tab-pane" id="settings">

                    <hr>
<!--                     <form class="form" action="##" method="post" id="registrationForm">
 -->                    <div class=row>
                        <div class="form-group" align="center" style="float:right;">

<!--                             <div class="col-xs-6">
 -->                                <label for="first_name">
                                    <h4>First name</h4></label>
                                <input  class="form-control" value=<%=fname%> id="first_name">
<!--                             </div>
 -->                        </div>
 
                        <div class="form-group" align="center" style="float:left; margin-left:10px">
<!--                             <div class="col-xs-6">
 -->                                <label for="last_name">
                                    <h4>Middle Name</h4></label>
                                <input  class="form-control" value=<%=mi%> id="last_name">
<!--                             </div>
 -->                        </div>
 <div class="form-group" align="center" style="float:left; margin-left:10px">
<!--                             <div class="col-xs-6">
 -->                                <label for="last_name">
                                    <h4>Last name</h4></label>
                                <input  class="form-control" value=<%=lname%> id="last_name">
<!--                             </div>
 -->                        </div>
					</div>
					</div>
			  <div class=row>
					
                        <div class="form-group" align="center" style="float:right;">

<!--                             <div class="col-xs-6">
 -->                                <label for="phone">
                                    <h4>Phone</h4></label>
                                <input  class="form-control" value=<%=phoneno%> id="phoneno">
                            </div>
                        <div class="form-group" align="center" style="float:left; margin-left:10px">
<!--                             <div class="col-xs-6">
 -->                                <label for="mobile">
                                    <h4>Mobile</h4></label>
                                <input  class="form-control" value=<%=phoneno%> id="phoneno">
                            </div>
                        </div>
                         <div class=row>
					
                        <div class="form-group" align="center" style="float:right;">

<!--                             <div class="col-xs-6">
 -->                                <label for="email">
                                    <h4>E-mail</h4></label>
                                <input  class="form-control" value=<%=email%> id="email">
                            </div>
                        <div class="form-group" align="center" style="float:left; margin-left:10px">
<!--                             <div class="col-xs-6">
 -->                                <label for="password">
                                    <h4>Password</h4></label>
                                <input type="password" class="form-control"  id="address"  >
                            </div>
                        </div>
                 <!--  <div class=row>
                        
                        <div class="form-group" align="center" style="float:right;">

                            <div class="col-xs-6">
                                <label for="email">
                                    <h4>Email</h4></label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                            </div>
                        </div>
                        <div class="form-group" align="center" style="float:left; margin-left:10px">

                            <div class="col-xs-6">
                                <label for="email">
                                    <h4>Address</h4></label>
                                <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                            </div>
                            </div> -->
<!--                         </div>
 -->                     <div class=row>
					
                        <div class="form-group" align="center">

<!--                             <div class="col-xs-6">
 -->                                <label for="address">
                                    <h4>Address</h4></label>
                                <input  class="form-control" value=<%=address%> id="address">
                            </div>
                        <!-- <div class="form-group" align="center" style="float:left; margin-left:10px">
                            <div class="col-xs-6">
                                <label for="mobile">
                                    <h4>Mobile</h4></label>
                                <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                            </div>
                        </div> -->
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>
                                <button class="btn btn-lg btn-success" type="submit"  style="color:#C9D6FF;"> Edit</button>
<!--                                 <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
 -->                            </div>
                        </div>
<!--                     </form>
 -->                </div>

            </div>
            <!--/tab-pane-->
    <!--     </div>
        /tab-content

    </div>
    /col-9
</div> -->
<!--/row-->
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

</body>
</html>