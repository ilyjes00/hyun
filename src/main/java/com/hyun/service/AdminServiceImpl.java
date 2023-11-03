package com.hyun.service;

import org.springframework.stereotype.Service;

import com.hyun.domain.AdminVO;
import com.hyun.mapper.AdminMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service //bean 생성및등록 : AdminServiceImpl
public class AdminServiceImpl implements AdminService {

	
	private final AdminMapper adminMapper;

	@Override
	public AdminVO admin_ok(String admin_id) {
		// TODO Auto-generated method stub
		return adminMapper.admin_ok(admin_id);
	}

	@Override
	public void login_Date(String admin_id) {
		// TODO Auto-generated method stub
		adminMapper.admin_ok(admin_id);
	}
	
	/*
	public AdminServiceImpl(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}*/
	
}
