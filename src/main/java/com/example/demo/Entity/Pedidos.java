package com.example.demo.Entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "pedidos")
public class Pedidos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpedidos")
    private int idPedidos;

    private String codigopedido;

    private int totalpagado;

    private Date fechacompra;

    @ManyToOne
    @JoinColumn(name = "producto_idproducto")
    private Producto producto;

    public int getIdPedidos() {
        return idPedidos;
    }

    public void setIdPedidos(int idPedidos) {
        this.idPedidos = idPedidos;
    }

    public String getCodigopedido() {
        return codigopedido;
    }

    public void setCodigopedido(String codigopedido) {
        this.codigopedido = codigopedido;
    }

    public int getTotalpagado() {
        return totalpagado;
    }

    public void setTotalpagado(int totalpagado) {
        this.totalpagado = totalpagado;
    }

    public Date getFechacompra() {
        return fechacompra;
    }

    public void setFechacompra(Date fechacompra) {
        this.fechacompra = fechacompra;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}
