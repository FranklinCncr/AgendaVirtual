<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion= request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="recursos/estilosproyectos.css"/>
        <link rel="stylesheet" href="recursos/fonts.css"/>
        <script src="js/proyecto.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Proyectos</title>
    </head>
    <body>
        <!-- Barra de navegacion -->
    	<header>
            <nav>
                <ul>
                    <li><a href="inicio.jsp"><span class="primero"><i class="icon icon-home"></i></span>Inicio</a></li>
                    <li><a href="#"><span class="segundo"><i class="icon icon-pencil"></i></span>Proyectos</a></li>
                    <li><a href="calendario.jsp"><span class="tercero"><i class="icon icon-file-text"></i></span>Calendario</a></li>
                    <li><a href="contactos.jsp"><span class="cuarto"><i class="icon icon-address-book"></i></span>Contactos</a></li>
                    <li><a href="perfil.jsp"><span class="quinto"><i class="icon icon-user-tie"></i></span>Perfil</a></li>
                    <li><a href="index.jsp"><span class="logo"><i class="icon icon-yelp"></i></span>.</a></li>
                </ul>
            </nav>
        </header>
                    
            <form action="crearp" method="post" id="formproyecto">
        <!-- controles de registro y sesion -->
                <input type="text" name="nuevo proyecto" value="Nuevo Proyecto" id="txtproyecto"/> <br>
                Titulo(*): <input type="text" name="titulo" placeholder="Ingrese su titulo" id="txttitulo"/>Hora Inicio:<input type="time" name="horainicio" id="txthorainicio"> Hora Fin:<input type="time" name="horafin" id="txthorafin"><br>
                Lugar(*):<input type="text" name="lugar" placeholder="Ingrese lugar" id="txtlugar"/>Participantes: <input type="text" name="participantes" placeholder="Ingrese los participantes" id="txtparticipantes"/><br>
                Tipo(*):<input list="tipo" name="tipo" id="txttipo">
                <datalist id="tipo">
                    <option value="citas">
                    <option value="reuniones">
                    <option value="viajes">
                    <option value="congresos">
                    <option value="trabajos">
                    <option value="deporte">
                    <option value="otros">
                </datalist>
                Fecha:(*)<input type="date" name="fecha" step="1" min="2016-07-01" max="2020-12-31" value="Ingrese fecha" id="txtfecha"/><br>
                <textarea name="recursos" rows="10" cols="70" id="txtrecursos"placeholder="Ingrese los recurso"></textarea>     
                <textarea name="detalles" rows="10" cols="70" id="txtdetalles"placeholder="Ingrese los detalles del proyecto"></textarea><br> 
                <input type="button" value="Cancelar" id="btnc"> <input type="submit" value="Guardar" id="btnp">          
            </form>
            <script src="js/proyecto.js"></script>
    </body>
</html>
