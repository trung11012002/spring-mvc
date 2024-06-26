package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;

@Component
public class RoleConverter {
	public RoleDTO toDto(RoleEntity entity) {
		RoleDTO dto = new RoleDTO();
		dto.setId(dto.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		return dto;
	}
}
