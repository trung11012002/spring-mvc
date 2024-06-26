package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.RoleConverter;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.service.IRoleService;

@Service
public class RoleService implements IRoleService{
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private RoleConverter roleConverter;
	@Override
	public List<RoleDTO> findAll() {
		List<RoleEntity> entities = roleRepository.findAll();
		List<RoleDTO> result = new ArrayList<>();
		for(RoleEntity entity : entities) {
			result.add(roleConverter.toDto(entity));
		}
		return result;
	}

}
