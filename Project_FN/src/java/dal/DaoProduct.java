/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class DaoProduct extends DBContext {

    public List<Product> listProduct(int cid) {
        String sql = "";
        List<Product> listProduct = new ArrayList<>();
        if (cid > 0) {
            sql = "select * from products where cid = " + cid;
        } else {
            sql = "select * from products";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//             st.setInt(1, cid);
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
                Category c = getCategory(rs.getInt("cid"));
                p.setCategory(c);

                listProduct.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listProduct;

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

    public List<Product> searchByCondition(String condition) {
        List<Product> list = new ArrayList();
//            String sql = "select * from Products where name like '%condition%' and describe like'%condition%'";
        String sql = "select * from Products where name like '%" + condition + "%' and describe like'%" + condition + "%'";
//            String sql = "SELECT * FROM Products WHERE name LIKE ? AND description LIKE ?";

//statement.setString(1, "%" + condition + "%");
//statement.setString(2, "%" + condition + "%");
//ResultSet resultSet = statement.executeQuery();
        try {
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
                Category c = getCategory(rs.getInt("cid"));
                p.setCategory(c);

                list.add(p);
            }
        } catch (Exception E) {
            System.out.println(E);
        }
        return list;
    }

    public Product cartProduct(String id) {
        String sql = "";
        List<Product> listProduct = new ArrayList<>();

        sql = "select * from products where id = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategory(rs.getInt("cid"));
                p.setCategory(c);

                return p;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Product> listByPage(List<Product> list, int start, int finish) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < finish; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void deleteProduct(String id) {
        String sql = "Delete from products where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception E) {

        }
    }

    public void insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[products]\n"
                + "           ([ID]\n"
                + "           ,[name]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[releaseDate]\n"
                + "           ,[describe]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getId());
            st.setString(2, p.getName());
            st.setInt(3, p.getQuantity());
            st.setDouble(4, p.getPrice());
            st.setDate(5, p.getReleaseDate());
            st.setString(6,p.getDescribe());
            st.setString(7, p.getImage());
            st.setInt(8, p.getCategory().getId());
            st.executeUpdate();
        } catch (Exception E) {

        }
    }

    public static void main(String[] args) {
        DaoProduct d = new DaoProduct();
         Product product = new Product("1", "1", 0, 0, Date.valueOf("2019-05-05"), "ads", "dfs", d.getCategory(2));
         d.insertProduct(product);

    }

}
