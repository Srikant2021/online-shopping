package com.vdantsrpring.vdantsrpring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vdantsrpring.vdantsrpring.entity.Product;

public interface ProductRepo extends JpaRepository<Product, Integer> {
    // You can define custom queries here if needed
}

