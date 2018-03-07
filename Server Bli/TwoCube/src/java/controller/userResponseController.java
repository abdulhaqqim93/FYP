package controller;

import java.io.*;
import java.net.URL;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import static javax.servlet.SessionTrackingMode.URL;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

/*
 * @author TwoCube
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
        String serverPath = "/opt/bitnami/apache-tomcat/webapps/TwoCube/code.py";
        //String serverPath = "/opt/code.py";
        String code = request.getParameter("code");
        
        String topic        = "Vera/test";
        String content      = code;
        int qos             = 2;
        String broker       = "tcp://iot.eclipse.org:1883";
        String clientId     = "JavaSample";
        MemoryPersistence persistence = new MemoryPersistence();
        
        try {
            // Creating python file
            FileWriter fw = new FileWriter(/*desktop*/serverPath);
            fw.write(code);
            fw.close();
        
            //MQTT
            MqttClient sampleClient = new MqttClient(broker, clientId, persistence);
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);
            //System.out.println("Connecting to broker: "+broker);
            sampleClient.connect(connOpts);
            //System.out.println("Connected");
            //System.out.println("Publishing message: "+content);
            MqttMessage message = new MqttMessage(content.getBytes());
            message.setQos(qos);
            sampleClient.publish(topic, message);
            //System.out.println("Message published");
            sampleClient.disconnect();
            //System.out.println("Disconnected");
            //System.exit(0);
            
            // Executing cmd - CAN BE REMOVED
            /* 
             * Note: 
             * 1. CMD /K = Run Command and then return to the CMD prompt.
             * 2. Use && to add one or more cmd commands which will be run in sequence
             * 3. -pw [password], is for the pi's login credentials
             */
            //Runtime.getRuntime().exec("/bin/bash -c /opt/bitnami/apache-tomcat/webapps/WinSCP.com /script=\"/opt/bitnami/apache-tomcat/webapps/script.txt\"");
            
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
