<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
iframe {
	display: block;
}
</style>

</head>
<body>
<iframe src="http://192.168.0.25:3000" height="500" width="500" name="Doctor"></iframe>

<%-- 
<%
String icdcodes[][] = new String[100][100];
icdcodes = (String[][])request.getAttribute("icdcodes");

%>
    <table>
    <thead>
      <tr>
        <th>ICDCode</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
    <%for(int i=0;i < icdcodes.length;i++)
    {%>

          <tr>
            <td><%= icdcodes[i][0] %></td>
            <td><%= icdcodes[i][1]%></td>
          </tr>
          <%} %>
</tbody>
</table> --%>
</body>
</html>