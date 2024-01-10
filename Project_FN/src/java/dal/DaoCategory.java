/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author DELL
 */
public class DaoCategory extends DBContext{
    public List<Category> list(){
        List<Category> list = new ArrayList<>();
        try{
            String sql = "select * from categories";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Category c = new Category(rs.getInt("id"), rs.getString("name"),
                        rs.getString("describe"));
                list.add(c);
            }
        }catch(Exception E){
            System.out.println(E);
        }
        return list;
    }
    public static void main(String[] args) {
        DaoCategory dao = new DaoCategory();
        List<Category> list = dao.list();
        System.out.println(list.get(0));
    }
}
