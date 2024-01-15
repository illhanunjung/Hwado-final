package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Users;
import kr.smhrd.mapper.UsersMapper;

@Controller
public class UsersController {
	
	@Autowired 
	private UsersMapper usersMapper;
	
	@RequestMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	// 회원가입 
	@RequestMapping("/usersInsert")
	public String usersInsert(Users users, Model model) {
		System.out.println(users.toString());
		usersMapper.usersInsert(users); // 인터페이스는 추상메소드만 존재
		model.addAttribute("user_email",users.getUser_email());
		return "signin";
	}
	
	//Email 중복체크
	@RequestMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("inputE") String inputE) {
		System.out.println("[emailCheck]");
		Users users = usersMapper.emailCheck(inputE); //인터페이스 안의 추상메소드
		
		if(users != null) {
			//사용 불가능한 이메일
			return 0;
		}else {
			//사용 가능한 이메일
			return 1;
		}
	}
	

	
	@RequestMapping("/userSelect")
    public String userSelect(Users users, HttpSession session) {
        System.out.println("로그인 시도: Email: " + users.getUser_email() + ", Password: " + users.getUser_pw());
        Users userLogin = usersMapper.userSelect(users);
        System.out.println(userLogin.toString());
        if (userLogin != null) {
            session.setAttribute("userLogin", userLogin);
            return "main"; // 로그인 성공 시 리다이렉트
        } else {
            return "redirect:/signin"; // 로그인 실패 시 리다이렉트
        }
    }
	
	@RequestMapping("/main")
	public String main(HttpSession session, Model model) {
	    Users userLogin = (Users) session.getAttribute("userLogin");
	    if (userLogin != null) {
	        session.setAttribute("userEmail", userLogin.getUser_email());
	        session.setAttribute("userName", userLogin.getUser_name());
	        session.setAttribute("userNick", userLogin.getUser_nick());
	        session.setAttribute("userBirthdate", userLogin.getUser_birthdate());
	        session.setAttribute("userRole", userLogin.getUser_role());
	        session.setAttribute("joinedAt", userLogin.getJoined_at());

	        return "redirect:/main";
	    } else {
	        return "redirect:/signin";
	    }
	}
	
	
}//class
