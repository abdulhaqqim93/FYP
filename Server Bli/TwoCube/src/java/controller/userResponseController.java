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
public class userResponseController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // String code = request.getParameter("code") ;
        String code = "test";
        String desktopPath = System.getProperty("user.home") + "/Desktop";
        
        try {
            FileWriter fw = new FileWriter("D:\\FYP\\Server Bli\\TwoCube\\test\\test.txt", false);
        
            fw.write(code);
            fw.close();
        }
        catch (IOException e){
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