<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
    
        <title>CSS Registration Form</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" type="text/css" href="css/default.css"/>
         <link href="http://cdn-na.infragistics.com/igniteui/2019.2/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2019.2/latest/css/structure/infragistics.css" rel="stylesheet" />

    <script src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>

    <!-- Ignite UI Required Combined JavaScript Files -->
    <script src="http://cdn-na.infragistics.com/igniteui/2019.2/latest/js/infragistics.core.js"></script>
    <script src="http://cdn-na.infragistics.com/igniteui/2019.2/latest/js/infragistics.lob.js"></script>
    <script type="text/javaScript">
	function disableBackButton() {
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>
    </head>
    <style>
    /* The switch - the box around the slider */

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],

textarea,
    */*Set's border, padding and margin to 0 for all values*/
{
    padding: 0;
    margin: 0;
    border:0;
}
body, html {
    color: #373C40;
    font-family: Verdana,Arial, Helvetica, sans-serif;
    height: 100%;
    background-color: #f0f0f0;
    margin:10px;
}
body {
    font-size: 70%;
}
p {
    padding: 7px 0 7px 0;
    font-weight: 500;
    font-size: 10pt;
}
a {
    color: #656565;
    text-decoration:none;
}
a:hover{
    color: #abda0f;
    text-decoration: none;
}
h1 {
    font-weight:200;
    color: #172bbf;
    font-size:16pt;
    background: transparent url(../img/h1.png) no-repeat center left;
    padding-left:33px;
    margin:3px 5px 4px 4px;
}
h4 {
    padding:1px;
    color: #ACACAC;
    font-size:9pt;
    font-weight:100;
    text-transform:uppercase;
}
form.register{
    width:800px;
    margin: 20px auto 0px auto;
    min-height: 100%;
    background-color:#fff;
    padding:5px;
    -moz-border-radius:20px;
    -webkit-border-radius:20px;
}
form p{
    font-size: 8pt;
    clear:both;
    margin: 0;
    color:gray;
    padding:4px;
}
form.register fieldset.row1
{
    width:770px;
    padding:5px;
    float:left;
    border-top:1px solid #F5F5F5;
    margin-bottom:15px;
}
form.register fieldset.row1 label{
    width:140px;
    float: left;
    text-align: right;
    margin-right: 6px;
    margin-top:2px;
}
form.register fieldset.row2
{
    border-top:1px solid #F1F1F1;
    border-right:1px solid #F1F1F1;
    height:220px;
    padding:5px;
    float:left;
}
form.register fieldset.row3
{
    border-top:1px solid #F1F1F1;
    padding:5px;
    float:left;
    margin-bottom:15px;
    width:400px;
}
form.register fieldset.row4
{
    border-top:1px solid #F1F1F1;
    border-right:1px solid #F1F1F1;
    padding:5px;
    float:left;
    clear:both;
    width:500px;
}
form.register .infobox{
    float:right;
    margin-top:20px;
    border: 1px solid #F1F1F1;
    padding:5px;
    width:380px;
    height:98px;
    font-size:9px;
    background: #FDFEFA url(../img/bg_infobox.gif) repeat-x top left;
}
form.register legend
{
    color: #172bbf;
    padding:2px;
    margin-left: 14px;
    font-weight:bold;
    font-size: 14px;
    font-weight:100;
}
form.register label{
    color:#444;
    width:98px;
    float: left;
    text-align: right;
    margin-right: 6px;
    margin-top:2px;
}
form.register label.optional{
    float: left;
    text-align: right;
    margin-right: 6px;
    margin-top:2px;
    color: #A3A3A3;
}
form.register label.obinfo{
    float:right;
    padding:3px;
    font-style:italic;
}
form.register input{
    width: 140px;
    color: #505050;
    float: left;
    margin-right: 5px;
}
form.register input.long{
    width: 247px;
    color: #505050;
}
form.register input.short{
    width: 40px;
    color: #505050;
}
form.register input[type=radio]
{
    float:left;
    width:15px;
}
form.register label.gender{
    margin-top:-1px;
    margin-bottom:2px;
    width:34px;
    float:left;
    text-align:left;
    line-height:19px;
}
form.register input[type=text]
{
    border: 1px solid #E1E1E1;
    height: 18px;
}
form.register input[type=password]
{
    border: 1px solid #E1E1E1;
    height: 18px;
}
.button
{
    background: #000;
    padding: 8px 10px 8px;
    color: #fff;
    text-decoration: none;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
    text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
    cursor: pointer;
/*     float:left;
 */ font-size:18px;
    margin:10px;
}
form.register input[type=text].year
{
    border: 1px solid #E1E1E1;
    height: 18px;
    width:30px;
}
form.register input[type=checkbox] {
    width:14px;
    margin-top:4px;
}
form.register select
{
    border: 1px solid #E1E1E1;
    width: 130px;
    float:left;
    margin-bottom:3px;
    color: #505050;
    margin-right:5px;
}
form.register select.date
{
    width: 40px;
}
input:focus, select:focus{
    background-color: #efffe0;
}
p.info{
    font-size:7pt;
    color: gray;
}
p.agreement{
    margin-left:15px;
}
p.agreement label{
    width:390px;
    text-align:left;
    margin-top:3px;
}


