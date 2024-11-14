/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DbContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.TaiKhoan;


/**
 *
 * @author trant
 */
public class TaiKhoanDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    // đặt tên database không được đặt là user hoặc User  hãy sử dụng tên khác plsss!!
    
    public TaiKhoan checkLogin (String username , String password){
        TaiKhoan tk = null;
        conn = DbContext.getConnection();
        try {
            ps=conn.prepareStatement("select * from users where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs=ps.executeQuery();
            if (rs.next()) // có tồn tại 1 user
            {
                tk = new TaiKhoan(rs.getString(1),rs.getString(2));
            }
        } catch (Exception ex) {
            System.out.println("Loi :" + ex.toString());
        }
        
        return tk;
    }
    // thay đổi mật khẩu 
    //code
    
}