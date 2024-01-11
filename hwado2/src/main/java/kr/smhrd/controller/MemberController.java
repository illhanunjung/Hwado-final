package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MemberController {
	@Autowired
	private kr.smhrd.mapper.select select;
	
	@RequestMapping("/")
	public String Test() {
		return "Test";
	}
	
	@RequestMapping("/select")
	public String select() {
		System.out.println("select() 동작");
		int n = select.test();
		System.out.println(n);
		System.out.println("성공");
		
		return "Test";
	}
	
}
