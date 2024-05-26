package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.CategoryDTO;

public interface ICategoryService {
	Map<String,String>findAll();
	List<CategoryDTO> findAllList(Pageable pageable);
	int getTotalItem();
	CategoryDTO finById(long id);
	CategoryDTO save(CategoryDTO categoryDTO);
	void delete(long ids[]);
}
