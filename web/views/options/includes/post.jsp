<%-- 
    Document   : post
    Created on : 5/09/2021, 01:06:42 PM
    Author     : compaq-cq45
--%>

<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.PublicacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PublicacionDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    
    Integer id_public=Integer.parseInt(request.getParameter("id_public")==null ? "0" :request.getParameter("id_public"));
    PersonaDAOS persona=new PersonaDAOS();
    ArrayList <PersonaDTO> personaone=new ArrayList();
    
    PublicacionDAOS publication=new PublicacionDAOS();
    ArrayList <PublicacionDTO> onePublication=new ArrayList();
    
    onePublication=publication.getOnePublication(id_public);
    
    String title="";
    String body="";
    String image="";
    Integer id_usuario=0;
    Integer id_pub=0;
    String fecha="";
    String name="";
    boolean archivado=false;
    
    for(PublicacionDTO p: onePublication){
        archivado=p.getArchivado();
        title=p.getTitle();
        id_pub=p.getId_publicacion() == 0 ? 0 : p.getId_publicacion();
        body=p.getBody();
        image=p.getImage();
        id_usuario=p.getId_publicacion();
        fecha=p.getFecha();
    }
    System.out.print("el boleanod "+Boolean.parseBoolean(request.getParameter("admin")));
    if(id_pub!=0){
        if(!archivado || Boolean.parseBoolean(request.getParameter("admin"))==true){
            personaone=persona.getPersonCredencial(id_public);
            for(PersonaDTO p:personaone){
                name=p.getName();
            }
%>

<div class='post-content'>
    <div class='fecha'>
        <p><%= fecha %></p>
    </div>
    <%  
        if(request.getParameter("archive")!=null){%>
        
        <div class='content-options'>
            <div>
                <a href='operators/delete.jsp?id_publicacion=<%= id_public %>'><i class='fas fa-trash'></i>
                    <p>Eliminar</p></a>
            </div>
            <div>
                <%
                if(archivado){
                %>
                <a href='/eaci/views/options/operators/archivePost.jsp?archi=false&post=<%= id_public%>'><i class='fas fa-folder-minus' style="color:green"></i><p>Desarchivar</p></a>
                <%
                    }
                    else{
                %>
                <a href='/eaci/views/options/operators/archivePost.jsp?archi=true&post=<%= id_public %>'><i class='fas fa-folder-minus'></i><p>Archivar</p></a>
                <%
                }
                %>
            </div>
        </div>
        
            <%
        }
    %>
    <div class='header-post'>
        <h2><%= name %></h2>
        <h3><%= title %></h3>
        <p><%= body %></p>
    </div>
    <div class='body-post'>
        <div class='img-content'>
        <img src='data:image/jpeg;base64,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' alt='imagen'/>    
        </div>
    </div>
    <div class='reaction-content'>
        <div class='left-reaction'>
            
        <a><i class='fas fa-heart like'></i></a>
        <a><i class='fas fa-comment-dots coments'></i></a>
        <a><i class='fas fa-share share'></i></a>

        </div>
        
        <a><i class='fas fa-exclamation-circle report'></i></a>
    </div>
</div>
<%  
    }
else{
%>
<jsp:include page="../../includes/404.jsp"/>

<%
    }
    }
%>
