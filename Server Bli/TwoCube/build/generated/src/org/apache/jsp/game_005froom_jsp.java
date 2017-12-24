package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class game_005froom_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    \r\n");
      out.write("    <head>\r\n");
      out.write("        <!-- CSS in header -->\r\n");
      out.write("        <link href=\"Asset/CSS/TortugaChild.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("        <link href=\"Asset/CSS/docs.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"Asset/CSS/codemirror.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"Asset/CSS/night.css\" rel=\"stylesheet\">\r\n");
      out.write("        \r\n");
      out.write("        <!-- JS in header -->\r\n");
      out.write("        <script src=\"Asset/JS/codemirror.js\"></script>\r\n");
      out.write("        <script src=\"Asset/JS/python.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Game Room</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("        <h2>Python Code Editor</h2>\r\n");
      out.write("        \r\n");
      out.write("        <form name=\"userResponse\" action=\"userResponseController\" method=\"POST\">\r\n");
      out.write("            <textarea id=\"code\" name=\"code\" rows=\"5\">\r\n");
      out.write("\r\n");
      out.write("            import random\r\n");
      out.write("            number = random.randint(1, 99)\r\n");
      out.write("            guesses = 0\r\n");
      out.write("\r\n");
      out.write("            print (\"I just taken one number between 1 to 99 in mind, you have to guess it...\")\r\n");
      out.write("            while guesses < 5:\r\n");
      out.write("            guess = int(input(\"Enter an integer from 1 to 99: \"))\r\n");
      out.write("            guesses +=1\r\n");
      out.write("            print (\"this is your %d guess\" %guesses)\r\n");
      out.write("            if guess < number:\r\n");
      out.write("            print (\"guess is low\")\r\n");
      out.write("            elif guess > number:\r\n");
      out.write("            print (\"guess is high\")\r\n");
      out.write("            elif guess == number:\r\n");
      out.write("            break\r\n");
      out.write("\r\n");
      out.write("            if guess == number:\r\n");
      out.write("            guesses = str(guesses)\r\n");
      out.write("            print (\"You guess it in : \", guesses + \" guesses\")\r\n");
      out.write("\r\n");
      out.write("            if guess != number:\r\n");
      out.write("            number = str(number)\r\n");
      out.write("            print (\"The secret number was\", number)\r\n");
      out.write("\r\n");
      out.write("            </textarea>\r\n");
      out.write("            \r\n");
      out.write("            </br>\r\n");
      out.write("            <input type=\"submit\" Value=\"Submit\"/> \r\n");
      out.write("        </form>\r\n");
      out.write("        \r\n");
      out.write("        <script>\r\n");
      out.write("            var editor = CodeMirror.fromTextArea(document.getElementById(\"code\"), {\r\n");
      out.write("                lineNumbers: true,\r\n");
      out.write("                theme: \"night\",\r\n");
      out.write("                extraKeys: {\r\n");
      out.write("                    \"F11\": function(cm) {\r\n");
      out.write("                      cm.setOption(\"fullScreen\", !cm.getOption(\"fullScreen\"));\r\n");
      out.write("                    },\r\n");
      out.write("                    \"Esc\": function(cm) {\r\n");
      out.write("                      if (cm.getOption(\"fullScreen\")) cm.setOption(\"fullScreen\", false);\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("        <!-- \r\n");
      out.write("        <p>Demonstration of the <a href=\"../doc/manual.html#addon_fullscreen\">fullscreen</a>\r\n");
      out.write("        addon. Press <strong>F11</strong> when cursor is in the editor to\r\n");
      out.write("        toggle full screen editing. <strong>Esc</strong> can also be used\r\n");
      out.write("        to <i>exit</i> full screen editing.</p> \r\n");
      out.write("        -->\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
