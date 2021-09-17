<%-- 
    Document   : usuarios
    Created on : 3/09/2021, 10:27:11 PM
    Author     : compaq-cq45
--%>

<%@page import="DTO.PersonaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("name") == null) {
        response.sendRedirect("../login.jsp");
    }

%>

<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='./css/index.css'/>
</jsp:include>


<div class='header' id='header'>
    <jsp:include page='includes/header.jsp' >
        <jsp:param name='nickname' value='<%= sesion.getAttribute("name")%>' /> 
        <jsp:param name='name' value='<%= sesion.getAttribute("nombre") + " " + sesion.getAttribute("secondname") + " " + sesion.getAttribute("lastname") + " " + sesion.getAttribute("secondLastname")%>' />

        <jsp:param name='rol' value='<%= sesion.getAttribute("elRol")%>' />

    </jsp:include>

</div>

<jsp:include page='includes/navdashboar.jsp'/>
<%
    PersonaDAOS personas = new PersonaDAOS();
    ArrayList<PersonaDTO> personList = new ArrayList();
    personList = personas.showPerson();
    String cedula = "";
    String name = "";
    String middlename = "";
    String lastname = "";
    String secondLastname = "";
    String telefono = "";
    String email = "";
    int id_person = 0;
    int id_rol = 0;


%>
<div>
    <button type="submit"><a href="../../views/dashboard/includes/addUserview.jsp">Añadir Usuario</a></button>
</div>
<div class='usuarios-content' id="cardList">

    <ul class='userlist'>

        <%        for (PersonaDTO p : personList) {
                name = p.getName();
                middlename = p.getMiddlename();
                cedula = p.getCedula();
                lastname = p.getLastname();
                secondLastname = p.getSecondlasname();
                telefono = p.getTelefono();
                email = p.getEmail();
                id_person = p.getId_persona();
        %>

        <jsp:include page='includes/user.jsp'>
            <jsp:param name='nombre' value="<%= name%>" />
            <jsp:param name='cedula' value="<%= cedula%>" />
            <jsp:param name='middlename' value="<%= middlename%>" />
            <jsp:param name='lastname' value="<%= lastname%>" />
            <jsp:param name='secondLastname' value="<%= secondLastname%>" />
            <jsp:param name='telefono' value="<%= telefono%>" />
            <jsp:param name='email' value="<%= email%>" />
            <jsp:param name='id_person' value="<%= id_person%>" />
        </jsp:include>
        <%
            }
        %>
    </ul>
</div>





<script src='./js/menu.js' type='text/javascript'></script>
<jsp:include page='../includes/footer.jsp'/>