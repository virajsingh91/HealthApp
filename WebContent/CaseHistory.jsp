<!-- source-https://bootsnipp.com/snippets/dldxB -->
<html>
<head>
<title>Case History</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
body {
  font-family: "Lato", sans-serif;
}
/* The side navigation menu */
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
 /* table css from w3 schools , source : https://www.w3schools.com/css/tryit.asp?filename=trycss_table_fancy */
 #customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #000046;
  color: white;
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
 <input type="submit" value="Book Appointment" class="side_navbar_btn" >
 </form>
 <form method="post" action="Logout">
      <input type="submit" value="Logout" class="side_navbar_btn">
    </form>


</div>

<span class="hamburger" onclick="openNav()">&#9776;</span>
<br><br>
<div> 
    <table border="1" id="customers">
    <thead>
      <tr>
        <th>Case ID</th>
        <th>Case Status</th>
        <th>Case Start Time</th>
        <th>Case Severity</th>
        <th>Doctor Attended</th>
        <th>Prescription Reference ID</th>
        <th>Pharmacy Zip Code</th>
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