.combo-label {margin-bottom:.5em;}

#__ig_wm__
{
display:none;
}
.left_pane
{
float:left;
}

.right_pane
{
float:right;
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
    
    </style>
    <body onload="disableBackButton()">
    
    
<%
String pid = (String)request.getAttribute("pid"); 
String pname = (String)request.getAttribute("pname");
String localip = (String)request.getAttribute("localip");

String url = "http://" + localip + ":3000";
String icdcodes[][] = new String[100][100];
icdcodes = (String[][])request.getAttribute("icdcodes");
int icdcodelength = (int)request.getAttribute("icdcodelength");

String medcodes[][] = new String[100][100];
medcodes = (String[][])request.getAttribute("medcodes");
int medcodelength = (int)request.getAttribute("medcodelength");

String testcodes[][] = new String[100][100];
testcodes = (String[][])request.getAttribute("testcodes");
int testcodelength = (int)request.getAttribute("testcodelength");

String pharmacy[][] = new String[100][100];
pharmacy = (String[][])request.getAttribute("pharmacy");
int pharmacylength = (int)request.getAttribute("pharmacylength");

String symptoms[][] = new String[100][100];
symptoms = (String[][])request.getAttribute("symptoms");
int symptomlength = (int)request.getAttribute("symptomlength");

%>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <form method="post" action="ProfileDoctor" >
  <input type="submit" value="Profile" disabled>
  </form>
<!--   <a href="#">Profile</a> -->
 <form method="post" action="CaseHistory">
 <input type="submit" value="Case History" disabled>
  </form>
<!--   <a href="#">Case History</a> -->
   <form method="post" action="CheckAppointmentSchedule">
 <input type="submit" value="Appointments" disabled>  </form>
 
 <form method="post" action="Logout">
      <input type="submit" value="Logout" >
    </form>


</div>

<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; MENU</span>
<div class="container">
<div class="row">
        <div class="left_pane col-lg-6">
 <form method="post" class="register" action="CreateCase">
 
            <h1>Case Details</h1>
           
            
            <fieldset class="row1">
     <legend>Patient Details
                </legend>
                
                    <label>Name
                    </label>
                    <input type="text" value="<%= pname %>" readonly/>
                    <label>Patient ID
                    </label>
                    <input type="text" value="<%= pid %>" readonly/>
                <br></br>
                <!-- <p>
                <label class="combo-label">Symptoms</label>
    			<div id="checkboxSelectCombo" >
    <script>
    $(function () {


        var colors = [
            { Name: "jQuery/HTML5/ASP.NET MVC Controls" },
            { Name: "ASP.NET Controls" },
            { Name: "Windows Forms Controls" },
            { Name: "WPF Controls" },
            { Name: "Android Native mobile controls" },
            { Name: "iOS Controls" },
            { Name: "SharePlus" },
            { Name: "ReportPlus" },
            { Name: "Indigo Studio" }
        ];

        $("#checkboxSelectCombo").igCombo({
            width: 200,
            dataSource: colors,
            textKey: "Name",
            valueKey: "Name",
            multiSelection: {
                enabled: true,
                showCheckboxes: true
            },
            dropDownOrientation: "bottom"
        });

    });

</script>
</div>
</p> -->


                    <label>Symptoms</label>
<!-- <input type="text" class="long"/>
 -->             <select id = "myList" name = "symptoms">
              <%for(int i=0;i < symptomlength;i++)
    {%>

         <option value = "<%= symptoms[i][0]%>"><%= symptoms[i][1]%></option>
          <%} %>
              
             </select>
          
                    
                <!-- </p>
                <p> -->
<p>
          <label for="bio">Notes:</label>
          <textarea id="bio" name="notes"cols="50" rows="5" style="border:solid 1px"></textarea></p>
<!--           </fieldset>
 -->               <!--  <p>
                    <label>Password*
                    </label>
                    <input type="text"/>
                    <label>Repeat Password*
                    </label>
                    <input type="text"/>
                    <label class="obinfo">* obligatory fields
                    </label>
                </p> -->
            
            
                <legend>Diagnosis
                </legend>
                <p>
                
                
                </p>
                 <p>
                    <label>Diagnosis</label>
<!-- <input type="text" class="long"/>
 -->             <select id = "myList" name = "icdcodes">
 <%for(int i=0;i < icdcodelength;i++)
    {%>

         <option value = "<%= icdcodes[i][0]%>"><%= icdcodes[i][1]%></option>
          <%} %>
              
             </select>
          
                    
                <!-- </p>
                <p> -->
                <p>
                    <label>Medicine</label>
<!-- <input type="text" class="long"/>
 -->             <select id = "myList" name = "medcodes">
              <%for(int i=0;i < medcodelength;i++)
    {%>

         <option value = "<%= medcodes[i][0]%>"><%= medcodes[i][1]%></option>
          <%} %>
              
             </select>
          
                    
                <!-- </p>
                <p> -->
                    <label>Frequency
                    </label>
                      <select id = "myList" name = "frequency">
               <option value = "0-0-1">0-0-1</option>
               <option value = "0-1-0">0-1-0</option>
               <option value = "0-1-1">0-1-1</option>
               <option value = "1-0-0">1-0-0</option>
               <option value = "1-1-0">1-1-0</option>
               <option value = "1-0-1">1-0-1</option>
               <option value = "1-1-1">1-1-1</option>
               
             </select>

                </p>
                <p>
                    <label>Composition
                    </label>
                    <select id = "myList" name = "composition">
               <option value = "5">5mg</option>
               <option value = "10">10mg</option>
               <option value = "15">15mg</option>
               <option value = "20">20mg</option>
             </select>
                </p>
                <p>
                    <label>Lab Tests
                    </label>
                    <select id = "myList" name ="labtests">
<%for(int i=0;i < testcodelength;i++)
    {%>

         <option value = "<%= testcodes[i][0]%>"><%= testcodes[i][1]%></option>
          <%} %>
              
             </select>
                </p>
                <p>
                    <label>Pharmacy
                    </label>
                    <select id = "myList" name="pharmacyid">
<%for(int i=0;i < pharmacylength;i++)
    {%>

         <option value = "<%= pharmacy[i][0]%>"><%= pharmacy[i][1]%></option>
          <%} %>
              
             </select>
                </p>
                <p>
                    <label for="bio">Comments:</label>
          <textarea id="bio" name="comments"cols="50" rows="5" style="border:solid 1px"></textarea>

                </p>
                <p>
                    <label>Severity
                    </label>
                    <select id = "myList" name="severity">
               <option value = "high">High</option>
               <option value = "low">Low</option>
             </select>
                </p>
                 <p>
                    <label>Diagnosis Complete
                    </label>
                    <select id = "myList" name="dcomplete">
               <option value = "yes">Yes</option>
               <option value = "no">No</option>

             </select>
                </p>
                <br><br>
	 <button class="button">Create Case</button>
            </fieldset>
           
          
        </form>
        </div>
        <div class="right_pane col-lg-6">
    <iframe src="http://192.168.0.15:3000" height="500" width="500" name="Doctor"></iframe>
    <!-- "http://192.168.0.15:3000" -->
    </div>
    </div>
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





