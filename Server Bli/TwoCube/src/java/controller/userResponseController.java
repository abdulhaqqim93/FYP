package controller;

import java.io.*;
import java.nio.file.Path;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * @author Vera
 */
@WebServlet(name = "userResponseController", urlPatterns = {"/userResponseController"})
public class userResponseController extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Path to save the file, ot be edited from [Desktop] to [pi's directory]
        // String desktopPath = System.getProperty("user.home") + "\\Desktop\\code.py";
        //String desktopPath = "D:\\FYP\\Server Bli\\code.py"; 
        String serverPath = "/opt/bitnami/apache-tomcat/webapps/TwoCube";
        String code = request.getParameter("code");
        
        try {
            // Creating python file
            FileWriter fw = new FileWriter(/*desktop*/serverPath);
            fw.write(code);
            fw.close();
            
            // Executing cmd
            /* 
             * Note: 
             * 1. CMD /K = Run Command and then return to the CMD prompt.
             * 2. Use && to add one or more cmd commands which will be run in sequence
             * 3. -pw [password], is for the pi's login credentials
             */
            //Runtime.getRuntime().exec("cmd /c start cmd.exe /k \" D: && cd FYP/Server Bli && WinSCP.com /script=\"script.txt\" \"");  
            Runtime.getRuntime().exec("cmd /c start cmd.exe /k \" / && cd /opt/bitnami/apache-tomcat/webapps/TwoCube && WinSCP.com /script=\"script.txt\" \""); 
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/game_room.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
    
    
}
