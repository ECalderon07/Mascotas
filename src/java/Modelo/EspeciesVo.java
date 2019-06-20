/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Edwin
 */
public class EspeciesVo {

    private int especie;
    private String nombre;

    public EspeciesVo(int especie, String nombre) {
        this.especie = especie;
        this.nombre = nombre;
    }

    public EspeciesVo() {
    }

    public int getEspecie() {
        return especie;
    }

    public void setEspecie(int especie) {
        this.especie = especie;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}

