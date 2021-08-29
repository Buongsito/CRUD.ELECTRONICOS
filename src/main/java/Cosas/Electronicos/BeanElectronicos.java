package Cosas.Electronicos;
import Cosas.Direccion.BeanDireccion;

public class BeanElectronicos {

    private int id;
    private String nombre;
    private BeanDireccion direccionId = new BeanDireccion();
    private int estado;

    public BeanElectronicos(int id, String nombre, BeanDireccion direccionId, int estado) {
        this.id = id;
        this.nombre = nombre;
        this.direccionId = direccionId;
        this.estado = estado;
    }

    public BeanElectronicos() {
    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public BeanDireccion getDireccionId() {
        return direccionId;
    }

    public void setDireccionId(BeanDireccion direccionId) {
        this.direccionId = direccionId;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
