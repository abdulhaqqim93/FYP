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
        
        <article>
        <h2>Full Screen Editing</h2>
        
        <form><textarea id="code" name="code" rows="5">

        <dl>
            <dt id="option_indentWithTabs"><code><strong>indentWithTabs</strong>: boolean</code></dt>
            <dd>Whether, when indenting, the first N*<code>tabSize</code>
            spaces should be replaced by N tabs. Default is false.</dd>

            <dt id="option_electricChars"><code><strong>electricChars</strong>: boolean</code></dt>
            <dd>Configures whether the editor should re-indent the current
            line when a character is typed that might change its proper
            indentation (only works if the mode supports indentation).
            Default is true.</dd>

            <dt id="option_specialChars"><code><strong>specialChars</strong>: RegExp</code></dt>
            <dd>A regular expression used to determine which characters
            should be replaced by a
            special <a href="#option_specialCharPlaceholder">placeholder</a>.
            Mostly useful for non-printing special characters. The default
            is <code>/[\u0000-\u0019\u00ad\u200b\u2028\u2029\ufeff]/</code>.</dd>
            <dt id="option_specialCharPlaceholder"><code><strong>specialCharPlaceholder</strong>: function(char) → Element</code></dt>
            <dd>A function that, given a special character identified by
            the <a href="#option_specialChars"><code>specialChars</code></a>
            option, produces a DOM node that is used to represent the
            character. By default, a red dot (<span style="color: red">•</span>)
            is shown, with a title tooltip to indicate the character code.</dd>

            <dt id="option_rtlMoveVisually"><code><strong>rtlMoveVisually</strong>: boolean</code></dt>
            <dd>Determines whether horizontal cursor movement through
            right-to-left (Arabic, Hebrew) text is visual (pressing the left
            arrow moves the cursor left) or logical (pressing the left arrow
            moves to the next lower index in the string, which is visually
            right in right-to-left text). The default is <code>false</code>
            on Windows, and <code>true</code> on other platforms.</dd>
        </dl>

        </textarea></form>
        
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
        </article>
        
    </body>
    
</html>
