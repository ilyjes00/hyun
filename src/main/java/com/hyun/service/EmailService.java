package com.hyun.service;

import com.hyun.dto.EmailDTO;

public interface EmailService {

	void sendMail(EmailDTO dto, String message);
}
