package com.mg.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.mg.model.Department;
import com.mg.repositery.DepartRepo;

@Service
public class DepartmentService {
	private static final String UPLOAD_DIR = "pdf/";

	@Autowired
	private DepartRepo repo;

	public boolean savedepart(String name, MultipartFile file, long mobile, String city, String address)
			throws IOException {

		String orgName = file.getOriginalFilename();
		String contentType = file.getContentType();

		if (orgName == null || !orgName.toLowerCase().endsWith(".pdf")
				|| !"application/pdf".equalsIgnoreCase(contentType)) {
			System.out.println("checking pdf");
			throw new IOException("Only PDF files are allowed! ");
		}

		Path path = Paths.get(UPLOAD_DIR + orgName);
		Files.write(path, file.getBytes());

		Department dps = new Department();

		if (dublicfind(name) == false) {
			System.out.println("check ok" + dublicfind(name));
			dps.setName(name);
			dps.SetFile(orgName);
			dps.setMobile(mobile);
			dps.setCity(city);
			dps.setAddress(address);
			dps.setStatus(true);
			repo.save(dps);
			return true;
		} else {
			System.out.println("check name dublicate " + dublicfind(name));
			return false;

		}

	}

	public Department findUserSno(int sno) {
		return repo.findById(sno)
				.orElseThrow(() -> new NoSuchElementException("User with S.No " + sno + " does not exist"));
	}

	public boolean savedeupdated(int sno, String name, MultipartFile file, long mobile, String city, String address) {
		Department dps = new Department();
		String filename = file.getOriginalFilename();
		Path path = Paths.get(UPLOAD_DIR + filename);
		try {
			Files.write(path, file.getBytes());
		} catch (IOException e) {

			e.printStackTrace();
		}
		System.out.println(" update name " + name);

		if (dublicfind(name) == false || name.equals(name)) {
			dps.setSno(sno);
			dps.setName(name);
			dps.SetFile(filename);
			dps.setMobile(mobile);
			dps.setCity(city);
			dps.setAddress(address);
			dps.setStatus(true);
			repo.save(dps);
			return true;

		} else {
			System.out.println("Dublicaate name is there");
			return false;
		}

	}

	public boolean deleteUser(int sno) {
		Optional<Department> uid = repo.findById(sno);

		if (uid.isPresent()) {
			Department value = uid.get();
			if (value.isStatus()) {
				System.out.println("deleted");
				value.setStatus(false);
				repo.save(value);
				return true;
			}
		}

		System.out.println("deleted");
		return false;

	}

	public boolean dublicfind(String name) {

		return repo.existsByName(name);
	}

	public List<Department> getList() {
		List<Department> lsst = repo.findAllByStatusTrue();
		return lsst;
	}

	public Department getBySno(int sno) {

		Department dep = repo.findById(sno).get();

		

		return dep;

	}

	public Department getByName(String name) {
		Department dep = repo.findByName(name).get();
		return dep;
	}

	public List<Department> getByCity(String city) {
		List<Department> dep = repo.findByCity(city);
		System.out.println(" city " + dep);
		return dep;
	}

}
