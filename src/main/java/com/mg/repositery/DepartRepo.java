package com.mg.repositery;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mg.model.*;

public interface DepartRepo extends JpaRepository<Department, Integer> {

	boolean existsByName(String name);

	List<Department> findAllByStatusTrue();

	Optional<Department> findByName(String name);

	List<Department> findByCity(String city);

}
