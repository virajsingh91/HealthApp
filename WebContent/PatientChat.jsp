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
</style>
<script type="text/javaScript">
	function disableBackButton() {
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>
</head>
<body onload="disableBackButton()">
<%String text = (String)request.getAttribute("text");  %>
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
<marquee>Beat the Flu...and ASU!
Who will get more flu shots, Wildcats or Sun Devils? Protect yourself, your community, and help us earn bragging rights!  #AZFluVaxChallenge</marquee>
<div class="center">
<iframe src="http://169.254.164.209:3000" height="645" width="900" name="Patient"></iframe>
</div>

<div class="left_pane col-lg-6">
<!-- <iframe src="http://169.254.164.209:3000" height="645" width="900" name="Patient"></iframe> -->
<h5> <%if(text != null ){
    out.print(text);   
   }%></h5>
   <h5>Do you wish to end the chat with the Doctor?</h5>
    <form method="post" action="EndChatPatient">
      <input type="submit" value="End Chat"  >
    </form>

</div>


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