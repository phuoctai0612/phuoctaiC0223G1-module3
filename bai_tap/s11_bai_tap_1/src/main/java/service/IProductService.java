package service;

import model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductService {
    List<Product> display();
    void addNewProduct(Product product);
    void eidtProduct(int id,Product product);
    void xoaProduct(int id);
    List<Product> findNameProduct(String name);
}
