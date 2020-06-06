package com.example.demo.Entity;

import javax.persistence.*;


@Entity
@Table(name = "producto")
public class Producto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idproducto")

    private int idproducto;

    @Column(name = "codigoproducto")

    private String codigoproducto;

    @Column(name = "nombreproducto")

    private String nombreproducto;



    @Column(name = "foto")
    private String foto;

    @Column(name = "precio")

    private Double precio;

    @Column(name = "stock")

    private int stock;

    @Column(name = "descripcion")

    private String descripcionproducto;


    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public String getCodigoproducto() {
        return codigoproducto;
    }

    public void setCodigoproducto(String codigoproducto) {
        this.codigoproducto = codigoproducto;
    }

    public String getNombreproducto() {
        return nombreproducto;
    }

    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcionproducto() {
        return descripcionproducto;
    }

    public void setDescripcionproducto(String descripcionproducto) {
        this.descripcionproducto = descripcionproducto;
    }
}
