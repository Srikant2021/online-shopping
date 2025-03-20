package com.vedant.crud.services;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vedant.crud.dto.EmployeeDto;
import com.vedant.crud.entity.Employee;
import com.vedant.crud.repository.EmployeeRepo;

@Service
public class EmployeeServices {
	@Autowired
	EmployeeRepo emprepo;

	public List<EmployeeDto> findAllEmployeesWithDesignation() {
		List<Object[]> results = emprepo.findAllEmployeesWithDesignation();

		// Map Object[] results to EmployeeDTO
		List<EmployeeDto> employees = new ArrayList<>();
		for (Object[] result : results) {
			Integer id = (Integer) result[0];
			String name = (String) result[1];
			String role = (String) result[2];
			String gender = (String) result[3];
			Date dob = (Date) result[4];
			String email = (String) result[5];
			double salary = (Double) result[6];

			// Format DOB
			// String formattedDob = new SimpleDateFormat("dd-MM-yyyy").format(dob);

			EmployeeDto employeeDTO = new EmployeeDto(id, name, role, gender, dob, email, salary);
			employees.add(employeeDTO);
		}

		return employees;
	}

	public List<String> getDesignations() {
		// Assuming you have a table 'designation' with a column 'role'
		return emprepo.findAllDesignations();
	}

	public void saveEmployee(Employee employee) {
		emprepo.save(employee);
	}

}
