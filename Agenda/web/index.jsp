<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
    <head>
    	<title>Index</title>
        <meta http-equiv="Content-Type" conten="text/html; charset=UTF-8">
        <link rel="stylesheet" href="recursos/estilo.css"/>        
        <!-- Archivo constructor httprequest para usara el metodo AJAX -->
        <script type="text/javascript" src="recursos/js/ajax.js"></script>
        <script src="js/main.js"> </script>
    </head>
    <body>
    <!-- Barra de navegacion -->      
        <form action="iniciar" method="post" id="forminicio">
        <!-- controles de registro y sesion -->
            <a href="index.jsp">Login</a>
            <a href="registrarse.jsp">Create Account</a>
            <h1>ID User</h1>
            <input type="text" name="idusuario" placeholder="Id Usuario" id="txtusuario">
            <h1>Password</h1>
            <input type="password" name="password" placeholder="Contraseña" id="txtpassword">
            <input type="button" value="Iniciar" id="boton"><br>          
        </form>
        <!-- funciones llamadas con AJAX --> 
        <script type="text/javascript" src="recursos/js/functions.js"></script>
        
    </body>
</html>
        