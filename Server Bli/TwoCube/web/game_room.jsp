<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*" %>

<!DOCTYPE html>

<html>
    
    <head>
        <!-- CSS in header -->
        <!-- CSS to be replaced with another theme -->
        <!-- <link href="Asset/CSS/TortugaChild.css" rel="stylesheet" type="text/css"> -->
        <link href="Asset/CSS/docs.css" rel="stylesheet">
        <link href="Asset/CSS/codemirror.css" rel="stylesheet">
        <link href="Asset/CSS/night.css" rel="stylesheet">
        
        <!-- JS in header -->
        <script src="Asset/JS/codemirror.js"></script>
        <script src="Asset/JS/python.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Room</title>
    </head>
    
    <body>
        
        <h2>Game Room</h2>
        
        <div style="float: left; width: 50%;">
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

                </br>
                <input type="submit" Value="Submit"/> 
            </form>
        </div>
        
        <div style="float: right; width: 50%;">
            
            <iframe src="http://www.ustream.tv/embed/23512384?html5ui=1&autoplay=true&controls=false&showtitle=false" style="border: 0 none transparent;"  webkitallowfullscreen allowfullscreen frameborder="no" width="100%" height="300"></iframe>
            
        </div>
        
        <script>
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
        </script>

        <!-- 
        <p>Demonstration of the <a href="../doc/manual.html#addon_fullscreen">fullscreen</a>
        addon. Press <strong>F11</strong> when cursor is in the editor to
        toggle full screen editing. <strong>Esc</strong> can also be used
        to <i>exit</i> full screen editing.</p> 
        -->
        
    </body>
    
</html>
