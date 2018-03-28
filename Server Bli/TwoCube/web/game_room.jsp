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
        <a href="https://robostudio.blog/">
            <img src="Asset/Logo/logo.jpg" alt="Mountain View" style="padding-left: 100px; padding-top: 50px;">
        </a>
    </div>
    
    <div id="primary" class="content-area">
        <div style="padding-left: 135px; padding-top: 30px;">
            <h1 class="entry-title">Game Room</h1>
        </div>
        
        <div id="level" style="padding-left: 135px;">
            <p id="tips">Please select a difficulty level</p>
            <input class="tipsBtn" type="button" Value="Beginner" id="beginnerBtn" onclick="beginnerTips()"/>
            <input class="tipsBtn" type="button" Value="Intermediate" id="intermediateBtn" onclick="intermediateTips()"/>
            <input class="tipsBtn" type="button" Value="Expert" id="expertBtn" onclick="expertTips()"/>
        </div>
    </div>
    
    <body class="game">  
        
        <script>
            
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
        
        <div style="float: left; width: 50%; padding-left: 135px;">
            <form name="userResponse" action="userResponseController" method="post">
                <textarea id="code" name="code" rows="5"></textarea>
                
                <div id="tip" style="display:none;">
                    <textarea rows="8" disabled="TRUE">
Basic commands
=======================================================

Refer to sample codes to understand each of the commands.

1. drive_cm()
E.G. drive_cm(5)
Note:
Makes the GoPiGo3 move forward in CMs

2. drive_inches()
E.G. drive_inches(5)
Note:
Makes the GoPiGo3 move forward in Inches

3. drive_degrees()
E.G. drive_degrees(90)
Note: 
Makes the GoPiGo3 robot turn at a specific angle while staying in the same spot.
degrees are from 0 to 360

4. backward()
Note:
Makes the GoPiGo3 move backwards infinitely

5. forward()
Note:
Makes the GoPiGo3 move forward infinitely

6. left()
Note:
Makes the GoPiGo3 turn left infinitely

7. right()
Note:	
Makes the GoPiGo3 turn right infinitely

8. sleep()
E.G. sleep(1)
Note:
This is for the robot to pause and receive the next command/movement

9. stop()
                    </textarea>
                </div>
                
                <div id="output"></div>                
                
                </br>
                <input class="submit" type="button" Value="Submit" id="submitBtn" onclick="submitForm()"/>
            </form>
        </div>
        
        <script>
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
        </script>
        
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
            
            function getCode() {
                return editor.getValue();
            }
            
            function beginnerTips()
            {
                editor.getDoc().setValue('# Instantiate robot, do not edit\n\
from gopigo import *\n\
import time\n\
import easygopigo3 as easy\n\
\n\
robot = easy.EasyGoPiGo3()\n\
\n\
# Begin coding here\n\
robot.drive_cm(50)\n\
time.sleep(1)\n\
\n\
robot.turn_degrees(90)\n\
time.sleep(1)\n\
\n\
robot.stop()\n\
                ');
        
                /*
                var elem = document.getElementById('tips');
                elem.parentNode.removeChild(elem);
                */
                
                document.getElementById('tip').style.display = 'block';
                
            }
            
            function intermediateTips()
            {
                editor.getDoc().setValue('# Instantiate robot, do not edit\n\
from gopigo import *\n\
import time\n\
import easygopigo3 as easy\n\
\n\
robot = easy.EasyGoPiGo3()\n\
\n\
# Begin coding here\n\
                ');
        
                document.getElementById('tip').style.display = 'none';
                
            }
            
            function expertTips()
            {
                editor.getDoc().setValue('# Instantiate robot\n\
\n\
# Begin coding here\n\
                ');
        
                document.getElementById('tip').style.display = 'none';
                
            }
        </script>
        
    </body>
    
</html>
