<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
    <head>
    	<title>Index</title>
        <meta http-equiv="Content-Type" conten="text/html; charset=UTF-8">
        <link rel="stylesheet" href="recursos/estilo.css"/>        
        <!-- Archivo constructor httprequest para usara el metodo AJAX -->
        <script type="text/javascript" src="recursos/js/ajax.js"></script>
        <script src="js/validacionregistro.js"> </script>
    </head>
    <body>
    <!-- Barra de navegacion -->      
        <form action="nuevousuario" method="post" id="formregistro">
        <!-- controles de registro y sesion -->
            <a href="index.jsp">Login</a>
            <a href="registrarse.jsp">Create Account</a> 
            <h1>ID Usuario</h1>
            <input type="text" name="idusuarior" placeholder="Id Usuario" id="txtidusuario">
            <h1>Contraseña</h1>
            <input type="password" name="passwordr" placeholder="ContraseÃ±a" id="txtcontraseña">
            <h1>Nombre</h1>
            <input type="text" name="nombresr" placeholder="Escriba su nombre" id="txtnombres">
            <h1>Apellidos</h1>
            <input type="text" name="apellidosr" placeholder="Apellidos" id="txtapellidos">
            <h1>E-mail</h1>
            <input type="text" name="correor" placeholder="Correo electronico" id="txtcorreo">
            <h1>Fecha de Nacimiento</h1>
            <input type="date" name="fechanacimientor" step="1" min="2010-01-01" max="2020-12-31" id="txtfechanacimiento" placeholder="Fecha de Nacimiento"/>
            <h1>Telefono</h1>
            <input type="text" name="telefonor" placeholder="Direccion" id="txttelefono">            
            <h1>Direccion</h1>
            <input type="text" name="direccionr" placeholder="Direccion" id="txtidireccion">
            <input type="button" value="registrar" id="boton">            
        </form>
        <!-- funciones llamadas con AJAX --> 
        <script type="text/javascript" src="recursos/js/functions.js"></script>
        
    </body>
</html>
