package com.hyun.service;

import org.springframework.stereotype.Service;

import com.hyun.mapper.OrderMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {
	
	private final OrderMapper orderMapper;

}
