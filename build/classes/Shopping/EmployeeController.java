package com.vedant.crud.controller;

import com.vedant.crud.dto.EmployeeDto;
import com.vedant.crud.entity.Designation;
import com.vedant.crud.entity.Employee;
import com.vedant.crud.services.DesignationServices;
import com.vedant.crud.services.EmployeeServices;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeServices empservice;
	@Autowired
	DesignationServices desgserice;

	@GetMapping("/emp")
	public String showEmployeeList(Model model) {
		List<EmployeeDto> employees = empservice.findAllEmployeesWithDesignation();
		model.addAttribute("employees", employees);
		return "one";
	}

	@GetMapping("/addEmployee")
	public String showEmployeeForm(HttpServletRequest request) {
		// Fetch designations from the service
		List<Designation> designations = desgserice.getAllDesignations();
		// Set designations as an attribute for the JSP
		request.setAttribute("designations", designations);
		// Return the name of the JSP page to display
		return "NewFile1"; // assuming the JSP is named employeeForm.jsp
	}

	@PostMapping("/submitEmployee")
	public String submitEmployee(@ModelAttribute Employee employee) {
		// Save the employee to the database
		System.out.println(employee);
		empservice.saveEmployee(employee);
		// Redirect to the employee list or home page
		return "redirect:/emp"; // Redirect to the employee list page
	}
}
