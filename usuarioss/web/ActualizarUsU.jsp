<%-- 
    Document   : ActualizarUsU
    Created on : 4/05/2021, 02:56:09 PM
    Author     : Ulises
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;

            String url, userName, password, driver;

            url = "jdbc:mysql://localhost/baseusuarios";
            userName = "root";
            password = "ringorivera28";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    
                    String nombreUsu, apellidop, apellidom, direccion, telefono, nombreusuario;
                    int edad;
                    
                    nombreUsu = request.getParameter("nombre2");
                    apellidop = request.getParameter("apellidop2");
                    apellidom = request.getParameter("apellidom2");
                    edad = edad = Integer.parseInt(request.getParameter("edad2"));
                    direccion = request.getParameter("dire2");
                    telefono= request.getParameter("tel2");
                    password=request.getParameter("pass2");
                    
                    
                    nombreusuario = nombreUsu;
                    
                    int id = Integer.parseInt(request.getParameter("id2"));
                    String q = "update usuarios set nom_usu = '"+nombreusuario+"', "
                            + "edad_usu = '"+edad+"', dire_usu = '"+direccion+"', "
                            + "tel_usu = '"+telefono+"',"
                            + "pass_usu = '"+password+"'"
                            + "where id_usu = "+id+"";
                    
                    set = con.createStatement();
                    
                    int borrar = set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Registro Actualizado con Exito</h1>
                    
                    <%     
                    set.close();   
                    %>
                    <title>Borrar registros</title>
                    <%
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el dato");
                    System.out.println(ed.getMessage());
                     %>
                    
                    <h1>Registro No es posible Actualizarlo con Exito, juguito contigo</h1>
                    
                    <% 
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
            
            }
            %>
        
    </body>
</html>