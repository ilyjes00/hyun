package com.hyun.service;

import org.springframework.stereotype.Service;

import com.hyun.mapper.QnaMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class QnaServiceImpl implements QnaService {

	private final QnaMapper qnaMapper;

}
