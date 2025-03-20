package com.vedant.crud.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vedant.crud.entity.Designation;

@Repository
public interface DesingnationRepository extends JpaRepository<Designation, Integer> {

}
