/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emergentes.bean;

import com.emergentes.entidades.Categoria;
import com.emergentes.jpa.CategoriaJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author nivek
 */
public class BeanCategoria {
    private EntityManagerFactory emf;
    private CategoriaJpaController jpaCategoria;
    
    public BeanCategoria(){
        emf= Persistence.createEntityManagerFactory("biblio20PU");
        jpaCategoria= new CategoriaJpaController(emf);
    }
    public List<Categoria> listarTodos(){
        return jpaCategoria.findCategoriaEntities();
    }
    public void insertar(Categoria c){
        jpaCategoria.create(c);
    }
    public void editar(Categoria c){
        try {
            jpaCategoria.edit(c);
        } catch (Exception ex) {
            Logger.getLogger(BeanCategoria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void  eliminar(Integer id){
        try {
            jpaCategoria.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanCategoria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Categoria buscar(Integer id){
        return jpaCategoria.findCategoria(id);
    }
}
