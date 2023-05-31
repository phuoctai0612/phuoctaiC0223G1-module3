package repository;

import model.Product;


import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
  private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Máy giặt",200,"Tốt,bền","Panasonic"));
        productList.add(new Product(2,"Điều hòa",200,"Tốt,bền","Panasonic"));
        productList.add(new Product(3,"Lò vi sóng",200,"Tốt,bền","Panasonic"));
        productList.add(new Product(4,"Ti vi",200,"Tốt,bền","Panasonic"));
        productList.add(new Product(5,"Chủi",200,"Tốt,bền","Panasonic"));
        productList.add(new Product(6,"Laptop",200,"Tốt,bền","Panasonic"));
        productList.add(new Product(7,"PC",200,"Tốt,bền","Panasonic"));
    }

    @Override
    public List<Product> display() {
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {

    }

    @Override
    public void eidtProduct(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==id){
                productList.set(i,product);
            }
        }
    }

    @Override
    public void xoaProduct(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==id){
                productList.remove(i);
            }
        }
    }
}
