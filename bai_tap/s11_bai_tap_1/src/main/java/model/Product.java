package model;

public class Product {
    private int id;
    private String nameProduct;
    private double price;
    private String moTa;
    private String nhaSanXuat;

    public Product() {
    }

    public Product(int id, String nameProduct, double price, String moTa, String nhaSanXuat) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.price = price;
        this.moTa = moTa;
        this.nhaSanXuat = nhaSanXuat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getNhaSanXuat() {
        return nhaSanXuat;
    }

    public void setNhaSanXuat(String nhaSanXuat) {
        this.nhaSanXuat = nhaSanXuat;
    }
}
