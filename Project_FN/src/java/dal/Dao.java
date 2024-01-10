/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class Dao extends DBContext {
     public List<Category> getAll(){
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("describe"));
                list.add(c);

            }
        } catch (Exception E) {
            System.out.println(E);
        }
        return list;
    }
     public Category getCategory(int id) {

        String sql = "select * from Categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("describe"));
                return c;

            }
        } catch (Exception E) {
            System.out.println(E);
        }
        return null;
    }
    public List<Product> getProduct(int cid){
        List<Product> list = new ArrayList<>();
        
        String sql = "select * from products where 1=1 ";
        if(cid != 0){
            sql += "and cid = "+ cid;
        }
        try{
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
        
        Product p = new Product();
                 p.setId(rs.getString("id"));
                 p.setName(rs.getString("name"));
                 p.setQuantity(rs.getInt("quantity"));
                 p.setPrice(rs.getDouble("price"));
                 p.setReleaseDate(rs.getDate("releaseDate"));
                 p.setDescribe(rs.getString("describe"));
                  p.setImage(rs.getString("image"));
                  Category c =  getCategory(rs.getInt("cid"));
                  p.setCategory(c);
                 
                  list.add(p);
        }
        }catch(Exception e){
            
        }
        return list;
    }
    public  List<Product> search( String key,Double fromPrice,
            Double  toPrice , Date fromDate , Date toDate, int cid, String condition ){
         List<Product> list = new ArrayList<>();
         String sql = "select * from products where 1=1 ";
         if(key != null && !key.equals("")){
             sql += "and name like '%" + key + "%' or describe like '%"+ key +"%'"; 
         }
         if(fromPrice != null ){
             sql += "and price >= "+fromPrice;
         }
         if(toPrice != null ){
             sql += "and price <= "+toPrice;
         }
         if(fromDate !=null){
             sql += "and releaseDate >= '" + fromDate + "'";
         }
          if(toDate !=null){
             sql += "and releaseDate <= '" + toDate + "'";
         }
          if(cid != 0){
              sql += "and cid = "+cid;
          }
          if(condition != null){
              sql +=  " order by price " +condition;
          }
           try{
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
        
        Product p = new Product();
                 p.setId(rs.getString("id"));
                 p.setName(rs.getString("name"));
                 p.setQuantity(rs.getInt("quantity"));
                 p.setPrice(rs.getDouble("price"));
                 p.setReleaseDate(rs.getDate("releaseDate"));
                 p.setDescribe(rs.getString("describe"));
                  p.setImage(rs.getString("image"));
                  Category c =  getCategory(rs.getInt("cid"));
                  p.setCategory(c);
                 
                  list.add(p);
        }
        }catch(Exception e){
            
        }
         return list;
    }
    
  
        
        
        
        
      }
        

