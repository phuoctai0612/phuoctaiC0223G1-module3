package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
     List<Product> display();
    void addNewProduct(Product product);
    void eidtProduct(int id,Product product);
    void deleteProduct(int id);
    int findId(int id);
    List<Product> findNameProduct(String name);
}
