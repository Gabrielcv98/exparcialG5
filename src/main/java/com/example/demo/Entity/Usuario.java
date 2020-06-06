package com.example.demo.Entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idusuario;
    private String nombre;
    private String apellido;
    private String dni;
    private String correo;
    private String contrasena;
    @Column(nullable = true)
    private boolean enable;
    @ManyToOne
    @JoinColumn(name = "rol_idrol")
    private Rol rol;

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
}
