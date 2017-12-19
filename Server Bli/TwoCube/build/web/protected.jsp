<%-- 
    Document   : protected
    Created on : Dec 18, 2017, 3:31:03 PM
    Author     : USER
--%>

<% 
    // Set to google.com for testing
    // To be changed to wordpress Login page if session is invalid
    // Question is: How do you bring session from Wordpress server to our server?
    if (session.getAttribute("username") == null) {
        response.sendRedirect("www.google.com");
        return;
    }
%>