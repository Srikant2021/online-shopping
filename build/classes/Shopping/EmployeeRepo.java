package com.vedant.crud.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vedant.crud.entity.Employee;

public interface EmployeeRepo extends JpaRepository<Employee, Integer> {

	@Query("SELECT e.id, e.name, d.role, e.gender, e.dob, e.email, e.salary " + "FROM Employee e JOIN e.designation d")
	List<Object[]> findAllEmployeesWithDesignation();

	@Query("SELECT e.role FROM Designation e")
	List<String> findAllDesignations();

}
