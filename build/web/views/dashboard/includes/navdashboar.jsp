<%-- 
    Document   : navdashboar
    Created on : 1/09/2021, 12:46:39 PM
    Author     : compaq-cq45
--%>

<%@page import="DTO.RolDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.RolDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession();
    
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
    
    RolDAOS rol=new RolDAOS();
    ArrayList <RolDTO> listRol=new ArrayList();
    
     String elRol="";
       
       System.out.print("id rolll is"+((Object)sesion.getAttribute("rol")).getClass().getSimpleName()+sesion.getAttribute("rol"));
       System.out.print(sesion.getAttribute("rol"));
       
       listRol=rol.getOne((Integer)sesion.getAttribute("rol"));
       for(RolDTO r:listRol){
           elRol=r.getRol();
           sesion.setAttribute("id_rol",r.getId_rol());
       }
       sesion.setAttribute("elRol",elRol);
    %>

<nav class="nav-left" id='menu'>
    <div class='logo'>
        <div>
            <i class='fas fa-school'></i>
            <h2>Ambientalista<br>Panel</h2>
        </div>
    </div>
    <ul class='lista'>
        <li>
            <a href='/eaci/views/dashboard'>Inicio</a>
            <span class='linea'></span>
        </li>
        <%
            if(elRol.equals("administrador")){
                 
                %>
        <li>
            <a href='/eaci/views/dashboard/usuarios.jsp'>Usuarios</a>
            <span class='linea'></span>
        </li>
        <%
            }
        %>
        <li>
            <a href='./'>Mensajes</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='./'>Archivados</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='./'>Configraciones</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='../includes/outline.jsp' ><i class='fas fa-sign-out-alt'></i> Log out</a>
            <span class='linea'></span>
        </li>
    </ul>
</nav>
