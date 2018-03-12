<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*" %>

<!DOCTYPE html>

<html>
    
    <head>
        
        <!-- CSS in header -->
        <!-- CSS to be replaced with another theme -->
        <link href="Asset/CSS/stylesheet.css" rel="stylesheet" type="text/css">
        <link href="Asset/CSS/docs.css" rel="stylesheet">
        <link href="Asset/CSS/codemirror.css" rel="stylesheet">
        <link href="Asset/CSS/night.css" rel="stylesheet">
        
        <!-- JS in header -->
        <script src="Asset/JS/codemirror.js"></script>
        <script src="Asset/JS/python.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
        <script src="Asset/JS/mqtt-client.js" type="text/javascript"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    
    <div class="banner" style="height: 187px;">
        <h1 style="padding-left: 135px; padding-top: 50px; font-weight: 700;">RoboStudio</h1>
    </div>
    
    <div id="primary" class="content-area">
        <div style="padding-left: 135px; padding-top: 30px;">
            <h1 class="entry-title">Game Room</h1>
        </div>
    </div>
    
    <body class="game">  
        
        <div style="float: left; width: 50%; padding-left: 135px;">
            <form name="userResponse" action="userResponseController" method="post">
                <textarea id="code" name="code" rows="5">
# Instantiate robot, do not edit                
from gopigo import *
import time
import easygopigo3 as easy

robot = easy.EasyGoPiGo3()

# Begin coding here
robot.drive_cm(50)
time.sleep(1)

robot.turn_degrees(90)
time.sleep(1)

robot.stop()
                </textarea>
                
                <div id="output"></div>
                
                </br>
                <input type="submit" Value="Submit"/> 
            </form>
        </div>
        
        <div style="float: right; width: 50%; padding-right: 135px;">
            <iframe src="http://www.ustream.tv/embed/23512384?html5ui=1&autoplay=true&controls=false&showtitle=false" style="border: 0 none transparent;"  webkitallowfullscreen allowfullscreen frameborder="no" width="100%" height="300"></iframe>         
        </div>
        
        <!-- Javascript -->
        <script>
            // Code Editor
            var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                lineNumbers: true,
                theme: "night",
                extraKeys: {
                    "F11": function(cm) {
                      cm.setOption("fullScreen", !cm.getOption("fullScreen"));
                    },
                    "Esc": function(cm) {
                      if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
                    }
                }
            });
            
            // Code Saver
            function submitForm() {
                var data = {
                    'code': getCode(),
                };
                $.ajax({
                    type: 'POST',
                    url: $("form").attr("action"),
                    data: data,
                    //or your custom data either as object {foo: "bar", ...} or foo=bar&...
                    success: function(response) {
                        console.log("Submitted - Success");
                    },
                });
            }
            
            // Use HiveMQ's MQTT Broker -> MUCH MORE RELIABLE
            const MQTT_HOST = "ws://iot.eclipse.org/ws";
            const MQTT_PORT = 1883;
            const MQTT_CLIENT_ID = "sampleClientVera";
            const MQTT_TOPIC = "Vera/ErrorMsg";
            const client = new Paho.MQTT.Client(MQTT_HOST, MQTT_CLIENT_ID);
            setup();

            function setup() {
                // set callback handlers
                client.onConnectionLost = onConnectionLost;
                client.onMessageArrived = onMessageArrived;

                // connect the client
                client.connect({onSuccess:onConnect});
            };

            // called when the client connects
            function onConnect() {
              // Once a connection has been made, make a subscription and send a message.
              console.log("MQTT Connected: " + MQTT_HOST + " using " + MQTT_CLIENT_ID);
              client.subscribe(MQTT_TOPIC);
              console.log("MQTT Topic: " + MQTT_TOPIC);
            };

            function sendMessage(message) {
                let mqtt_message = new Paho.MQTT.Message(message);
                mqtt_message.destinationName = MQTT_TOPIC;
                client.send(mqtt_message);
            };

            // called when the client loses its connection
            function onConnectionLost(responseObject) {
              if (responseObject.errorCode !== 0) {
                    console.log("onConnectionLost: " + responseObject.errorMessage);
              }
            };

            // called when a message arrives
            function onMessageArrived(message) {
                console.log("onMessageArrived: " + message.payloadString);
                $('#output').append(message.payloadString + "<br>");
            };
        </script>

        <!-- 
        <p>Demonstration of the <a href="../doc/manual.html#addon_fullscreen">fullscreen</a>
        addon. Press <strong>F11</strong> when cursor is in the editor to
        toggle full screen editing. <strong>Esc</strong> can also be used
        to <i>exit</i> full screen editing.</p> 
        -->
        
    </body>
    
</html>
