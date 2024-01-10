/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Admin;

/**
 *
 * @author DELL
 */
public class DaoAccount extends DBContext {

    public Admin check(String username, String password) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Admin]\n"
                + "  where Username =? and Password =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin(rs.getString("username"), rs.getString("password"), rs.getInt("role"));
                return admin;
            }
        } catch (Exception E) {

        };

        return null;
    }

    public boolean checkAccount(String username, String password) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Admin]\n"
                + "  where Username =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                String sql1 = "INSERT INTO [dbo].[Admin]\n"
                        + "           ([Username]\n"
                        + "           ,[Password]\n"
                        + "           ,[role])\n"
                        + "     VALUES\n"
                        + "           (?,?,1)";
                PreparedStatement st1 = connection.prepareStatement(sql1);
               st1.setString(1, username);
               st1.setString(2, password);
               st1.executeUpdate();
            }
        } catch (Exception E) {

        };
        return true;
    }

}
