package com.example.demo.Entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "rol")
public class Rol implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idrol;
    private String nombre;

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
