package com.vdantsrpring.vdantsrpring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vdantsrpring.vdantsrpring.entity.Product;
import com.vdantsrpring.vdantsrpring.services.ProductServices;

@Controller
public class ProductController {

    @Autowired
    private ProductServices productService;

    // Show the list of active products
    @GetMapping("/products")
    public String showProducts(Model model) {
        List<Product> products = productService.getActiveProducts(); // Get products from service
        model.addAttribute("products", products); // Pass to view
        return "first"; // Return the name of your JSP, which is productList.jsp
    }

    // Handle deletion of a product
    @PostMapping("/delete")
    public String deleteProduct(@RequestParam("id") int id) {
        productService.deleteProductById(id);
        return "redirect:/products";  // Redirect back to the product list after deletion
    }

    // Handle adding a product to the cart (or similar action)
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("id") int id) {
        Product product = new Product();  // Assume you retrieve the product from DB
        product.setId(id);
        productService.addToCart(product);
        return "redirect:/products";  // Redirect back to the product list after adding to cart
    }
}
