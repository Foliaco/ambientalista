package DAOS;

import DTO.PersonaDTO;
import config.Database;
import interfaces.Interfaz_Persona;
import java.sql.*;
import java.util.ArrayList;

public class PersonaDAOS implements Interfaz_Persona{
    
    Database DB=new Database();
    Connection conex=null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check=false;
    
    @Override
    public ArrayList<PersonaDTO> showPerson() {
        
        ArrayList <PersonaDTO> personas = new ArrayList();
        
        try{
            sql="select * from personas";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql);
            while(rs.next()){
                PersonaDTO persona=new PersonaDTO();
                persona.setId_persona(rs.getInt("id_persona"));
                persona.setName(rs.getString("name"));
                persona.setMiddlename(rs.getString("middlename"));
                persona.setLastname(rs.getString("lastname"));
                persona.setSecondlasname(rs.getString("seccondlastname"));
                persona.setEmail(rs.getString("email"));
                persona.setTelefono(rs.getString("telefono"));
                persona.setCedula(rs.getString("cedula") == null ? "" : rs.getString("cedula"));
                personas.add(persona);
            }
            return personas;
        }
        catch(Exception e){
            System.out.print("error en obtener todos los usuarios"+e.toString());
        }
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<PersonaDTO> getOnePerson(Integer id){
        ArrayList <PersonaDTO> persona=new ArrayList();
        try{
            sql="select * from personas where id_persona="+id+"";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql);
            while(rs.next()){
                PersonaDTO person=new PersonaDTO();
                person.setId_persona(rs.getInt("id_persona"));
                person.setName(rs.getString("name"));
                person.setMiddlename(rs.getString("middlename"));
                person.setLastname(rs.getString("lastname"));
                person.setSecondlasname(rs.getString("seccondlastname"));
                person.setEmail(rs.getString("email"));
                person.setTelefono(rs.getString("telefono"));
                persona.add(person);
            }
            return persona;
        }
        catch(Exception e){
            System.out.print("error en get one "+e.toString());
            return null;
        }
    }
    
    public ArrayList<PersonaDTO> getPersonCredencial(Integer id_public){//consigo nobres de credenciales y personas reales
        ArrayList <PersonaDTO> person=new ArrayList();
        try{
            sql="select publicaciones.id_publicacion,publicaciones.title,publicaciones.usuario as dueno,\n" +
"credenciales.id_credencial,\n" +
"credenciales.username,\n" +
"personas.id_persona,personas.name \n" +
"from publicaciones,credenciales,personas \n" +
"where personas.id_persona= credenciales.id_persona\n" +
"and publicaciones.usuario=credenciales.id_credencial\n" +
"and publicaciones.id_publicacion="+id_public+"";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql);
            
            while(rs.next()){
                PersonaDTO p=new PersonaDTO();
                p.setId_persona(rs.getInt("id_persona"));
                p.setName(rs.getString("name"));
                person.add(p);
            }
            return person;
        }
        catch(Exception e){
            return null;
        }
    }

    @Override
    public boolean newPresona(PersonaDTO person) {
        int valor=0;
        try{
            
            sql="insert into personas(id_persona, cedula, name, middlename, lastname, seccondlastname, telefono, email)"
                    + "VALUES(id_persona, '"+person.getCedula()+"','"+person.getName()+"','"+person.getMiddlename()+"',"
                    + "'"+person.getLastname()+"','"+person.getSecondlasname()+"','"+person.getTelefono()+"',"
                    + "'"+person.getEmail()+"')";
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);
            if(valor!=0){
                return check= true;
            }
           
            return check;
        }
       
        catch(Exception e){
            System.out.println("error al insertar los datos: "+ e.getMessage());
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
    }

    @Override
    public boolean updatePerson(PersonaDTO person) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deletePerson(PersonaDTO person) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
