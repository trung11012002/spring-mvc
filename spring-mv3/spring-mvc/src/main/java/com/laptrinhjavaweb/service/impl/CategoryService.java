package com.laptrinhjavaweb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService{
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	CategoryConverter categoryConverter;

	@Override
	public Map<String,String> findAll() {
		// TODO Auto-generated method stub
		Map<String,String> result = new HashMap<>();
		List<CategoryEntity> entitys = categoryRepository.findAll();
		for(CategoryEntity item : entitys) {
			result.put(item.getCode(),item.getName());
		}
		return result;
	}
}
