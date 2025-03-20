package com.vedant.crud.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vedant.crud.entity.Designation;
import com.vedant.crud.repository.DesingnationRepository;

@Service
public class DesignationServices {
	@Autowired
	DesingnationRepository designrepo;

	// Method to fetch all designations
	public List<Designation> getAllDesignations() {
		return designrepo.findAll();
	}
}
