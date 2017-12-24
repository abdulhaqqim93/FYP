<%-- 
    Document   : userResponseAction
    Created on : 24 Dec, 2017, 2:56:00 PM
    Author     : Vera
--%>

<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
   <%
       String code = request.getParameter("code");
   
   %>
   <%=code%>
</html>
