package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.smhrd.mapper.UsersMapper;

@Controller
public class UsersController {
	
	@Autowired
	private UsersMapper mapper;

}
