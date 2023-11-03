package com.hyun.mapper;

import com.hyun.domain.AdminVO;

public interface AdminMapper {

	AdminVO admin_ok(String admin_id);
	
	void login_Date(String admin_id);
}
