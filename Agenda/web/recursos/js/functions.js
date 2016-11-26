/* global idevent */

function registro()
            {
                 var peticion=null;
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/registro.jsp", false);
                    peticion.send(null);
                    document.getElementById('formweb').innerHTML = peticion.responseText;
                }
            }
function login()
            {
                 var peticion=null;
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/login.jsp", false);
                    peticion.send(null);
                    document.getElementById('contenido').innerHTML = peticion.responseText;
                }
            }
function editprofile()
            {
                 var peticion=null;
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('get', "includes/editprofile.jsp", false);
                    peticion.send(null);
                    document.getElementById('cargarcontenido').innerHTML = peticion.responseText;
                }
            }
function itemevent(id)
            {   
                var cadena = "idevent=" + idevent;    
                var peticion = null;
 
                peticion = ConstructorXMLHttpRequest();
 
                if (peticion)
                {
                    peticion.open('POST', "includes/itemevent.jsp", false);
                    peticion.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    peticion.setRequestHeader("Content-length", cadena.length);
                    peticion.setRequestHeader("Connection", "close");
                    peticion.send(cadena);
                    document.getElementById('containerevent').innerHTML = peticion.responseText;
                }
            }