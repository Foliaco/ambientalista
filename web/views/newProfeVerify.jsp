<%-- 
    Document   : newProfeVerify
    Created on : 26/08/2021, 10:45:55 AM
    Author     : compaq-cq45
--%>

<%@page import="DTO.ProfesorDTO"%>
<%@page import="DAOS.ProfesorDaos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            ProfesorDaos pDaos = new ProfesorDaos();
            String cedula =request.getParameter("cedula");
            int newCedula=Integer.parseInt(cedula);
            String ciudad=request.getParameter("ciudad"); 
            String nombre=request.getParameter("nombre"); 
            ProfesorDTO pDTO=new ProfesorDTO();
            
            pDTO.setCedula(newCedula);
            pDTO.setNombre(nombre);
            pDTO.setCiudad(ciudad);

            boolean check=pDaos.NewProfe(pDTO);
            if(check){
                out.print("<h1>ok</h1>");
            }
            else{
                out.print("<h1>no</h1>");
            }
        %>
        
        
    </body>
</html>
