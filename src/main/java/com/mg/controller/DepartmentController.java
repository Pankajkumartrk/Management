package com.mg.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mg.model.Department;
import com.mg.service.DepartmentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService serv;

	@GetMapping("/")
	public String home() {

		return "home";
	}

	@GetMapping("/register-dep")
	public String register(HttpSession session) {

		session.setAttribute("existValue", true);
		session.setAttribute("NotexistValue", false);
		return "register";
	}

	@PostMapping("/saveDepartment")
	public String savedep(@RequestParam("name") String name, @RequestParam("file") MultipartFile file,
			@RequestParam("mobile") long mobile, @RequestParam("city") String city,
			@RequestParam("address") String address, Model model) {

		try {

			String number = String.valueOf(mobile);
			if (number.length() != 10) {
				model.addAttribute("error", "Mobile number must be exactly 10 digits!");
				return "FormvalidationError";

			}
			boolean check = serv.savedepart(name, file, mobile, city, address);

			if (!check) {
				System.out.println("dublicate controller");
				model.addAttribute("name", "Name already exist please !! retry?? ");

				return "FormvalidationError";
			}

		} catch (IOException e) {
			model.addAttribute("error", "Only PDF files are allowed!");
			return "filesize";
		}

		return "SucessRegister";
	}

//	@PostMapping("/saveDepartment")
//	public String savedep(@RequestParam("name") String name, @RequestParam("file") MultipartFile file,
//			@RequestParam("mobile") String mobile, @RequestParam("city") String city,
//			@RequestParam("address") String address, Model model) {
//
//		try {
//			serv.savedepart(name, file, mobile, city, address);
//
//		} catch (IOException e) {
//			model.addAttribute("error", "Only PDF files are allowed!");
//			return "filesize";
//		}
//
//		return "SucessRegister";
//	}

	@GetMapping("/edit/{sno}")
	public String editdep(@PathVariable("sno") int sno, Model model) {

		Department dpp = serv.findUserSno(sno);
		if (dpp == null) {
			throw new RuntimeException("Department not found for S.No: " + sno);
		}
		System.out.println(dpp.getFile() + " this is file name");
		String fname = dpp.getFile();
		model.addAttribute("department", dpp);
		model.addAttribute("files", fname);
		return "edit";
	}

	@PostMapping("/update")
	public String updateedit(@RequestParam("sno") int sno, @RequestParam("name") String name,
			@RequestParam("file") MultipartFile file, @RequestParam("mobile") long mobile,
			@RequestParam("city") String city, @RequestParam("address") String address, Model model) {

		String number = String.valueOf(mobile);
		if (number.length() != 10) {
			model.addAttribute("error", "Mobile number must be exactly 10 digits!");
			return "FormvalidationError";

		}
		boolean test = serv.savedeupdated(sno, name, file, mobile, city, address);
		if (!test) {
			System.out.println("dublicate controller");
			model.addAttribute("name", "Name already exist please !! retry?? ");

			return "FormvalidationError";
		}
		return "updated";
	}

	@GetMapping("/delete/{sno}")
	public String editdep(@PathVariable("sno") int sno) {

		boolean deleted = serv.deleteUser(sno);

		return "deleted";
	}

//	@PostMapping("/checkExistName")
//	@ResponseBody
//	public boolean validate(@RequestParam String name, Model model) {
//		System.out.println("called" + name);
//		boolean exists = serv.dublicfind(name);
//
//		System.out.println("Exists: " + exists);
//		
//		return exists;
//
//	}

	@GetMapping("/list-dep")
	public String list(Model model) {
		List<Department> lst = serv.getList();
		model.addAttribute("dlst", lst);
		return "savedata";
	}

	/*
	 * @GetMapping("/search-dep") public String seaarch() {
	 * 
	 * return "search"; }
	 * 
	 * @GetMapping("/search") public String geById(@RequestParam(value = "sno",
	 * required = false) Integer sno,
	 * 
	 * @RequestParam(value = "name", required = false) String name,
	 * 
	 * @RequestParam(value = "city", required = false) String city, Model model) {
	 * System.out.println("search");
	 * 
	 * if (sno != null) { System.out.println("search by id"); Department lst =
	 * serv.getBySno(sno); model.addAttribute("dlst", lst); } if (name != null &&
	 * !name.isEmpty()) {
	 * 
	 * System.out.println("search by name"); Department lst = serv.getByName(name);
	 * model.addAttribute("dlst", lst); }
	 * 
	 * return "department-sno"; }
	 * 
	 * @GetMapping("/search-city") public String seaarchCity() {
	 * 
	 * return "search-by-city"; }
	 * 
	 * @GetMapping("/searchCity") public String geById(@RequestParam("city") String
	 * city, Model model) { System.out.println("search city");
	 * 
	 * List<Department> lst = serv.getByCity(city); model.addAttribute("dlst", lst);
	 * 
	 * return "department-city"; }
	 */
	@GetMapping("/search-all")
	public String seaarchAll() {

		return "search-by-all";
	}

	@GetMapping("/searchAll")
	public String getAll(@RequestParam("filters") String filters, Model model) {
		System.out.println("search city");

		try {
			if (filters.matches("\\d+")) {
				Department lst = serv.getBySno(Integer.parseInt(filters));

				model.addAttribute("dlst", lst);

				return "department-sno";
			} else {

				List<String> cities = Arrays.asList("Delhi", "Noida", "Jaipur");
				// cities.stream().map(String::toLowerCase).collect(Collectors.toList());
				if (cities.contains(filters)) {
					System.out.println("City of :" + filters);
					List<Department> lst = serv.getByCity(filters);
					model.addAttribute("dlst", lst);
					return "department-city";
				} else {
					Department lst = serv.getByName(filters);
					model.addAttribute("dlst", lst);
					return "department-sno";
				}
			}
		} catch (NumberFormatException e) {
			model.addAttribute("error", "Invalid input format");
			return "UserIdNotFound";
		} catch (NoSuchElementException e) {
			model.addAttribute("error", "No matching records found");
			return "UserIdNotFound";
		}
	}
}
