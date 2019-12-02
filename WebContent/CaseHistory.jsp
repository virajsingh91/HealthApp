<!-- source-https://bootsnipp.com/snippets/dldxB -->
<html>
<head>
<title>Case History</title>

<style>
body {
  font-family: "Lato", sans-serif;
}
/* The side navigation menu */
.sidenav {
  height: 100%; /* 100% Full-height */
  width: 0; /* 0 width - change this with JavaScript */
  position: fixed; /* Stay in place */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color: #111; /* Black*/
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 60px; /* Place content 60px from the top */
  transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
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
  color: #818181;
  display: block;
  transition: 0.3s;
  width:100%
}

.sidenav input:hover {
  color: #0000ff;
}

/* The navigation menu links */
.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
  transition: margin-left .5s;
  padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
<!-- <ul>
  <li><a ><h2>UA Health Care</h2></a></li>
</ul> -->
<script type="text/javaScript">
	function disableBackButton() {
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>
</head>
<body onload="disableBackButton()">
<%
String casehistory[][] = (String [][])request.getAttribute("casehistory"); 
int length = (int)request.getAttribute("length");

%>

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
 <input type="submit" value="Book Appointment" disabled>
 </form>
 <form method="post" action="Logout">
      <input type="submit" value="Logout" >
    </form>


</div>

<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; MENU</span><br><br><br>

<div> 
    <table border="1">
    <thead>
      <tr>
        <th>Case ID</th>
        <th>Case Status</th>
        <th>Case Start Time</th>
        <th>Case Severity</th>
        <th>Doctor Attended</th>
        <th>Prescription Reference ID</th>
        <th>Symptom</th>
        <th>Symptom Type</th>
        <th>Diagnosis Description</th>
         <th>Notes by Doctor</th>
         <th>Comments by Doctor</th>
         <th>Medicine Prescribed</th>
         <th>Tests Prescribed</th>
      </tr>
    </thead>
    <tbody>
    <%for(int i=0;i < length;i++)
    {%>

          <tr>
            <td><%= casehistory[i][0] %></td>
            <td><%= casehistory[i][1]%></td>
            <td><%= casehistory[i][2]%></td>
            <td><%= casehistory[i][3]%></td>
            <td><%= casehistory[i][4]%></td>
            <td><%= casehistory[i][5]%></td>
            <td><%= casehistory[i][6]%></td>
            <td><%= casehistory[i][7]%></td>
            <td><%= casehistory[i][8]%></td>
            <td><%= casehistory[i][9]%></td>
            <td><%= casehistory[i][10]%></td>
            <td><%= casehistory[i][11]%></td>
            <td><%= casehistory[i][12]%></td>
            <td><%= casehistory[i][13]%></td>
            
          </tr>
          <%} %>
</tbody>
</table>   
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