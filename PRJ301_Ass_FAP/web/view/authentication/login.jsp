<%-- 
    Document   : login
    Created on : Mar 3, 2024, 11:30:11 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT University Academic Portal</title>
        <style>
            h1{
                text-align: center;
                margin: 50px;
                font-family: Arial, sans-serif;
            }
            div.login{
                margin: 100px;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: 'Jost', sans-serif;
            }
            label{
                color: #000000;
                font-size: 1.8em;
                justify-content: center;
                display: flex;
                margin: 0px;
                font-weight: bold;   
            }
            div.input {
                width: 100%;
                margin: 25px auto;
            }

            div.input input[type="text"],
            div.input input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border: none;
                background: #e0dede;
                outline: none;
                border-radius: 5px;
            }

            div.input input[type="text"]:focus,
            div.input input[type="password"]:focus {
                border: 2px solid #808080;
            }
             input[type="submit"] {
                width: 60%; 
                height: 40px;
                margin: 10px auto; 
                justify-content: center;
                font-weight: bold;
                font-size: 1em;
                margin-top: -20px;
                outline: none;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                color: #000000; 
            }

            input[type="submit"]:hover {
                background-color: #e0dede;
            }

        </style>
    </head>
    <body>
        <div class="title">
            <h1>FPT University Academic Portal</h1>
            
        </div>
        <div class="login">
           <form action="login" method="POST">
            <label>Login</label>   
            <div class="input">
                <input type="text"  name="username"/> <br/>
                <input type="password" name="password"/> <br/>
            </div> 
                <input type="submit" value="Login"/>
        </form> 
        </div>
    </body>
</html>
