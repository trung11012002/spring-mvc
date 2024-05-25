package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.UserDTO;

public interface IUserService {
	List<UserDTO> findAll(Pageable pageable);
	UserDTO save(UserDTO userDTO);
	void delete(long ids[]);
	int getTotalItem();
	UserDTO findById(long id);
}
