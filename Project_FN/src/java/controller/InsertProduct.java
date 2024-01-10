/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DaoProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.Date;
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
@WebServlet(name = "InsertProduct", urlPatterns = {"/insert"})
@MultipartConfig
public class InsertProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Part filePart = request.getPart("file"); // Lấy phần tệp từ yêu cầu
        DaoProduct daoP = new DaoProduct();
        String fileName = getFileName(filePart); // Lấy tên tệp
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String quantity_raw = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantity_raw);
        String releaseDate_raw = request.getParameter("releaseDate");
        String price_raw = request.getParameter("price");
        Double price = Double.parseDouble(price_raw);
        Date releaseDate = Date.valueOf(releaseDate_raw);
        String describe = request.getParameter("describe");
        String category = request.getParameter("Category");
        Category c = daoP.getCategory(Integer.parseInt(category));
        String images = "images/"+ getFileName(filePart);
       
        Product p = new Product(id, name, quantity, price, releaseDate, describe, images, c);
        daoP.insertProduct(p);
        request.getRequestDispatcher("manage").forward(request, response);
    }

   private String getFileName(Part part) {
    String contentDisposition = part.getHeader("content-disposition");
    String[] tokens = contentDisposition.split(";");
    for (String token : tokens) {
        if (token.trim().startsWith("filename")) {
            return token.substring(token.indexOf("=") + 2, token.length() - 1);
        }
    }
    return "";
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
