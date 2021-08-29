package Cosas.Electronicos;

import Cosas.Direccion.BeanDireccion;
import Cosas.Conexion.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoElectronicos {

    private Connection con;
    private CallableStatement cstm;
    private ResultSet rs;
    final private Logger CONSOLE = LoggerFactory.getLogger(DaoElectronicos.class);

    public List<BeanElectronicos> findAll(){
        List<BeanElectronicos> listElectronicos = new ArrayList<>();

        try {
            con = ConnectionMySQL.getConnection();
            cstm =con.prepareCall("{call sp_Find}");
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanElectronicos beanElectronicos= new BeanElectronicos();
                BeanDireccion beanDireccion = new BeanDireccion();

                beanElectronicos.setId(rs.getInt("id"));
                beanElectronicos.setNombre(rs.getString("nombre"));
                beanElectronicos.setEstado(rs.getInt("status"));

                beanDireccion.setId(rs.getInt("id"));
                beanDireccion.setCalle(rs.getString("calle"));
                beanDireccion.setColonia(rs.getString("colonia"));
                beanDireccion.setPostal(rs.getInt("codigo postal"));
                beanDireccion.setEstado(rs.getString("estado"));
                beanDireccion.setPais(rs.getString("pais"));

                beanElectronicos.setDireccionId(beanDireccion);
                listElectronicos.add(beanElectronicos);
            }
        }catch (SQLException e){
            CONSOLE.error("Ha ocurrido un error:" + e);
        }finally {
            ConnectionMySQL.closeConnection(con,cstm,rs);
        }

        return listElectronicos;
    }


    public boolean create(BeanElectronicos beanElectronicos){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_create(?,?,?,?,?,?)}");

            cstm.setString(1, beanElectronicos.getNombre());
            cstm.setString(2,beanElectronicos.getDireccionId().getCalle());
            cstm.setString(3,beanElectronicos.getDireccionId().getColonia());
            cstm.setInt(4,beanElectronicos.getDireccionId().getPostal());
            cstm.setString(5,beanElectronicos.getDireccionId().getEstado());
            cstm.setString(6,beanElectronicos.getDireccionId().getPais());

            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }


    public BeanElectronicos findById(int id){
        BeanElectronicos beanElectronicos = null;

        try {
            con = ConnectionMySQL.getConnection();
            cstm =con.prepareCall("{call sp_findById(?)}");
            cstm.setLong(1, id );
            rs = cstm.executeQuery();

            if(rs.next()){
                beanElectronicos = new BeanElectronicos();
                BeanDireccion beanDireccion = new BeanDireccion();

                beanElectronicos.setId(rs.getInt("id"));
                beanElectronicos.setNombre(rs.getString("nombre"));
                beanElectronicos.setEstado(rs.getInt("status"));

                beanDireccion.setId(rs.getInt("id"));
                beanDireccion.setCalle(rs.getString("calle"));
                beanDireccion.setColonia(rs.getString("colonia"));
                beanDireccion.setPostal(rs.getInt("codigo postal"));
                beanDireccion.setEstado(rs.getString("estado"));
                beanDireccion.setPais(rs.getString("pais"));

                beanElectronicos.setDireccionId(beanDireccion);
            }
        }catch (SQLException e){
            CONSOLE.error("Ha ocurrido un error:" + e);
        }finally {
            ConnectionMySQL.closeConnection(con,cstm,rs);
        }

        return beanElectronicos;
    }



    public boolean update(BeanElectronicos BeanElectronicos){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_update(?,?,?,?,?,?,?,?)}");

            cstm.setLong(1, BeanElectronicos.getId());
            cstm.setLong(2,BeanElectronicos.getDireccionId().getId());
            cstm.setString(3, BeanElectronicos.getNombre());
            cstm.setString(4,BeanElectronicos.getDireccionId().getCalle());
            cstm.setString(5,BeanElectronicos.getDireccionId().getColonia());
            cstm.setInt(6,BeanElectronicos.getDireccionId().getPostal());
            cstm.setString(7,BeanElectronicos.getDireccionId().getEstado());
            cstm.setString(8,BeanElectronicos.getDireccionId().getPais());

            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }


    public boolean delete(int id){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_delete(?)}");
            cstm.setInt(1, id);
            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }
}