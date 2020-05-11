package com.estore.controller;

import com.estore.model.Product;
import com.estore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RestProductController {

    @Autowired
    private ProductService productService;

    /**
     * Returns a product with the given productId
     * @param productId The id of the Product
     * @return The Product
     */
    @RequestMapping(value = "/api/product/{productId}", method = RequestMethod.GET)
    public Product getProduct(@PathVariable int productId) {
        return productService.getProductById(productId);
    }

    /**
     * Returns all products
     * @return List of all products
     */
    @RequestMapping(value = "/api/products", method = RequestMethod.GET)
    public List<Product> getAllProducts() {
        return productService.getProductList();
    }
}
