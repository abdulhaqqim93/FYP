<%-- 
    Document   : game_room
    Created on : Dec 18, 2017, 3:19:52 PM
    Author     : Ignore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        <!-- CSS in header -->
        <link href="Asset/CSS/TortugaChild.css" rel="stylesheet" type="text/css">
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
        
        <h2>Python Code Editor</h2>
        
        <form name="userResponse" action="game_room.jsp" method="POST">
            <textarea id="code" name="code" rows="5">

            import random
            number = random.randint(1, 99)
            guesses = 0

            print ("I just taken one number between 1 to 99 in mind, you have to guess it...")
            while guesses < 5:
            guess = int(input("Enter an integer from 1 to 99: "))
            guesses +=1
            print ("this is your %d guess" %guesses)
            if guess < number:
            print ("guess is low")
            elif guess > number:
            print ("guess is high")
            elif guess == number:
            break

            if guess == number:
            guesses = str(guesses)
            print ("You guess it in : ", guesses + " guesses")

            if guess != number:
            number = str(number)
            print ("The secret number was", number)

            </textarea>
            
            </br>
            <input type="submit" Value="Submit"/> 
        </form>
        
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
