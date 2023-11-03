package com.hyun.service;

import com.hyun.domain.AdminVO;

public interface AdminService {

	AdminVO admin_ok(String admin_id);
	
	void login_Date(String admin_id);
	
}
