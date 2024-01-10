/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author DELL
 */
public class DaoCart extends DBContext {

    public void insert(Product p, int quantity) {

        //insert sản phẩm
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([ProductID]\n"
                + "           ,[ProductName]\n"
                + "           ,[ProductImage]\n"
                + "           ,[Quantity]\n"
                + "           ,[PriceProduct])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getId());
            st.setString(2, p.getName());
            st.setString(3, p.getImage());
            st.setInt(4, quantity);
            st.setDouble(5, p.getPrice());
            st.executeUpdate();
        } catch (Exception E) {

        }
    }

    public List<Cart> listCart() {
        List<Cart> list = new ArrayList<>();
        String sql = "Select * from Cart";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setProductID(rs.getString("ProductID"));
                cart.setProductName(rs.getString("ProductName"));
                cart.setQuantity(rs.getInt("Quantity"));
                cart.setProductImage(rs.getString("ProductImage"));
                cart.setPriceProduct(rs.getDouble("PriceProduct"));
                cart.setTotalPrice(rs.getDouble("TotalPrice"));
                list.add(cart);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void deleteByProductName(String name) {
        String sql = "delete from cart where productname = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
        } catch (Exception E) {

        }
    }

    public void updateQuantity(String productId, int quantity) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET \n"
                + "      [Quantity] =?\n"
                + "      \n"
                + " WHERE ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setString(2, productId);
            st.executeUpdate();
        } catch (Exception E) {

        }
    }

    public static void main(String[] args) {
        DaoCart dao = new DaoCart();
        dao.updateQuantity("ip2", 4);
       
    }
}
