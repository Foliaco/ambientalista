<%-- 
    Document   : addUser
    Created on : 15/09/2021, 06:20:03 PM
    Author     : Luis Jose
--%>


<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <title>Agregando usuario</title>
</head>

<a href="../views/dashboard/usuarios.jsp"></a>

<%
    
    String cedula = request.getParameter("cedula");
    String nombre = request.getParameter("nombre");
    String nombre2 = request.getParameter("segundo_nombre");
    String apellido = request.getParameter("apellido");
    String apellido2 = request.getParameter("segundo_apellido");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("email");
    
    if(cedula.length()==0 || nombre.length()==0 || nombre2.length()==0 || apellido.length()==0 || apellido2.length()==0
            || telefono.length()==0 || correo.length()==0){
        
        
        response.sendRedirect("../views/dashboard/includes/addUserview.jsp");
    }
    
    else{
        
        PersonaDTO pdto = new PersonaDTO();
        PersonaDAOS persona = new PersonaDAOS();
        pdto.setCedula(cedula);
        pdto.setName(nombre);
        pdto.setMiddlename(nombre2);
        pdto.setLastname(apellido);
        pdto.setSecondlasname(apellido2);
        pdto.setTelefono(telefono);
        pdto.setEmail(correo);
        boolean agregando = persona.newPresona(pdto);
        if(agregando){ 
            %>
            <script>
                alert("Usuario agregado :D");
            </script>
            <%
                response.sendRedirect("../views/dashboard/usuarios.jsp");
             
                   
        }
        else{
            %>
            <script>
                alert("Error al agregar el usuario");
            </script>
            
         <% 
            response.sendRedirect("../views/dashboard/includes/addUserview.jsp");
        }
            
        
        
    }

    %>
