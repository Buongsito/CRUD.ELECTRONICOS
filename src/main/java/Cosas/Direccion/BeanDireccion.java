package Cosas.Direccion;

public class BeanDireccion {

    private int id;
    private String calle;
    private String colonia;
    private int postal;
    private String estado;
    private String pais;

    public BeanDireccion(int id, String calle, String colonia, int postal, String estado, String pais) {
        this.id = id;
        this.calle = calle;
        this.colonia = colonia;
        this.postal = postal;
        this.estado = estado;
        this.pais = pais;
    }

    public BeanDireccion() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public int getPostal() {
        return postal;
    }

    public void setPostal(int postal) {
        this.postal = postal;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
}
