package com.vdantsrpring.vdantsrpring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vdantsrpring.vdantsrpring.entity.Product;
import com.vdantsrpring.vdantsrpring.repository.ProductRepo;

import java.util.List;

@Service
public class ProductServices {

    @Autowired
    private ProductRepo productRepo;

    // Method to get all active products
    public List<Product> getActiveProducts() {
        return productRepo.findAll();  // You can add conditions if needed
    }

    // Method to delete a product by ID
    public void deleteProductById(int id) {
    	productRepo.deleteById(id);
    }

    // Method to add a product to the cart (or other logic)
    public void addToCart(Product product) {
        // Your logic to add to cart (or just save the product in some cart table)
    	productRepo.save(product);
    }
}
