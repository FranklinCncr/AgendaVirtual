/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.addEventListener('load', function(){
    document.getElementById('boton').addEventListener('click', function(){
        var usuario=document.getElementById('txtusuario').value;
        var contraseña=document.getElementById('txtpassword').value;
        var bandera=false;
        if(usuario.length>0 && contraseña.length>0){
            bandera=true;
        }
        if(bandera){
            document.getElementById('forminicio').submit();
        }else{
            alert('Por favor llene todos los campos');
        }
    });      
});

