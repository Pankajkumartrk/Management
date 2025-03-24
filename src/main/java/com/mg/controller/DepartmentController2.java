//package com.mg.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.mg.model.Department;
//import com.mg.service.DepartmentService;
//
//import jakarta.servlet.http.HttpSession;
//
//@Controller
//public class DepartmentController2 {
//
//	@Autowired
//	private DepartmentService serv;
//
//	@GetMapping("/")
//	public String home() {
//
//		return "home";
//	}
//
//	@GetMapping("/register-dep")
//	public String register(HttpSession session) {
//
//		session.setAttribute("existValue", true);
//		session.setAttribute("NotexistValue", false);
//		return "register";
//	}
//
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
//
//	@GetMapping("/edit/{sno}")
//	public String editdep(@PathVariable("sno") int sno, Model model) {
//
//		Department dpp = serv.findUserSno(sno);
//		if (dpp == null) {
//			throw new RuntimeException("Department not found for S.No: " + sno);
//		}
//		System.out.println(dpp.getFile() + " this is file name");
//		String fname = dpp.getFile();
//		model.addAttribute("department", dpp);
//		model.addAttribute("files", fname);
//		return "edit";
//	}
//
//	@PostMapping("/update")
//	public String updateedit(@RequestParam("sno") int sno, @RequestParam("name") String name,
//			@RequestParam("file") MultipartFile file, @RequestParam("mobile") String mobile,
//			@RequestParam("city") String city, @RequestParam("address") String address) {
//
//		serv.savedeupdated(sno, name, file, mobile, city, address);
//		return "updated";
//	}
//
//	@GetMapping("/delete/{sno}")
//	public String editdep(@PathVariable("sno") int sno) {
//
//		boolean deleted = serv.deleteUser(sno);
//
//		return "deleted";
//	}
//
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
//
//	@GetMapping("/list-dep")
//	public String list(Model model) {
//		List<Department> lst = serv.getList();
//		model.addAttribute("dlst", lst);
//		return "savedata";
//	}
//
//}
