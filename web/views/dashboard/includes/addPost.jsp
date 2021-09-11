<%-- 
    Document   : addPost
    Created on : 8/09/2021, 09:41:13 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sesion=request.getSession();
%>
<div class="content-add-post">
    <h1>Añadir una pubicacion</h1>
    <form action="/eaci/control/addpublic.jsp" method="post" enctype="multipart/form-data">
        <div class="control">
            <label for="title">Title</label>
            <input type="text" name="title" required="true" />
        </div>
        <div class="control">
            <label for="body">Cuerpo de la publicacion</label>
            <textarea name="body"></textarea>
        </div>
        <div class="control">
            <label for="imagen">Inserte una imagen</label>
            <input type="file" name="imagen" class='imagen'/>
           
        </div>
        <input type="hidden" name='rol' value='<%= sesion.getAttribute("id_rol")%>' />
        <div class="control">
            <select name="tipo">
                <option value="evento">Evento</option>
                <option value="noticias">Noticias</option>
                <option value="normal">Normal</option>
            </select>
        </div>
        <input name='newUpload' value='Publicar' type='submit'/>
    </form>
</div>
