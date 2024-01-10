/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Cart {
    private String ProductID;
    private String ProductName;
    private int quantity;
    private double PriceProduct;
    private double totalPrice;
    private String ProductImage;
    public Cart() {
    }

    public Cart(String ProductID, String ProductName, int quantity, double PriceProduct, double totalPrice, String ProductImage) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.quantity = quantity;
        this.PriceProduct = PriceProduct;
        this.totalPrice = totalPrice;
        this.ProductImage = ProductImage;
    }
    
    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }

    public Cart(String ProductID, String ProductName, int quantity, double PriceProduct, double totalPrice) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.quantity = quantity;
        this.PriceProduct = PriceProduct;
        this.totalPrice = totalPrice;
    }
    
    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public Cart(String ProductID, String ProductName, int quantity, double PriceProduct) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.quantity = quantity;
        this.PriceProduct = PriceProduct;
    }

    

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPriceProduct() {
        return PriceProduct;
    }

    public void setPriceProduct(double PriceProduct) {
        this.PriceProduct = PriceProduct;
    }
    
    
    
}
