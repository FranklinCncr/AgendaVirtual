function actualizarcontenido()
            {
                var id = document.getElementById('id').value;
                var tipofuente = document.getElementById('tipofuente').value;
                var inicio = document.getElementById('inicio').value;
                var actualizar = document.getElementById('actualizar').value;
                var subinicio = document.getElementById('subinicio').value;
                var claves = document.getElementById('claves').value;
                var descripcion = document.getElementById('descripcion').value;
                var subtitulo = document.getElementById('subtitulo').value;
                var correo = document.getElementById('correo').value;
                var facebook = document.getElementById('facebook').value;
                var twitter = document.getElementById('twitter').value;
                var autor = document.getElementById('autor').value;
                var telefono = document.getElementById('telefono').value;
                var direccion = document.getElementById('direccion').value;
                var cadena = "actualizar=" + actualizar + "&id=" + id + "&tipofuente=" + tipofuente + "&inicio=" + inicio + "&subinicio=" + subinicio + "&claves=" + claves + "&descripcion=" + descripcion + "&subtitulo=" + subtitulo + "&correo=" + correo + "&facebook=" + facebook + "&twitter=" + twitter + "&autor=" + autor + "&telefono=" + telefono + "&direccion=" + direccion;

                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/editar-information.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function noticeindex()
            {
                 var peticion=null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/pages/escritorio.php", false);
                    peticion.send(null);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function editarinformacion()
            {
                var peticion=null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/pages/editar-information.php", false);
                    peticion.send(null);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function createweb()
            {
                var peticion=null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/pages/newsite.php", false);
                    peticion.send(null);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function escojerweb()
            {
                var peticion=null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/pages/selectsite.php", false);
                    peticion.send(null);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function comprobarweb()
            {   var capturardireccionweb = document.getElementById('buscadireccionweb').value;
                var seleccionardominio = document.getElementById('seleccionardominio').value;
                var cadena = "comprobar=" + capturardireccionweb + "&dominio=" + seleccionardominio;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/querysite.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function insertarnuevaweb() 
                {
                var capturardireccionwebcreada = document.getElementById('datosdelaweb').value;
                var seleccionarrubro = document.getElementById('seleccionarrubro').value;
                var ruc = document.getElementById('ruc').value;
                var cadena = "webload=" + capturardireccionwebcreada + "&seleccionarrubro=" + seleccionarrubro + "&ruc=" + ruc;    
                var peticion = null;
                peticion = ConstructorXMLHttpRequest();
                if (peticion) {
                    peticion.open('POST', "includes/pages/create-ok.php", false);
 
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);

                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                            }
                }
function contenido(variabledominio,variableid)
            {   
                var cadena = "webseleccionada=" + variabledominio + "&idseleccionado=" + variableid;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/editar-information.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function upgradecontent()
             {   
                var inicio = document.getElementById('inicio').value;
                var id = document.getElementById('id').value;
                var actualizar = document.getElementById('actualizar').value;
                var subinicio = document.getElementById('subinicio').value;
                var claves = document.getElementById('claves').value;
                var descripcion = document.getElementById('descripcion').value;
                var subtitulo = document.getElementById('subtitulo').value;
                var texto = document.getElementById('texto').value;
                var correo = document.getElementById('correo').value;
                var facebook = document.getElementById('facebook').value;
                var twitter = document.getElementById('twitter').value;
                var autor = document.getElementById('autor').value;
                var nombrepaginaweb = document.getElementById('nombrepaginaweb').value;
                var cadena = "actualizar=" + actualizar + "&id=" + id + "&inicio=" + inicio + "&subinicio=" + subinicio + "&claves=" + claves + "&descripcion=" + descripcion + "&subtitulo=" + subtitulo + "&texto=" + texto + "&correo=" + correo + "&facebook=" + facebook + "&twitter=" + twitter + "&autor=" + autor + "&nombrepaginaweb=" + nombrepaginaweb;    
                var peticion = null;
                peticion = ConstructorXMLHttpRequest();
                if (peticion) {
                    peticion.open('POST', "includes/pages/editar-information.php", false);
 
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);

                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                            }
            }
function galeriadeimagenes(variabledominio,variableid)
            {
                var cadena = "webseleccionada=" + variabledominio + "&id=" + variableid;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/galeria.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function editargaleria(campo,accion,archivo)
             {  
                var id = document.getElementById('id').value;
                var ws = document.getElementById('ws').value;
                var enviar = document.getElementById('enviar').value;
                var cadena = "id=" + id + "&webseleccionada=" + ws + "&enviar=" + enviar + "&campo=" + campo + "&accion=" + accion + "&archivo=" + archivo;    
                var peticion = null;
                peticion = ConstructorXMLHttpRequest();
                if (peticion) {
                    peticion.open('POST', "includes/pages/galeria.php", false);
 
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);

                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                            }
            }
function diseno(variabledominio,variableid)
            {
                var cadena = "webseleccionada=" + variabledominio + "&id=" + variableid;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/design.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function upsound(variabledominio,variableid)
            {
                var cadena = "webseleccionada=" + variabledominio + "&id=" + variableid;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/sound.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function tiendavirtual(variabledominio,variableid)
            {
                var cadena = "webseleccionada=" + variabledominio + "&id=" + variableid;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/tienda.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function editardiseno()
             {  
                var id = document.getElementById('id').value;
                var ws = document.getElementById('ws').value;
                var enviar = document.getElementById('enviar').value;
                var fondo = document.getElementById('fondo').value;
                var header = document.getElementById('header').value;
                var lema = document.getElementById('lema').value;
                var parrafos = document.getElementById('parrafos').value;
                var imgover = document.getElementById('imgover').value;
                var imgmouse = document.getElementById('imgmouse').value;
                var fondosubtitulo = document.getElementById('fondosubtitulo').value;
                var titulosubtitulo = document.getElementById('titulosubtitulo').value;
                var cadena = "id=" + id + "&webseleccionada=" + ws + "&enviar=" + enviar + "&fondo=" + fondo + "&header=" + header + "&lema=" + lema + "&parrafos=" + parrafos + "&imgover=" + imgover + "&fondosubtitulo=" + fondosubtitulo + "&titulosubtitulo=" + titulosubtitulo + "&imgmouse=" + imgmouse;    
                var peticion = null;
                peticion = ConstructorXMLHttpRequest();
                if (peticion) {
                    peticion.open('POST', "includes/pages/design.php", false);
 
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);

                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                            }
            }
function abrirVentana(url) {
    window.open(url, "nuevo", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=1030, height=650");
}
function abrirVentana2(url) {
    window.open(url, "nuevo", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=600, height=600");
}
function listblog(variabledominio,variabledominio2,typedomain)
            {
                var cadena = "webseleccionada=" + variabledominio + "&domain=" + typedomain + "&webseleccionada2=" + variabledominio2;    
                var peticion = null;
                peticion = ConstructorXMLHttpRequest();
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/listblog.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }
function viewpost(variableid)
            {   
                var cadena = "postid=" + variableid;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/pages/viewpost.php", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('contenidobody').innerHTML = peticion.responseText;
                }
            }