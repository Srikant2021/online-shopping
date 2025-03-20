package com.vedant.crud.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EmployeeDto {
	private Integer id;
	private String name;
	private String role;
	private String gender;
	private Date dob;
	private String email;
	private double salary;

}
