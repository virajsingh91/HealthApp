<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Patient</title>

<!-- source for navigation pane from w3 schools 
source : https://www.w3schools.com/howto/howto_js_sidenav.asp -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.header {
  padding: 10px 14px;
  background: #000046;
  color: #f1f1f1;
  width:100%;
  text-transform: uppercase;
  
  }
  
  .content {
  padding: 16px;
  margin:100px;
  align:center;
  
}

ul {
  list-style-type: none;
  top:0;
  margin: 0;
  padding: 0;
  width:100%;
  position: fixed;
/*   overflow: hidden;
 */  background-color: #000046;
  text-transform: uppercase;
 
  
}

li {
  float: left;
/*   margin-left:0.5px;
 */  align:center;
}

li a {
/*   display: block;
 */  color: white;
  text-align: left;
   padding: 10px 12px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: #000046;
  ;
}

/* BASIC */

/* html {
  background-color: #56baed;
} */

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
  align:center;
}

a {
  color:#000046;
/*   display:inline-block;
 */  text-decoration: none;
  font-weight: 400;
  
}


h2 {
  text-align: center;
  font-size: 26px;
  font-weight: 400;
  text-transform: uppercase;
  display:inline-block;
  margin: 10px;
  align:center; 
  color: #fff;
}
#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #000;
  padding: 50px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 50px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
  margin-top:100px;
  
}


/* body {

  font-family: "Lato", sans-serif;
} */

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
  color: #818181;
  display: block;
  transition: 0.3s;
  width:100%
}

.sidenav input:hover {
  color: #0000ff;
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


</style>
<script type="text/javaScript">
	function disableBackButton() {
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>
</head>
<body onload="disableBackButton()">
<!-- <div class="header">
  <ul>
  <p>Click on the element below to open the side navigation menu.</p>

 <li><a><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></a></li>
  <li><a href="SignIn.jsp"><h2> Welcome Viraj</h2></a></li>
  
  
</ul>
</div> -->
<%
String[] sym = (String[])request.getAttribute("sym"); 
int length = (int)request.getAttribute("length");
%>

<!-- <h2>WELCOME TO UA HEALTH OTG - GOD BLESS YOU</h2>
 -->
  
<h1>WELCOME TO UA HEALTH</h1>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <form method="post" action="Profile">
  <input type="submit" value="Profile">
  </form>
<!--   <a href="#">Profile</a> -->
 <form method="post" action="CaseHistory">
 <input type="submit" value="Case History">
  </form>
<!--   <a href="#">Case History</a> -->
   <form method="post" action="CheckAppointment">
   <input type="submit" value="Book Appointment">
     </form>
     
 <form method="post" action="Logout">
      <input type="submit" value="Logout" >
    </form>
</div>
  
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; MENU</span>
<br><br>
<!-- <p>Click on the element below to open the side navigation menu.</p>
 -->
<!-- <div class="content"> -->
<div >
<form method="post" action="InitiateChat">
  <select name="specializations">
<%for(int i=0;i < length;i++)
    {%>
    <option value=i><%=sym[i] %></option>
  <%} %> 
  
  </select>
   
  
      <input type="submit" value="Submit" >
     
    </form>
    </div>
<!-- </div> -->
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