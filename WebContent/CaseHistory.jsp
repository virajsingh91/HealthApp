<!-- source-https://bootsnipp.com/snippets/dldxB -->
<html>
<head>
<title>Sign Up</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

ul {
  list-style-type: none;
  top:0;
  margin: 0;
  padding: 0;
  width:100%;
  position: fixed;
  overflow: hidden;
  background-color: #000046;
  text-transform: uppercase;
 
  
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
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
}

a {
  color:#000046;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
  
}


h2 {
  text-align: center;
  font-size: 26px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 10px;
  align:center; 
  color: #fff;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
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

#formFooter {
  background-color: #fff;
/*   border-top: 1px solid #dce8f1;
 */  padding: 5px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border: 2px solid #000046;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #000046;
  border: 2px solid #000046;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #000046;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text] {
  background-color: #f6f6f6;
/*   border: #000046;
 */  color: #000046;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  
  
 /*  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out; */
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
input[type=password] {
  background-color: #f6f6f6;
/*   border: #000046;
 */  color: #000046;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
     border: 2px solid #f6f6f6;

input[type=text]:focus {
  background-color: #fff;
  border: 2px solid #000046;
}
nput[type=password]:focus {
  background-color: #fff;
  border: 2px solid #000046;
}

input[type=text]:placeholder {
  color: #000;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
/* .fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
} */

/* @-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
} */

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

/* .fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
} */

/* .fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
} */

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
   left: 0;
  bottom: -10px;
  width: 0;
  height: 2px; 
   background-color: #000046;
 content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #000046;
}

/* .underlineHover:hover:after{
  width: 100%;
} */



/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}

      table, th, td {
      padding: 10px;
      border: 1px solid black; 
      border-collapse: collapse;
      }

</style>
<ul>
  <li><a href="welcomePage.jsp"><h2>UA Health Care</h2></a></li>
</ul>
</head>
<body>
<%
String casehistory[][] = (String [][])request.getAttribute("casehistory"); 
int length = (int)request.getAttribute("length");

%>

<!------ Include the above in your HEAD tag ---------->

<div> <!-- class="wrapper fadeInDown" -->

<div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <!-- <div class="fadeIn first">
      <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
    </div> -->

    <!-- Login Form -->
    <table>
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
     <!--  <input type="text" class="focus"id="login"name="sid" placeholder="UA Student ID">
      <input type="password" id="password"  name="oldPassword" placeholder="Old Password">
	   <input type="password" id="password"  name="newPassword" placeholder="New Password">
      <input type="submit" value="Submit" >top-margin="50px
  -->

<!--     Remind Passowrd
	<div id="formFooter">
      <a class="underlineHover" href="SignIn.jsp">Sign In</a>
    </div>
    <div id="formFooter">
      <a class="underlineHover" href="ChangePassword.jsp">Forgot Password?</a>
    </div>
    <div id="formFooter">
      <a class="underlineHover" href="Signup.jsp">Don't have an account yet? Sign Up</a>
    </div>
 -->
  </div>
</div>
</body>
</html>