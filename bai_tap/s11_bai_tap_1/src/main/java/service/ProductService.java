package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepository;
import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> display() {
        return productRepository.display();
    }

    @Override
    public void addNewProduct(Product product) {
        productRepository.display().add(product);
    }

    @Override
    public void eidtProduct(int id, Product product) {
       productRepository.eidtProduct( id,product);
    }

    @Override
    public void xoaProduct(int id) {
       productRepository.xoaProduct(id);
    }
}
